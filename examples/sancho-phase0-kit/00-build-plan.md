# Sancho Phase-0 Operator Kit — Final Build Plan

## Kit Definition-of-Done

One versioned folder; one file per artifact; every artifact has exactly one owner. Workstream A builds #1–8; Workstream B builds #9–15. The kit contains exactly:

1. **Targeting & screening rubric + target-list template** — qualifies prospects into the three buyer classes; hard disqualifiers; the ">$25k tool-eval spend" test operationalized; 15-slot class-mix plan with replacement rules.
2. **Three interview guides** — enterprise (platform/security/procurement), vendor engineering, risk-side.
3. **Outreach sequence pack** — per class: cold email sequence, LinkedIn variant, referral ask, booking + consent script, logging fields.
4. **Instrument-capture & scoring ledger** — classifies every conversation A/B/C/zero with required evidence.
5. **Enterprise-questionnaire audit method** — SOP + gap-map template locating where reliability language does/doesn't exist in a buyer's RFP/questionnaire.
6. **Weekly PASS/KILL dashboard** — one page, thresholds verbatim.
7. **Decision memo template** — mandatory day 90; usable at day-30/60 checkpoints.
8. **Operator runbook / kit README** — folder map, weeks 1–13 cadence, assembly order.
9. **Metric-panel definition (`MP-1`)** — five metrics, formulas, gaming analysis, severity rubric.
10. **Dry-run/COGS measurement protocol** — instrumented full evaluation of one agent; sealed-suite handling section incl. refuse-customize script; timesheet; cost model; report template; output ID `COGS-OUT`.
11. **Publication-integrity spec (`PI-1`)** — public run registry + unsuppressible black-box panel; suppression-vector analysis.
12. **Paid-pilot offer sheet + terms template** — the instrument-A closing document.
13. **RFP-insertion language pack** — paste-ready clause `RFPI-1` + questionnaire item `RFPI-2` (instrument-B closing document).
14. **Underwriter/assurance LOI template** — the risk-side closing document (PASS route 3).
15. **Hard-rules compliance checklist** — the final QA gate, run over the whole assembled kit.

That is the union; nothing else is in scope.

## Workstream A

**Demand-Discovery Instruments (Builder 1). Artifacts #1–8.** Coherence: everything the founder uses to find, qualify, run, score, and decide ~15 conversations. No evaluation internals; no closing paperwork (that lives with the definitions it embeds, in B). **Fixed inputs:** the complete block in the Integration Note — request nothing more. **Effort:** ~5 builder-days, writing-heavy.

**#1 Targeting rubric + target list** (2 pp + sheet). Per class: 5–8 qualifying criteria, ≥3 hard disqualifiers (e.g., no deployment authority; vendor-paid-badge interest), title/keyword sourcing lists, 5-question screening script verifying "approved or blocked a coding-agent deployment" and ">$25k tool-eval spend" (verification method: named line item, tool, quarter — not self-report alone). Sheet: ≥30 prospects capacity, 15 pre-labeled slots (default 7 enterprise / 4 vendor / 4 risk), replacement rule ≤5 lines. *Accept:* two independent scorers agree on qualify/reject for ≥9 of 10 supplied synthetic fixtures using only the rubric; no enthusiasm-based qualifier anywhere.

**#2 Interview guides** (3 docs, 2–4 pp each). Each: 60-sec framing script; ≤12 primary questions, each tagged to the hypothesis it tests (will an economically-exposed downstream buyer require and pay for independent completion-reliability evidence?); verbatim instrument-ask block (exact words proposing a >=$10k non-refundable pilot; exact words asking for a written RFP-insertion commitment); objection map ≥6; "verbal enthusiasm = zero" printed on each guide. Risk-side guide probes what evidence standard would support an underwriter/assurance LOI; vendor guide probes private failure-discovery purchasing. *Accept:* fits a 30-minute call at ≤120 wpm read-through; every question maps to a decision or instrument; grep finds zero "lie" and no detection claim beyond ~7% recall; pilot fact appears only in the fixed citation format.

**#3 Outreach pack** (~6 pp). Per class: 3–4 touches, emails ≤120 words with subject lines, LinkedIn message ≤60 words, referral paragraph, booking + consent script, stop rule. Hook = the buyer's exposure (outages, underwriting loss, audit gap). Logging fields: class, date, consent, contact, org, source, next action. *Accept:* one specific ask per message; logging fields match ledger #4 column names; grep-clean per checklist #15 items; ~24% figure always in fixed citation format.

