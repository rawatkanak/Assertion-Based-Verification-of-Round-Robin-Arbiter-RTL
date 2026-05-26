# Bug Report and Debug Analysis

## Issues Detected During Verification

These are the actual bugs/issues detected before RTL fixes.

| Issue | Description | Detection Method |
|------|-------------|----------------|
| Stale Grant Signals | grant outputs remained active after request removal | Assertions + Scoreboard |
| Protocol Violation | Grant generated without active request | Assertion checks |
| Arbitration Edge Case Failure | Random toggling exposed invalid state transitions | Random testing |
| Reset Recovery Weakness | Output behavior unstable around reset cycles | Directed testing |
| Corner Case Handling | Simultaneous requests caused inconsistent grants | Stress testing |
| Sequential State Retention Bug | Previous cycle values leaked into next cycle | Waveform debugging |
| Tool Compatibility Issue | Unsupported SVA/covergroups in Icarus | Simulator adaptation |

---

# Root Cause Analysis

## Bug 1 — Stale Grant Signals

### Problem

grant0/grant1 remained asserted after request removal.

### Root Cause

Outputs were not cleared every clock cycle.

### Fix

Default grant clearing logic was added inside sequential RTL.

---

## Bug 2 — Sequential Timing Mismatch

### Problem

Assertions failed even though RTL behavior appeared correct.

### Root Cause

Nonblocking assignments updated after assertion sampling.

### Fix

Assertions were modified to compare against previous-cycle request values.

---

## Bug 3 — Arbitration Fairness Risk

### Problem

Shared contention scenarios risked starvation.

### Root Cause

Missing round-robin fairness handling.

### Fix

Turn-based arbitration rotation added.

---

# Debugging Workflow

1. Executed randomized verification
2. Assertions detected protocol failures
3. Scoreboard identified invalid grants
4. Waveform analysis isolated stale outputs
5. Root-cause debugging performed
6. RTL updated
7. Assertions updated for sequential timing
8. Verification rerun successfully

---

# Final Verification Status

- Assertion failures resolved
- Stable sequential behavior achieved
- Clean verification closure completed
- Randomized testing passed successfully