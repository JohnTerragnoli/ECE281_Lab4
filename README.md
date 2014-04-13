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

 

To give this file the correct functionality, it was updated in the following way.

The schematic for the working ALU can be seen below: 

![alt tag](https://raw.githubusercontent.com/JohnTerragnoli/ECE281_Lab4/master/ALU_Schematic.PNG "ALU Schematic")

Note: The bus at the top of the schematic is the data bus, the selector going into the multiplexer is the OpSel, and the output of the multiplexer is the output of the ALU. 

Based on this schematic, and the PRISM manual, the ALU_shell was completed.  To complete this ALU Shell, all that needed to be done was specify which action would take place based on the OpSel of the multiplexer of the ALU, and the description of how each command would work.  The eight commands that were made are as follows: "and"ing the Accumulator and the data bus bits, negating the accumulator's value (finding the 2's compliment), "not"ing the accumulator's value, rotating the bits in the accumulator right, "or"ing the bits in the data bus and the accumulator, loading the value on the data bus into the accumulator, adding the values in the accumulator and the data bus, and again loading the value on the data bus into the accumulator.  The reason the load command was made twice is because the multiplexer in the ALU was designed to have eight options.  If there were only 7 options, and an eighth one was chosen from the OpSel, then the ALU would not "know" what to do and this could cause a crash of the system.  Also, note, that in the ALU shell, loading something into the accumulator means setting it equal to the result, since that is where the result of the ALU will go when put into the entire system. The results from all operations were put as the result in the ALU shell. 

The only operation that was not self-explanatory is the rotate right function.  The rest of the operations were done using basic "and", "or", and "not" functions in VHDL.  The 2's compliment process was done in previous labs and will not be explained here.  The rotate right function was impliemented by separating each of the bits in the Accumulator, and placing them in a different order, putting all of the bits one bit to the right, with the right most bit becoming the most significant bit in the result.  This was done using concatenation.  

Once all of these operations were made, a multiplexer was made in VHDL using "when" statements.  Each when statement was based on the value of the OpSel, staring from left to right in the diagram above with "and" being performed when the OpSel is "000" and LDA when the OpSel value is "111".  The output of this multiplexer was made to be the result of the ALU.  Once this was constructed, the ALU was tested using the provided ALU testbench.  



##ALU Test and Debug

After the ALU was made, it was tested using the following testbench.  No alterations were made to the testbench aside from the heading.  

##Discussion of Datapath Modifications

##Datapath Test and Debug

##Discussion of Testbench Operation



This is a screenshot of the ALU simulation.  It words correctly!! Now the ALU can be used to make the data path.  
![alt tag](https://raw.githubusercontent.com/JohnTerragnoli/ECE281_Lab4/master/alu_SIMULATION.PNG "ALU Simulation Results")


#Data Path Sim
![alt tag](https://raw.githubusercontent.com/JohnTerragnoli/ECE281_Lab4/master/data_path_sim.PNG "DataPath Simulation Results")

