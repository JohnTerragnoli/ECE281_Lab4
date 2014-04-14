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

The given code for the program counter is shown here: 

```VHDL
	process(Clock,Reset_L)
  	begin				 
	  if(Reset_L = '0') then
		  	PC <= "00000000";
	  elsif (rising_edge(clock)) then 
		  if (PCLd = '1' and JmpSel = '1') then
		        PC(7 downto 4) <= MARHi;   
			PC(3 downto 0) <= MARLo;
		  elsif (PCLd = '1' and JmpSel = '0') then
			  PC <= unsigned(PC) + 1;
		  end if;
		end if;		
  	end process;
```

First, because the ALU is used within the datapath, a declaration and an instantiation of the ALU was made in the datapath code.  For the instantiation, the inputs were made to be the data bus, the accumulator, and the OpSel of the datapath.  The output was made to be an internal wire called "ALU_result", which fed into the accumulator.  

```VHDL
--declaration
	COMPONENT ALU_Shell
	PORT(
		OpSel: in STD_LOGIC_VECTOR(2 downto 0);
		Data: in STD_LOGIC_VECTOR(3 downto 0);
		Accumulator: in STD_LOGIC_VECTOR(3 downto 0);
		Result:out STD_LOGIC_VECTOR(3 downto 0)
		);
	END COMPONENT;


--instatiation
		da_ALU: ALU_shell
	PORT MAP(
		OpSel => OpSel,
		data => data,
		accumulator => accumulator,
		result => ALU_Result
	);


```

Then, the rest of the "boxes" shown in the diagram were implemented with combinational logic.  To understand how to make each component of the Datapath, the schematic was used.  

To make the instruction registar a process was made that was sensitive to the clock and the reset signal, meaning that the process would only run if either the reset or the clock signal changed. Inside this process, if statements were used to make the IR signal, an output signal, equal to "0000" when the reset signal was '1', and to load whatever data was in the Data bus into the IR signal if the IRLd signal was '0'. These were the only instructions included in the Instruction Registar. The code for this registar is shown below: 

```VHDL 
	process(Clock,reset_L)
  	begin				   
		if(Reset_L = '0') then
				IR <= "0000"; 
		elsif(rising_edge(Clock)) then
			if(IRLd = '1') then
				IR <= data; 
			end if; 
		end if; 
  	end process;   
```



Then, the logic for the Memory Access Register (Hi and Lo) registars was then made.  Again, this was done inside a process that was sensitive to the reset and clock signal.  A process was made for both the Hi and the Low registar.  If the reset was '0', then the MARHi/Lo was set to be "0000", for the respective process.  If the MARHiLd/LoLd signal '1', then the bits in the data bus were put into the MARHi and MARLi signals, for each respective process.  These were the only instructions included in the Memory Access Register (Hi and Lo) registars. The code for these registars is shown below: 


```VHDL
--HIGH
	process(Clock,Reset_L)
  	begin				 
	  if(Reset_L = '0') then
			MARHi <= "0000"; 
	  elsif(rising_edge(Clock)) then 
			if(MARHiLd = '1') then
				MARHi <= data; 
			end if; 
	  end if; 
  	end process;       

--LOW
	
	process(Clock,Reset_L)
  	begin				 
	  if(Reset_L = '0') then
			MARLo <= "0000"; 
	  elsif(rising_edge(Clock)) then 
			if(MARLoLd = '1') then
				MARLo <= data; 
			end if; 
	  end if; 
  	end process;   
``` 

Next, the logic for the address selector was made.  This was done inside a process that was sensitive to the AddrSel, MARHi, MARLo, and PC(from the PC registar) signals.  It basically creates a multiplexer with two choices.  Either the address or the PC can be sent to the address signal, and this is decided by the AddrSel signal, a one bit signal. The logic for this can be seen below: 

```VHDL

	process(AddrSel, MARHi, MARLo, PC)
  	begin		
		if(rising_edge(Clock)) then
			if(AddrSel='1') then 
			Addr <= MARHi & MARLo; 
			elsif(AddrSel = '0') then 
			Addr <= PC; 
			end if; 
	  end if; 
  	end process;   
		
		
```

Notice that the MARHi and the MARLo were concatenated together to make the full address. 
All of this logic was acquired by examining the schematic given in the lab instructions.  

The logic for the accumulator was then made. It was mainly describing what goes into the accumulator.  This was done inside a process that was sensitive to the clock and reset signals. The gist of the accumulator code is that the accumulator will reset when the reset signal tells it to, and the ALU_Result from the ALU will be put into the accumulator whenever the AccLd signal permits.  This code can be seen below; 

```VHDL

	process(Clock, RESET_L)		
  	begin				 	
	  	if(Reset_L = '1') then 	
			Accumulator <="0000";
		elsif(rising_edge(Clock)) then 
			if(AccLd = '1') then 
			Accumulator <= ALU_Result; 
			end if; 
		end if ;
  	end process;   
```


The logic for the tri-state buffer was then created.  When the EnAcBuffer signal was '1', what was in the accumulator was allowed to enter the Data bus.  when it was not '1', the buffer would instead output "ZZZZ", or high impedence.  The code for this can be seen below: 

```VHDL
	Data <=  Accumulator when  (EnAccBuffer = '1')else         
				"ZZZZ";
```


The code for the Datapath status signals were also created; the code can be seen below. 

```VHDL  
	AlessZero <=   Accumulator(3); 
  	AeqZero <= not Accumulator(3) or Accumulator(2) or Accumulator(1) or Accumulator(0); 
```




Also, another change made to the original file shown below: 

