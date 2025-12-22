# 8-bit-counter-ASIC-Flow-project

This project implements an 8-bit synchronous counter
The counter has the following features:
1. It can count up and down.
2. It has an asynchronous reset.
3. It includes an enable signal to pause/hold the counting.
ASIC Flow:
RTL → Simulation → Synthesis → Synthesis checking → STA → Formality → Floor planning → Placement → CTS -> Routing. 

counter8bit-asic/
│
├── README.md
│
├── rtl/
│   └── counter.v
│   └── counter_tb.v
│
├── sim/
│   └── pre_syn
│   └── post_syn
│   └── post_layout
│
├── syn/
│    
│
├── syn_check
│   
├── timing
│   ├── post_syn
│   ├── post_layout      
│
├── formal
│   └── post_syn
│   └── post_layout
│
└── layout
    ├── Lib
   


