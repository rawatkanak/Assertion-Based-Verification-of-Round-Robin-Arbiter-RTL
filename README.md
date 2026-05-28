# AXI-Lite Arbitration Formal Verification Project

## Overview

This project implements and verifies a SystemVerilog-based 2-request round-robin arbiter using assertion-driven verification methodologies. The verification environment includes randomized testing, self-checking scoreboards, functional coverage tracking, waveform debugging, and protocol validation techniques commonly used in ASIC/SoC verification flows.

The project focuses on identifying and resolving arbitration edge-case bugs, stale grant behavior, reset recovery issues, and sequential timing mismatches through structured verification workflows.

---

# Project Objectives

- Design a fair arbitration RTL module
- Implement assertion-based protocol checking
- Build a self-checking verification environment
- Perform randomized stress testing
- Collect functional coverage metrics
- Debug failures using waveform analysis
- Achieve clean verification closure

---

# Features

- ✔ SystemVerilog RTL Design
- ✔ Assertion-Based Verification
- ✔ Self-Checking Scoreboard
- ✔ Randomized Verification
- ✔ Directed Testing
- ✔ Functional Coverage Tracking
- ✔ Waveform Debugging using GTKWave
- ✔ Corner-Case Validation
- ✔ Protocol Violation Detection
- ✔ Verification Closure Workflow

---

# Project Structure

```text
AXI-Lite-Formal-Verification/
│
├── rtl/
│   └── arbiter.sv
│
├── assertions/
│   └── arbiter_assertions.sv
│
├── simulation/
│   ├── tb_arbiter.sv
│   ├── scoreboard.sv
│   └── coverage.sv
│
├── docs/
│   ├── design_spec.md
│   ├── verification_plan.md
│   ├── test_cases.md
│   ├── bug_report.md
│   ├── coverage_report.md
│   └── debug_notes.md
│
├── images/
│
├── README.md
└── .gitignore
```

---

# Design Description

The arbiter grants access between two competing requesters using a round-robin fairness policy.

## Inputs

| Signal | Description |
|--------|-------------|
| clk | System clock |
| rst | Active-high reset |
| req0 | Request from requester 0 |
| req1 | Request from requester 1 |

---

## Outputs

| Signal | Description |
|--------|-------------|
| grant0 | Grant to requester 0 |
| grant1 | Grant to requester 1 |

---

# Verification Methodology

The verification environment uses multiple industry-style verification strategies.

## Assertions

Assertions continuously monitor protocol correctness including:

- no simultaneous grants
- valid grant-request relationships
- reset correctness
- arbitration safety

---

## Randomized Testing

Random traffic generation stresses the arbitration logic under:

- simultaneous requests
- rapid toggling
- reset transitions
- long contention scenarios

---

## Scoreboard

The self-checking scoreboard validates arbitration behavior automatically and reports protocol mismatches.

---

## Coverage Collection

Coverage metrics track:

- req0 activity
- req1 activity
- simultaneous request cycles
- stress scenario execution

---

## Waveform Debugging

GTKWave is used to analyze:

- sequential timing behavior
- stale signal persistence
- arbitration transitions
- reset recovery

---

# Issues Detected During Verification

The verification environment successfully detected multiple real RTL and protocol issues.

| Issue | Description | Detection Method |
|------|-------------|----------------|
| Stale Grant Signals | Grant outputs remained active after request removal | Assertions + Scoreboard |
| Protocol Violation | Grant asserted without active request | Assertions |
| Arbitration Edge Case Failure | Random toggling exposed invalid transitions | Random testing |
| Reset Recovery Weakness | Unstable outputs near reset cycles | Directed testing |
| Corner Case Handling | Simultaneous requests caused inconsistent grants | Stress testing |
| Sequential State Retention Bug | Previous-cycle values leaked into next cycle | Waveform debugging |
| Tool Compatibility Issue | Unsupported advanced SVA in Icarus Verilog | Simulator adaptation |

---

# Debugging Workflow

1. Executed randomized simulations
2. Assertions detected protocol failures
3. Scoreboard reported invalid grant behavior
4. GTKWave waveform analysis isolated stale signals
5. Root-cause debugging performed
6. RTL updated
7. Assertions aligned with sequential timing semantics
8. Verification rerun successfully
9. Clean verification closure achieved

---

# Key Engineering Learnings

- Assertion-driven verification methodology
- Sequential timing semantics
- Delta-cycle behavior in RTL simulation
- Waveform-based debugging
- Randomized verification techniques
- Verification closure process
- Corner-case validation strategies

---

# Simulation Results

Final verification results:

```text
Simulation Completed Successfully

req0 active cycles      = 73
req1 active cycles      = 61
dual request cycles     = 49
```

---

# Tools Used

| Tool | Purpose |
|------|---------|
| VS Code | Development environment |
| Icarus Verilog | RTL simulation |
| GTKWave | Waveform debugging |
| Git | Version control |
| GitHub | Project hosting |

---

# How to Run

## Compile

```bash
iverilog -g2012 -o sim.out rtl/arbiter.sv assertions/arbiter_assertions.sv simulation/scoreboard.sv simulation/coverage.sv simulation/tb_arbiter.sv
```

---

## Run Simulation

```bash
vvp sim.out
```

---

## Open Waveforms

```bash
gtkwave arbiter.vcd
```

---

# Verification Flow

```text
RTL Design
    ↓
Assertions
    ↓
Randomized Testing
    ↓
Scoreboard Validation
    ↓
Coverage Collection
    ↓
Waveform Debugging
    ↓
Bug Detection
    ↓
RTL Fixes
    ↓
Verification Closure
```

---

# Resume-Oriented Highlights

- Developed a robust SystemVerilog verification environment using assertions, randomized testing, self-checking scoreboards, coverage tracking, and waveform debugging.
- Identified and resolved arbitration protocol edge-case bugs using assertion-driven verification methodologies.
- Implemented randomized stress verification and sequential timing debug workflows for arbitration RTL validation.

---

# Final Status

✔ RTL Verified  
✔ Assertions Passing  
✔ Scoreboard Clean  
✔ Coverage Collected  
✔ Random Testing Passed  
✔ Waveforms Verified  
✔ Debugging Completed  
✔ Verification Closure Achieved