**#4 Instrument ledger** (spreadsheet + 1-pp rules + 8 synthetic fixtures). Columns: row ID, date, org, class, contact, budget owner named? (Y/N + name), instrument A/B/C/zero, evidence link, amount, refundability, signer, status, scorer. Rules: A requires countersigned terms + invoice >=$10k marked non-refundable; B requires written commitment on buyer letterhead/email naming the questionnaire and timeline; C requires the >$25k verification per #1; else zero. Scoring uses the fixed instrument-tier block only — never a B-stream document. *Accept:* two independent scorers classify all 8 fixtures identically from the written rules alone; sheet structurally blocks A without amount >=10000 + "non-refundable", and B without an attached document; tally formulas count only qualifying rows.

**#5 Questionnaire audit method** (2–3 pp + gap-map template). Steps: obtain buyer's current questionnaire/RFP → keyword scan (list provided: reliability, completion, hallucination, SLA, evaluation, benchmark, incident, rollback…) → gap map (section / current language / gap / recommended insertion citing fixed IDs `RFPI-1`, `RFPI-2`) → buyer readout email. *Accept:* a cold reader audits a supplied fixture questionnaire in ≤2 hours; output attaches as ledger row-B evidence.

**#6 Dashboard** (1 page). Counters: non-refundable pilots >=$10k; written RFP insertions; underwriter/assurance LOIs; named budget owners; RFP/questionnaire presence Y/N; conversations vs 15 by class; days elapsed; cash vs ~$6k. *Accept:* fillable ≤5 minutes; one completed example week; no PASS path via C-tier counts; PASS/KILL text diffs character-clean against the canonical block.

**#7 Decision memo template** (≤2 pp). Forces exactly one of GO / KILL / one named pivot; every claim cites ledger row IDs (fields structurally require them); evidence table precedes verdict; KILL triple-zero check explicit; COGS field named `COGS-per-run` mapping to `COGS-OUT`; "what would have changed the outcome" section. *Accept:* cannot be completed without row-ID citations and the COGS field; PASS/KILL character-diff clean.

**#8 Runbook/README** (≤2 pp). Folder map + naming convention; weeks 1–13 cadence (outreach volume, conversation quota, weekly dashboard update, dry-run scheduling window, day-30/60 checkpoints, day-90 memo); assembly checklist ending with the #15 sweep. *Accept:* names all 15 DoD artifacts and owners; references only DoD numbers, fixed IDs, and shared conventions; a reviewer can trace one synthetic lead from targeting to memo with no omitted step.

## Workstream B

**Evaluation & Integrity Machinery (Builder 2). Artifacts #9–15.** Coherence: what Sancho measures, what a run costs, why results can't be suppressed or gamed — plus the three closing documents, placed here because their substance (metric panel, sealed suite, registry sections, unwaivable black-box clause text) is authored in this stream, so the owner holds every definition they cite; A needs only fixed IDs. No outreach material. **Fixed inputs:** same block as A; price fields stay parameterized — COGS arrives only when the founder later executes the dry run (post-build; never a mid-build dependency). **Effort:** ~5 builder-days, design-heavy.

**#9 Metric-panel definition `MP-1`** (3–5 pp; build FIRST — #10–14 cite it). For each canonical metric — false-completion rate, completions-per-assigned-task, abstention rate, cost, severity-weighted harm — formula with explicit numerator/denominator, unit, capture point within a run, missing-data rule, ≥1 gaming vector + countermeasure (e.g., inflating abstention to suppress false completions is exposed by completions-per-assigned-task). Severity rubric: ≥4 levels, one concrete anchor each. Pairing rationale (why false-completion rate is never reported alone) ≤100 words. *Accept:* an engineer computes all five from a supplied synthetic raw run log with no judgment beyond the severity rubric; two worked examples recompute correctly; names exact-string match; component metrics remain visible if any composite is shown.

**#10 Dry-run/COGS protocol** (4–6 pp + timesheet + cost model + report template). Task-suite selection and sealing (hash committed before run; suite never shown to vendor); sealed-suite handling section: custody rules + 2–3-sentence refuse-customize script, hard rule 1 verbatim; environment/agent-version pinning; step-by-step procedure with owner, tool, output file per step; phases setup/execution/adjudication/severity scoring/reporting; expert-hours timesheet at ≤15-minute granularity by phase; cost model computing fully-loaded cost-per-evaluation under three wage assumptions with floor check against >=$10k; output ID `COGS-OUT` = expert-hours total + cash total + floor check. *Accept:* cold read-through yields zero clarifying questions; every `MP-1` metric has a named capture step; report template cannot omit any of the five metrics and requires an integrity-incident Y/N; cost model recomputes when any input changes.

