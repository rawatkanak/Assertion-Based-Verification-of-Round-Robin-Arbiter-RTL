# Debug Notes

## Verification Debugging Journey

This project intentionally used randomized and stress-based verification techniques to expose protocol and sequential corner-case failures.

---

# Key Observations

## Observation 1

Randomized verification exposed stale grant persistence not visible in simple directed tests.

---

## Observation 2

Waveform analysis showed sequential outputs retaining previous-cycle values unexpectedly.

---

## Observation 3

Assertion failures revealed timing mismatches between RTL updates and verification sampling.

---

# Debugging Process

1. Ran randomized simulations
2. Detected assertion failures
3. Observed invalid grant behavior
4. Opened GTKWave for timing analysis
5. Identified stale output retention
6. Modified RTL output clearing logic
7. Updated assertions for previous-cycle sampling
8. Re-ran complete verification flow
9. Achieved clean verification closure

---

# Engineering Lessons Learned

- Assertions are highly effective for protocol validation
- Random testing exposes hidden corner cases
- Waveform debugging is critical for RTL verification
- Sequential timing alignment is essential
- Verification closure requires iterative debugging

---

# Final Outcome

The final verification environment achieved:

- stable arbitration behavior
- correct sequential timing
- assertion-clean execution
- robust randomized verification
- successful coverage completion