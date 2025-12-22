# 8-bit-counter-ASIC-Flow-project

This project implements an 8-bit synchronous counter
The counter has the following features:
1. It can count up and down.
2. It has an asynchronous reset.
3. It includes an enable signal to pause/hold the counting.
ASIC Flow:
RTL → Simulation → Synthesis → Synthesis checking → STA → Formality → Floor planning → Placement → CTS -> Routing.
### Digital IC design using EDA tools such as Synopsys VCS, Design Compiler, IC Compiler, PrimeTime, etc., with a 90-nm EDK library.
### Project Structure

```text
counter-8bit-asic/
├── README.md
├── rtl/
│   └── counter.v
├── tb/
│   └── counter_tb.v
├── sim/
├── syn/
│   ├── pre_syn/
│   ├── post_syn/
│   └── syn_check/
├── timing/
│   ├── post_syn/
│   └── post_layout/
├── formal/
│   ├── post_syn/
│   └── post_layout/
├── layout/
    └──Lib 
```



