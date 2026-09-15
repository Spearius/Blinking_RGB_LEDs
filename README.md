\## Overview



This program uses three onboard switches and the onboard RGB LED light. The program is designed to light up a Red, Green, and Blue color one at a time, one switch per color. If more than one switch is pushed to ON, then no colors will light up.



\## Software



Vivado 2023.1



\## Hardware



ZYNQ - Zybo-Z7 (7010 Development Board)



\## Timing Simulation

Below is the behavioral simulation that verifies proper operation of the RGB LED design:



!\[Behavioral Simulation](Behavioral\_Simulation.png)



In this simulation, we can see that when the reset is pressed, it keeps the RGB output LOW. However, the RGB output shows HIGH when the corresponding switch is in the ON position. Additionally, when one or more switch is in the ON position simultaneously, the RGB output stays LOW. This means that only one switch can be ON at a time in order to output its respective RGB color. Another note to keep in mind is there is a 5ns delay due to the testbench code set to toggle every 5ns, and that any change will occur on the next rising edge of the clock.