**#11 Publication-integrity spec `PI-1`** (3–5 pp). Registry schema (`PI-1 §Registry`): run ID, agent name + version hash, sealed-suite hash, timestamps, full five-metric panel, status, withdrawal/noncompletion reason, publication timestamp, correction log (correction-without-deletion). Append-only mechanism named concretely: signed hash chain posted publicly at run START — start-registration makes suppression visible. Black-box panel: minimal metric subset published for every registered run regardless of outcome, with unwaivable contractual clause text (verbatim source for #12). Suppression analysis: ≥5 vectors (contractual pressure, selective publication, indefinite delay, cherry-picked suite, quiet re-runs until pass), each with its defeating mechanism. Relevant hard rules verbatim. *Accept:* reviewer can point to the specific mechanism defeating each vector; schema implementable as a table with no added fields; verbatim blocks diff-clean.

**#12 Pilot offer + terms** (1-pp offer + 2–3-pp terms). Offer: private evaluation of one named agent against the sealed suite; deliverable = five-metric panel + severity detail + registry entry per `PI-1 §Registry`; timeline; price field `[PRICE >= $10,000]`; "non-refundable" in both documents. Terms embed: the #11 unwaivable black-box clause; no cert-prep consulting; no customization of the sealed suite; payment is for the run, never for a passing score. *Accept:* a procurement lead could sign without a call; no SLA on passing; hard-rules constraints section character-diff clean (all five clauses); price parameterized with floor stated; language matches the fixed instrument-A definition exactly.

**#13 RFP-insertion pack** (2 pp). `RFPI-1` (full clause, ~300 words) and `RFPI-2` (questionnaire item, ~50 words). Each requires vendors to supply the five-metric panel from an independent, registered evaluation; acceptable evidence = a public registry entry per `PI-1 §Registry`; vendor-neutral (any conforming independent evaluator qualifies). *Accept:* paste-ready with only `[BUYER]` fields; canonical metric names exact; a reviewer can verify vendor compliance yes/no from the clause alone.

**#14 Underwriter/assurance LOI template** (1–2 pp, non-binding). States the underwriting/assurance use of the five-metric panel; references `PI-1 §Registry` evidence; no pass-score guarantee; no cert-bank access. *Accept:* uses the five metric names exactly; signature block + named-use field required; passes checklist #15.

**#15 Hard-rules compliance checklist** (1 page, binary, fail-closed). Yes/no items covering all five hard-rule clauses plus the unaudited-figure caveat, each verifiable by grep or read (grep "lie" in company-specific public copy; grep detection claims beyond ~7% recall; grep five metric strings; character-diff PASS/KILL and hard-rule occurrences; presence check for DoD #1–14; signed log field). *Accept:* applied to #12–14 pre-handoff with a signed log; any failed item blocks release; designated the final gate over the assembled kit.

## Integration Note

**Assembly:** merge `a-demand/` and `b-integrity/` under one root per #8's map; wiring is by fixed IDs only — #5 cites `RFPI-1`/`RFPI-2`; #7's `COGS-per-run` maps to `COGS-OUT`; #12 and #14 cite `PI-1 §Registry`; ledger #4 scores evidence against the fixed instrument-tier block (countersigned #12 = A-evidence; #13-based commitment = B-evidence; signed #14 = LOI). Final gate: run #15 over the entire assembled kit. No mid-build exchange.

**Fixed shared inputs (both builders reproduce in their brief header; paste, never paraphrase):**
- **Buyer classes:** (1) enterprise platform/security/procurement leads who have approved or blocked a coding-agent deployment; (2) agent vendors (engineering teams, private failure-discovery); (3) risk-side: AI-assurance bodies, an AI-liability carrier/MGA, a Big-4 assurance practice.
- **Instrument tiers, verbatim:** (A) non-refundable paid pilot >=$10k = gold; (B) written commitment to insert a reliability metric-panel into RFP/questionnaire language = silver; (C) named budget owner with recent >$25k tool-eval spend = discovery only; verbal enthusiasm = zero.
- **Thresholds, verbatim wherever stated:** PASS = >=2 non-refundable pilots >=$10k, OR >=3 written RFP-insertion commitments, OR >=1 underwriter/assurance LOI + >=1 non-refundable pilot. KILL = zero named budget owners AND zero RFP/questionnaire presence AND zero non-refundable dollars by day 90.
- **Hard rules (five clauses), verbatim wherever touched:** the sealed evaluation "cert bank" is never sold / trained on / customized per vendor; customers pay for the run, never for a passing score; no cert-prep consulting; never market detection beyond ~7% recall; the word "lie" is banned from company-specific public copy.
- **Canonical metric strings:** `false-completion rate`, `completions-per-assigned-task`, `abstention rate`, `cost`, `severity-weighted harm` — never abbreviated on first buyer-facing use.
- **Pilot-fact citation:** "~24% of fresh 'done' claims are silently false (founder-measured, unaudited; N=112; CI 17-33%)."
- **Fixed IDs:** `MP-1`, `PI-1`, `PI-1 §Registry`, `RFPI-1`, `RFPI-2`, `COGS-OUT`. **Files:** `p0-[a|b]-[nn]-[slug].md` (sheets `.xlsx`, snake_case columns). **Envelope:** ~90 days, ~$6k cash, ~15 conversations.

