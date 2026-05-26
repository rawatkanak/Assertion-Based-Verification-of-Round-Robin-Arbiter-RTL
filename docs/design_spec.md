# Design Specification

## Project Overview

This project implements and verifies a 2-request round-robin arbiter using SystemVerilog. The arbiter grants access fairly between two competing request sources while ensuring protocol correctness and stable sequential behavior.

The project focuses heavily on assertion-driven verification, randomized testing, debugging workflows, and verification closure.

---

# Design Goals

- Fair arbitration between requesters
- No simultaneous grants
- Proper reset recovery
- Stable sequential behavior
- Robust corner-case handling

---

# Inputs

| Signal | Description |
|--------|-------------|
| clk | System clock |
| rst | Active-high reset |
| req0 | Request from source 0 |
| req1 | Request from source 1 |

---

# Outputs

| Signal | Description |
|--------|-------------|
| grant0 | Grant for requester 0 |
| grant1 | Grant for requester 1 |

---

# Arbitration Policy

The arbiter implements round-robin fairness using a turn-based scheduling mechanism.

When both requests are active:

- If turn = 0 → grant0 asserted
- If turn = 1 → grant1 asserted

The turn bit toggles after every shared arbitration cycle.

---

# Verification Strategy

The project includes:

- Assertion-based verification
- Randomized stress testing
- Self-checking scoreboard
- Functional coverage collection
- Waveform debugging
- Corner-case validation
- Verification closure flow

---

# Tools Used

| Tool | Purpose |
|------|---------|
| VS Code | Development |
| Icarus Verilog | Simulation |
| GTKWave | Waveform debugging |
| Git/GitHub | Version control |