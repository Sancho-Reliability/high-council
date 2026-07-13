# High Council

A hardened multi-model **council** skill for [Claude Code](https://claude.com/claude-code):
run one prompt through three independent frontier models — **Grok** (xAI), **Codex**
(OpenAI), and **Fable/Claude** (Anthropic) — as parallel drafts, an adaptive
(disagreement-gated) anonymized peer-revision round, and a fresh, rubric-first, bias-aware
judge that synthesizes one superior answer.

It is a successor to a simpler `model-council`, adding four things that matter when the
answer is high-stakes:

1. **Folded router-judge** — the first judge call classifies disagreement *and* synthesizes
   directly when the models already agree, so the consensus path costs no more than a single
   round. A full peer-revision round only fires when the models genuinely disagree.
2. **Task-derived rubric, frozen before any candidate exists** — a low-cost clerk writes the
   grading criteria from the task alone, so no candidate can lobby the judge.
3. **Layered prompt-injection defense** — unforgeable per-pack delimiters, a canary token, a
   sandwich boundary, and delimiter-stripping (spotlighting / StruQ-style). Candidate text is
   treated as untrusted data at every stage, and a mechanical leak-check runs before delivery.
4. **Structural anonymity** — the orchestrator never reads candidate text into its own
   context (all packing/gating happens in Bash), and the label→model map is printed only to a
   tool result, never written to disk. Fresh random labels are generated per pack.

## Pipeline

```
prompt
  ├─ 3 independent drafts (Grok ∥ Codex ∥ Fable)   ┐ all parallel
  └─ rubric clerk (frozen criteria)                ┘
        → router-judge  (rubric + blind scoring + disagreement classification)
             ├─ LOW disagreement → synthesize now (DIRECT)
             └─ MED/HIGH        → anonymized peer-revision round → fresh final judge
        → post-check (canary/marker leak scan, format, confidence cap)
        → one synthesis + a footer revealing the label→model map
```

## Modes

| Mode | Behavior | Use it for |
|---|---|---|
| `a` — standard (default) | adaptive: revises only when the models disagree | most high-stakes judgment calls |
| `b` — efficiency | single round, always-direct, low effort | fast, cheap consensus checks |
| `c` — insight | always revise, max-effort judge | when quality justifies the cost |

Modes change **reasoning effort and depth, never model tier** — "cut effort, not tier."

## What it's good for (and what it isn't)

**Best fit:** high-stakes, open-ended *judgment* with no ground truth and a real disagreement
surface — strategy, go/no-go, design tradeoffs, risk assessment — and adversarial **review /
audit** of a concrete artifact. The value is that the router makes hidden cross-model
disagreement visible and the judge adjudicates by evidence, not by vote.

**Poor fit — a better method exists:**
- **Producing a large deliverable** (code, documents): the council deliberates, it doesn't
  manufacture. Use direct model calls or a fan-out workflow; the council belongs *before*
  (to decide) and *after* (to review), not in the middle.
- **Anything with a checkable ground truth** (math, code that compiles, factual lookup): a
  single strong model **+ tool/test execution** beats a vote — executed tests are ground
  truth.
- **Trivial or fast-iteration tasks:** just answer directly; the plumbing is pure overhead.

## Requirements

This is a **Claude Code skill**. It expects:
- Claude Code with the `Agent` tool (used to spawn the Fable/Claude panelist, rubric clerk,
  reviser, and judge sub-agents).
- A `grok` CLI on `PATH` (xAI).
- A `codex` CLI on `PATH` (OpenAI), invoked read-only.

Model IDs are set in `scripts/fanout.sh` and the sub-agent prompts (`grok-4.5`,
`gpt-5.6-sol`, and Claude/Fable via the `Agent` tool). Swap them for whatever three
independent models you have — the design only assumes **three genuinely different model
families** plus a judge. A lane that is missing or errors is dropped gracefully; the
confidence cap scales with the number of usable lanes (3 → High, 2 → Medium, 1 → Low).

Shell note: the packing/anonymization snippets are written to be correct under both `bash`
and `zsh` (the counter uses `i=$((i+1))` and labels are picked by character position, never
by word-splitting or `++`).

## Install

Drop the folder into your Claude Code skills directory:

```bash
git clone https://github.com/Sancho-Reliability/high-council.git ~/.claude/skills/high-council
chmod +x ~/.claude/skills/high-council/scripts/fanout.sh
```

Then invoke it in Claude Code with `/high-council`, or ask for "a high council" on a
high-stakes question. Pass a mode as the first token, e.g. `/high-council c <your prompt>`.

## How it works

`SKILL.md` is the full orchestration spec the model follows step by step. `scripts/fanout.sh`
runs the two CLI lanes (Grok + Codex) in parallel, normalizes their transcripts, and gates
each lane on a usability check; the same script serves both the first round and the
per-lane peer-revision round via an output prefix.

## Research basis

- Mixture-of-Agents — https://github.com/togethercomputer/MoA
- LLM-as-judge (rubric + bias) — https://github.com/CSHaitao/Awesome-LLMs-as-Judges
- Prompt-injection defenses (spotlighting / delimiters / StruQ) —
  https://github.com/tldrsec/prompt-injection-defenses
- Canary-token leakage detection — https://github.com/protectai/rebuff

Defense-in-depth, not guarantees: when a safety check fails, the skill aborts rather than
improvising a result.

## License

MIT — see [LICENSE](LICENSE).
