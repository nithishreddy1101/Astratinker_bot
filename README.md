The robot's brain is powered by an FPGA that reads and processes the sensor data and controls the actuators. Challenges Building AB from scratch using an FPGA, understanding and implementing single-cycle RISC-V CPU design, and creating a hardware-software co-design using Verilog HDL to unveil the powerful parallel processing capabilities of FPGAs.

## Introduction

The Line Follower Robot is designed to navigate a space station and repair faults along its path. The robot logic is implemented in Verilog, while the path-planning algorithm is developed in C.

##Theme Learning: 
FPGA, Verilog HDL, Build-a-Bot, RISC-V CPU Design, Path Planner in C, Component
Interfacing, Serial Communication

## Technology Used

FPGA Development Board

RISC-V Microprocessor

UART Communication Protocol

## Software Requirements

- Intel Quartus
- Modelsim Altera(for simulation)


### About The CPU

1.The processor architecture is based on the RISC-V instruction set.

2.Both the CPU and memory components are developed in Verilog and deployed on the FPGA.

3.The path-planning algorithm is implemented in the C programming language.

4.The program runs on the CPU, with the start and end locations passed as input arguments.

## Contributors 

1. Nithish Anugu
2. Aman Shaikh