```VHDL
elsif (Clock'event and Clock='1') then 
```

changed to: 

```VHDL
elsif (rising_edge(clock)) then 
```
The reasons for doing this were discussed in Computer Exercise 4. 

Those were all of the changes made to the data path.  

##Datapath Test and Debug

The completed Datapath module was then tested using the [Datapath_Testbench](https://raw.githubusercontent.com/JohnTerragnoli/ECE281_Lab4/master/Datapath_testbench.vhd) provided. The original, completely unaltered version of the testbench can be seen here: [OriginalDataPathTestbench](https://raw.githubusercontent.com/JohnTerragnoli/ECE281_Lab4/master/Datapath_testbench_original.vhd)

The original test of the datapath can be seen here: 
![alt tag](https://raw.githubusercontent.com/JohnTerragnoli/ECE281_Lab4/master/data_path_sim.PNG "DataPath Simulation Results")

However, these results were not correct.  Therefore, troubleshooting was done to find out what the problem was.  

The results for the datapath test bench were supposed to look like this:

![alt tag](https://raw.githubusercontent.com/JohnTerragnoli/ECE281_Lab4/master/Datapath_example_simulation.PNG "DataPath Simulation Results")

Because the original results did not look like this, trouble shooting was done to fix the testbench.  Looking back at the code, it was discovered that the MARHi and MARLo sections were wrong.  The selector RDLd was used for each instead of the MARLoLd and MARHiLd selectors.  This was most likely happened because much copying and pasting was being done while writing the code.   

To fix the AlezzZero and AeqZero, I decided to first tackle the Accumulator.  After  struggling with it for a while, I noticed, with the help of C3C Sabin Park, that my address selector process was sensitive to the wrong items.  It should not change when MARLo and MARHi changes.  

Also, I noticed that I was not loading the waveform file properly.  Once I did this, everything ran correctly.  It took an embarrassing amount of time to figure this out.  

The final simulation up to 50n can be seen below: 

![alt tag](https://raw.githubusercontent.com/JohnTerragnoli/ECE281_Lab4/master/Datapath_simulation_50n_correct.PNG "DataPath Simulation Results 50n")


Also, notice how there is a Jump at approximately 225ns in the snapshot of the simulation below: 
It's a JN, meaning that the jump will only occur if the accumulator value is negative.  

![alt tag](https://raw.githubusercontent.com/JohnTerragnoli/ECE281_Lab4/master/Datapath_225n_simulation.PNG "DataPath Simulation Results 225n")

##Discussion of Testbench Operation
Information on this can be seen under the heading "Reverse Engineering"


#Reverse Engineering

##Simulation Analysis between 50 and 100ns
The scrrenshot for this simulation can be seen below: 

![alt tag](https://raw.githubusercontent.com/JohnTerragnoli/ECE281_Lab4/master/Datapath_simulation_50_to_100n.PNG "DataPath Simulation Results 225n")

First, the reset button does not change at all during this time, meaning that everything is never reset. 
At 50ns: Starting on instruction 3 (PC = 3).  The addresses stored in the MARHi and Lo are 0000 and 0000, and these addresses are consistent for the entire time period. The address select is zero the entire time, meaning that the PC will determine the address bus for the interval. The first operation is chosen, the "and" operation.  So on the next rising edge of the clock, the input into the accumulator should be the data bus "and"ed with the accumulator signal.  B "and"ed with 3 is B, which is why B stays on the accumulator.  Also, the IRLd is on, meaning that what is on the data bus is sent to the 4 bit registrar IR on the next clock cycle.  This happens at 55ns.  

At 55n; the pcld turns to 1, and thus the program moves onto the next instruction.  


Second try: 
50ns: 
55ns: instruction 4 (PC); 3 loaded into IR; Address bus gets the value of PC, now 4.  
	a little after PC and IR prevented from turning. 
	a little after 4 is put onto the data bus (from where?)
	What was in Data was loaded into the accumulator (Operation 7) 
65ns: what's in the accumulator is ROR. B is changed to D 
75ns: 4 put on data bus; IR and PC load turned on.  
85ns: start 5th line of instruction; address changed to 5; IR turned to 4, taken from data bus. ; 3 put on data bus. 
95ns: Marlo opened up, pc opened up; 




Anaylzing the JN at 225n: 
The IR value is 1011, or B, which corresponds to the command JN.  
Because the accumulator is negative, therefore, the system can jump to the operand address.  Therefore, MARHi and MARLo is put into the address bus (02).  This value on the address bus is then put into the PC at the next clock cycle.  This means that the system has jumped to the line 02 instead of just moving onto the next one.  The code for this would look like the following: 

```
		   00	   0	NOP			N	0	Y
		   01	   0	NOP			N	0	Y
Jump	   02	   0	NOP			N	0	Y
		   03	   0	NOP			N	0	Y
		   04	   0	NOP			N	0	Y
		   05	   0	NOP			N	0	Y
		   06	   0	NOP			N	0	Y
		   07	   0	NOP			N	0	Y
		   08	   0	NOP			N	0	Y
		   09	   0	NOP			N	0	Y
		   0A	   0	NOP			N	0	Y
		   0B	   0	NOP			N	0	Y
		   0C	   0	NOP			N	0	Y
		   0D	   B	JN	Jump	N	2	Y
		   0E	   2				Y	0	N
		   0F	   0				Y	0	N
```

The code inbetween address 02 and 0D does not matter.  The focus was on the jump, not what was in between.  


#Documentation: 
C3C Park helped me comb through my Datapath file to find out what was wrong with the address registrar.  
