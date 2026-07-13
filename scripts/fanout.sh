#!/usr/bin/env bash
# fanout.sh <run_dir> <mode> [grok_prompt_file] [codex_prompt_file] [out_prefix]
#   Grok + Codex lanes, parallel. mode: a|standard | b|efficiency | c|insight
# Round 1: omit prompt files (both lanes read <run_dir>/prompt.txt), no prefix.
# Revision round: pass PER-LANE prompt files (each lane sees different peer drafts)
#   and an out_prefix like "r2-"  → writes r2-grok.* / r2-codex.*.
# Writes <prefix><name>.{out,err,meta,ok} per lane. Meta files are authoritative,
# not the exit code. The Fable panelist/reviser/judge run as Agent-tool calls, not here.
set -uo pipefail

RUN="${1:?run dir}"; MODE="${2:-a}"
GPF="${3:-$RUN/prompt.txt}"           # grok prompt file
CPF="${4:-$RUN/prompt.txt}"           # codex prompt file
PFX="${5:-}"                          # output-name prefix (e.g. r2-)
[[ -s "$GPF" ]] || { echo "empty grok prompt: $GPF" >&2; exit 2; }
[[ -s "$CPF" ]] || { echo "empty codex prompt: $CPF" >&2; exit 2; }

GROK_M=grok-4.5; CODEX_M=gpt-5.6-sol; MAXB=524288
case "$MODE" in
  a|standard)   GROK_E=medium; CODEX_E=medium; T=240 ;;
  b|efficiency) GROK_E=low;    CODEX_E=low;    T=120 ;;
  c|insight)    GROK_E=high;   CODEX_E=high;   T=600 ;;
  *) echo "unknown mode: $MODE (use a|b|c)" >&2; exit 2 ;;
esac

# preflight: skip a lane cleanly if its CLI is absent
command -v grok  >/dev/null || echo missing >"$RUN/${PFX}grok.missing"
command -v codex >/dev/null || echo missing >"$RUN/${PFX}codex.missing"

tmo() {                                   # timeout with macOS fallback
  if   command -v timeout  >/dev/null; then timeout  "$@"
  elif command -v gtimeout >/dev/null; then gtimeout "$@"
  else shift; "$@"; fi
}

GPROMPT=$(cat "$GPF"); CPROMPT=$(cat "$CPF")

lane() {                                  # lane <name> <argv...> — no eval, no bash -c
  local name="$1"; shift
  [[ -e "$RUN/${PFX}$name.missing" ]] && { echo "rc=127 seconds=0 bytes=0 timeout=$T" >"$RUN/${PFX}$name.meta"; return; }
  local t0=$SECONDS rc
  tmo "$T" "$@" </dev/null 2>"$RUN/${PFX}$name.err" | head -c "$MAXB" >"$RUN/${PFX}$name.raw"
  rc=${PIPESTATUS[0]}                     # 124 = timeout
  printf 'rc=%s seconds=%s bytes=%s timeout=%s\n' "$rc" "$((SECONDS-t0))" \
    "$(wc -c <"$RUN/${PFX}$name.raw" | tr -d ' ')" "$T" >"$RUN/${PFX}$name.meta"
}

lane grok  grok -p "$GPROMPT" -m "$GROK_M" --effort "$GROK_E" &
p1=$!
lane codex codex exec -s read-only --skip-git-repo-check \
     -m "$CODEX_M" -c "model_reasoning_effort=$CODEX_E" -- "$CPROMPT" &
p2=$!
wait "$p1"; wait "$p2"

# normalize: strip NULs + ANSI escapes
for name in grok codex; do
  [[ -e "$RUN/${PFX}$name.raw" ]] || continue
  LC_ALL=C tr -d '\000' <"$RUN/${PFX}$name.raw" \
    | sed -E $'s/\x1b\\[[0-9;]*[A-Za-z]//g' >"$RUN/${PFX}$name.out"
done

# codex exec prints a transcript (banner, echoed prompt, "tokens used" trailer,
# then the final message). Keep only text after the last "tokens used" line.
if [[ -s "$RUN/${PFX}codex.out" ]]; then
  awk '{l[NR]=$0} /^tokens used/{m=NR} END{s=m?m+2:1; for(i=s;i<=NR;i++)print l[i]}' \
    "$RUN/${PFX}codex.out" >"$RUN/${PFX}codex.tmp" && mv "$RUN/${PFX}codex.tmp" "$RUN/${PFX}codex.out"
fi

# usability gate: rc==0 AND >=40 non-space chars AND not an auth/HTML error page
usable=0
for name in grok codex; do
  [[ -e "$RUN/${PFX}$name.meta" && -e "$RUN/${PFX}$name.out" ]] || continue
  rc=$(sed -n 's/^rc=\([0-9]*\).*/\1/p' "$RUN/${PFX}$name.meta")
  chars=$(tr -d '[:space:]' <"$RUN/${PFX}$name.out" | wc -c | tr -d ' ')
  if [[ "$rc" == 0 && "$chars" -ge 40 ]] && \
     ! grep -qiE '^<!doctype|^<html|not (logged in|authenticated)|please (log ?in|sign ?in)' "$RUN/${PFX}$name.out"; then
    echo usable >"$RUN/${PFX}$name.ok"; usable=$((usable+1))
  fi
done
echo "cli_lanes_usable=$usable  mode=$MODE  prefix=${PFX:-none}  grok_effort=$GROK_E  codex_effort=$CODEX_E"
exit 0