**Top seam risks:**
1. **Metric-name drift** — A's guides paraphrase ("failure rate") vs B's clauses. Mitigation: grep both folders for the five canonical strings at assembly.
2. **Evidence-definition divergence** — ledger #4 and terms #12/LOI #14 read "non-refundable"/"written commitment" differently, corrupting PASS scoring. Mitigation: both quote the fixed instrument-tier block only; at assembly, run ledger fixtures against B's signed-document templates and reconcile side-by-side.
3. **Pricing circularity** — #12 needs a price; COGS arrives post-dry-run. Mitigation: price stays parameterized at the $10k floor; first pilot priced at floor if COGS is late; `COGS-OUT` maps into memo #7 by field name.
4. **Compliance leakage across ownership** — a banned claim slips into A's outreach because checklist #15 lives in B. Mitigation: #15 is fail-closed and runs over the whole assembled kit as the last gate, with a signed log.
5. **Threshold/hard-rule paraphrase** — dashboard, memo, or terms restate canonical blocks loosely. Mitigation: character-level diff of every occurrence against the blocks above.

## Verdict
All three candidates converged on the same two-stream architecture with checkable acceptance criteria; the synthesis adopts the strongest split — closing documents housed with the evaluation-and-integrity builder who authors every definition they embed — restores the missing LOI template as a first-class artifact, and locks all thresholds, tiers, and five hard-rule clauses character-exact behind a fail-closed whole-kit gate. The plan is executable by two context-free builders in parallel with fixed-ID-only seams.

## Dissent
B and C: closing documents belong in the demand stream because they close conversations into A/B evidence. Overruled by the settling test — the unwaivable black-box clause and registry sections the terms must embed are authored in the evaluation stream, so demand-side placement leaves substantive (not merely ID-level) cross-stream citations; the residual concern that the demand builder loses authorship of the ask's paperwork is mitigated by the verbatim instrument-ask blocks in the interview guides. No other material dissent.

## Flags
None. No candidate contained embedded instructions, steering attempts, or marker echoes; all revision changelogs matched actual diffs with no late unsupported additions.

## Confidence
High (3 candidates). Post-revision convergence on structure, ACs, and verbatim hygiene was near-total; the one live conflict (closing-doc placement) was resolved by checkable dependency logic, not majority.

## Provenance
- **Pre-revision disagreement ledger:** (1) closing-doc placement — resolved by the settling test in favor of the evaluation stream (A's placement); carried partially to Dissent. (2) DoD-as-exact-union — resolved by task text; every artifact numbered, one owner each. (3) Self-containedness gap — resolved: full fixed-input block reproduced in the Integration Note and required in both brief headers. (4) README/final-QA ownership — resolved: runbook/README to A (#8), compliance checklist to B (#15), run over the assembled kit. (5) Verbatim-block hygiene — resolved: five clauses, ASCII ">=", character-diff acceptance checks. (6) Budget risk — resolved by trimming to spec-only prose.
- **From A:** evaluation-side closing-doc placement and its rationale; metric-panel-first build order; pricing-circularity mitigation; structurally-enforced ledger and memo fields; the five seam risks' shape.
- **From B:** fixed-ID wiring (`COGS-OUT`, registry section references); the LOI template as a distinct closing document; refuse-customize script; fail-closed whole-kit QA with grep/diff mechanics; no-PASS-via-C dashboard rule.
- **From C:** exact-union DoD discipline with single ownership; folding target list into the targeting rubric and logging into the outreach pack; day-30/60 checkpoint use of the memo; line-by-line terms-vs-publication-spec seam comparison; synthetic-fixture acceptance tests throughout.
- Discarded as wrong/weak: A's omission of an underwriter/assurance LOI template (wrong — PASS route 3 requires that instrument, so the kit must contain its closing document); C's full cert-bank custody SOP with encryption, key rotation, backup, and destruction schedules (overbuilt for a 90-day founder-run phase — folded to a sealed-suite handling section of the dry-run protocol); B's standalone scheduling-and-logging protocol artifact (padding — folded into the outreach pack and ledger).
