# Test Cases

| Test ID | Scenario | Expected Result |
|---------|-----------|----------------|
| TC1 | req0 active | grant0 asserted |
| TC2 | req1 active | grant1 asserted |
| TC3 | Simultaneous requests | Alternating grants |
| TC4 | Reset during operation | Outputs cleared |
| TC5 | Randomized requests | Stable operation |
| TC6 | Rapid signal toggling | No invalid grants |
| TC7 | Long contention | Fair arbitration |

---

# Random Verification Strategy

Randomized traffic was intentionally introduced to expose corner-case failures not visible through directed testing alone.

The random verification environment stressed:

- arbitration fairness
- sequential timing
- reset behavior
- stale signal persistence
- contention handling

---

# Stress Testing Summary

The environment successfully validated:

- protocol correctness
- arbitration stability
- output consistency
- sequential timing correctness
- recovery from reset conditions