ECE281_Lab4
===========

The following files were given to start this lab.  These files were altered to meet the requirements of the lab.  

[ALU](https://raw.githubusercontent.com/JohnTerragnoli/ECE281_Lab4/master/ALU_Testbench.vhd)

[ALU Testbench](https://raw.githubusercontent.com/JohnTerragnoli/ECE281_Lab4/master/ALU_Testbench.vhd)

[Data Path](https://raw.githubusercontent.com/JohnTerragnoli/ECE281_Lab4/master/Datapath_shell.vhd)

[Data Path Testbench](https://raw.githubusercontent.com/JohnTerragnoli/ECE281_Lab4/master/Datapath_testbench.vhd)

[Lab4 Waveform](https://raw.githubusercontent.com/JohnTerragnoli/ECE281_Lab4/master/Lab4_waveform.wcfg)


#**Design**

##ALU Modifications 

When given the ALU shell, the only part that was finished was the importing of the needed libraries, the specifications of the inputs/outputs, and the outline for where processes and conditional statements should go. 
This original file can be seen here: [ALU_Shell_original](https://raw.githubusercontent.com/JohnTerragnoli/ECE281_Lab4/master/ALU_shell_original.vhd)

The completed ALU_shell is shown here: [ALU_Shell_Complete](https://raw.githubusercontent.com/JohnTerragnoli/ECE281_Lab4/master/ALU_shell.vhd)
 

To give this file the correct functionality, it was updated in the following way.

The schematic for the working ALU can be seen below: 

![alt tag](https://raw.githubusercontent.com/JohnTerragnoli/ECE281_Lab4/master/ALU_Schematic.PNG "ALU Schematic")

Note: The bus at the top of the schematic is the data bus, the selector going into the multiplexer is the OpSel, and the output of the multiplexer is the output of the ALU. 

Based on this schematic, and the PRISM manual, the ALU_shell was completed.  To complete this ALU Shell, all that needed to be done was specify which action would take place based on the OpSel of the multiplexer of the ALU, and the description of how each command would work.  The eight commands that were made are as follows: "and"ing the Accumulator and the data bus bits, negating the accumulator's value (finding the 2's compliment), "not"ing the accumulator's value, rotating the bits in the accumulator right, "or"ing the bits in the data bus and the accumulator, loading the value on the data bus into the accumulator, adding the values in the accumulator and the data bus, and again loading the value on the data bus into the accumulator.  The reason the load command was made twice is because the multiplexer in the ALU was designed to have eight options.  If there were only 7 options, and an eighth one was chosen from the OpSel, then the ALU would not "know" what to do and this could cause a crash of the system.  Also, note, that in the ALU shell, loading something into the accumulator means setting it equal to the result, since that is where the result of the ALU will go when put into the entire system. The results from all operations were put as the result in the ALU shell. 

The only operation that was not self-explanatory is the rotate right function.  The rest of the operations were done using basic "and", "or", and "not" functions in VHDL.  The 2's compliment process was done in previous labs and will not be explained here.  The rotate right function was impliemented by separating each of the bits in the Accumulator, and placing them in a different order, putting all of the bits one bit to the right, with the right most bit becoming the most significant bit in the result.  This was done using concatenation.  

Once all of these operations were made, a multiplexer was made in VHDL using "when" statements.  Each when statement was based on the value of the OpSel, staring from left to right in the diagram above with "and" being performed when the OpSel is "000" and LDA when the OpSel value is "111".  The output of this multiplexer was made to be the result of the ALU.  Once this was constructed, the ALU was tested using the provided ALU testbench.  



##ALU Test and Debug

After the ALU was made, it was tested using the following testbench.  No alterations were made to the testbench aside from the heading.  The original, completely unaltered testbench is provided here [Alu_Testbench_original](https://raw.githubusercontent.com/JohnTerragnoli/ECE281_Lab4/master/ALU_testbench_original.vhd).  The version with the altered header for this lab is shown here: [ALU_Testbench](https://raw.githubusercontent.com/JohnTerragnoli/ECE281_Lab4/master/ALU_Testbench.vhd)


This testbench was associated with the ALU file and run.  here are the simulation results. 
![alt tag](https://raw.githubusercontent.com/JohnTerragnoli/ECE281_Lab4/master/alu_SIMULATION.PNG "ALU Simulation Results")

This simulation was examined to make sure that all of the outcomes were accurate, based on the operation chosen at the time.  It was concluded that the simulation worked exactly as predicted.  As a result, the ALU could then be used as a component when creating the entire Datapath later in the lab.  

##Discussion of Datapath Modifications

The datapath shell provided is shown here. [Datapath_original](https://raw.githubusercontent.com/JohnTerragnoli/ECE281_Lab4/master/Datapath_shell_original.vhd) Nothing was changed from the original file.  The only parts completed in the original datapath file were the inputs and outputs of the system and the program counter of the data path.  For everything else, only comments were provided to indicate where the code should go. The completed file, compete with headings, is shown here. [DataPath_complete](https://raw.githubusercontent.com/JohnTerragnoli/ECE281_Lab4/master/Datapath_shell.vhd) 

The schematic for the data path is shown here: 
![alt tag](https://raw.githubusercontent.com/JohnTerragnoli/ECE281_Lab4/master/datapath_schematic.PNG "ALU Simulation Results")

Notice that the schematic of the ALU, is inside of this schematic.  

The specific parts of the code that were modified are discussed below. 

First, because the ALU is used within the datapath, a declaration and an instantiation of the ALU was made in the datapath code.  For the instantiation, the inputs were made to be the data bus, the accumulator, and the OpSel of the datapath.  The output was made to be an internal wire called "ALU_result", which fed into the accumulator.  

Then, the rest of the "boxes" shown in the diagram were implemented with combinational logic.  To understand how to make each component of the Datapath, the schematic was used.  

To make the instruction registar a process was made that was sensitive to the clock and the reset signal, meaning that the process would only run if either the reset or the clock signal changed. Inside this process, if statements were used to make the IR signal, an output signal, equal to "0000" when the reset signal was '1', and to load whatever data was in the Data bus into the IR signal if the IRLd signal was '0'. These were the only instructions included in the Instruction Registar. 

Then, the logic for the Memory Access Register (Hi and Lo) was then made.  Again, this was done inside a process that was sensitive to the reset and clock signal.  



Also, another change made to the original file shown below: 

```VHDL
elsif (Clock'event and Clock='1') then 
```

changed to: 

```VHDL
elsif (rising_edge(clock)) then 
```

The reasons for doing this were discussed in Computer Exercise 4. 

##Datapath Test and Debug

##Discussion of Testbench Operation






#Data Path Sim
![alt tag](https://raw.githubusercontent.com/JohnTerragnoli/ECE281_Lab4/master/data_path_sim.PNG "DataPath Simulation Results")

