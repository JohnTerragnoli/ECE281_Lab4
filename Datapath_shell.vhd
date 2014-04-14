-------------------------------------------------------------------------------
--
-- Title       : Datapath
-- Design      : Datapath
-- Author      : C3C John Paul Terragnoli
-- Company     : usafa
--
-------------------------------------------------------------------------------
--
-- File        : Datapath.vhd
-- From        : interface description file
--
-------------------------------------------------------------------------------
--
-- Description :  Creates the logic for the datapath for Lab4
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {Datapath} architecture {Datapath}}

library IEEE;
use IEEE.STD_LOGIC_1164.all; 
use IEEE.Std_Logic_Arith.all;

-- This entity declares all of the control and status signals shared between the 
-- Datapath and the Controller.  You will use all of them in the code below
entity Datapath is
	 port(
		 IRLd : in STD_LOGIC;
		 MARLoLd : in STD_LOGIC;
		 MARHiLd : in STD_LOGIC;
		 JmpSel : in STD_LOGIC;
		 PCLd : in STD_LOGIC;
		 AddrSel : in STD_LOGIC;
		 AccLd : in STD_LOGIC;
		 EnAccBuffer : in STD_LOGIC;
		 OpSel : in STD_LOGIC_VECTOR(2 downto 0);
		 Addr : out STD_LOGIC_VECTOR(7 downto 0);
		 AeqZero : out STD_LOGIC;
		 AlessZero : out STD_LOGIC;
		 IR : out STD_LOGIC_VECTOR(3 downto 0);
		 Reset_L : in STD_LOGIC;
		 Clock : in STD_LOGIC;
		 Data : inout STD_LOGIC_VECTOR(3 downto 0)
	     );
end Datapath;

--}} End of automatically maintained section

architecture Datapath of Datapath is

	-- Copy the declaration for your ALU here

--------------------------------------------------------------------------------
--ALU Declaration
--------------------------------------------------------------------------------	

	COMPONENT ALU 
	PORT(
		 OpSel : in std_logic_vector(2 downto 0);
		 Data : in std_logic_vector(3 downto 0);
		 Accumulator : in std_logic_vector(3 downto 0);
		 Result : out std_logic_vector(3 downto 0)
	     );
	END COMPONENT;
	
	-- Internal signals for connecting the Datapath registers.  Note the differing length based on content
	signal  MARHi, MARLo, Accumulator, ALU_Result : std_logic_vector(3 downto 0);
	signal PC : std_logic_vector(7 downto 0);
		
begin
 	-- The PRISM Datapath includes the ALU and the registers needed to save the computer's state
	--  You should refer to the Datapath block diagram FREQUENTLY when completing this code
	



	-- The Program Counter is the most complicated register in the Datapath.  It has an asynchronous 
	-- Reset_L control, will only be loaded if PCLd is high, and must choose between two data sources
	-- based on the JmpSel line.  NOTE:  THIS IS THE ONLY PLACE WHERE UNSIGNED IS USED.
	
	process(Clock, Reset_L)
	begin				 
		if(Reset_L = '0') then
			PC <= "00000000";
		--this next line was changed because we were trained to in CE4.  
		elsif (rising_edge(Clock)) then
			if (PCLd = '1' and JmpSel = '1') then
				PC(7 downto 4) <= MARHi;
				PC(3 downto 0) <= MARLo;
			elsif (PCLd = '1' and JmpSel = '0') then
				PC <= unsigned(PC) + 1;
			end if;
		end if;		
	end process;
	
	
	
	
	
	
	-- Complete the code to implement an Instruction Register.  Use a standard register with an 
	-- asynchronous Reset_L line and clocked data input.  Which control signal also determines
	-- when data is loaded?  What are the inputs and outputs from the register?
	--data only loaded when rising edge and IRLd is 1.  
	process(Clock, Reset_L)
  	begin				 
		if(Reset_L = '0') then
		  	IR <= "0000";
		elsif (rising_edge(Clock) and IRLd = '1') then 
			IR <= Data;
		end if;		
  	end process;   
	  	
	  	
		
		
		
		
	-- Complete the code to implement an Memory Address Register (Hi).  Use a standard register with an 
	-- asynchronous Reset_L line and clocked data input.  Which control signal also determines
	-- when data is loaded?	 What are the inputs and outputs from the register?

	process(Clock, Reset_L)
  	begin
	--reset always has to come first. 
		if(Reset_L = '0') then
			MARHi <= "0000";
		
		elsif (rising_edge(Clock) and MARHiLd ='1') then
			MARHi <= Data;
		--no need to make an else case here.  
		end if;
  	end process;       
	
	
	
	
	
	-- Complete the code to implement an Memory Address Register (Lo).  Use a standard register with an 
	-- asynchronous Reset_L line and clocked data input.  Which control signal also determines
	-- when data is loaded?	 What are the inputs and outputs from the register?
	
	process(Clock, Reset_L)
  	begin
		if(Reset_L = '0') then
			MARLo <= "0000";
			--program will not even get here if there is a reset. 
			--don't have to worry about them happening at the same time.  
		elsif (rising_edge(Clock) and MARLoLd ='1') then
			MARLo <= Data;
		end if;
  	end process; 
	  
	
	
	
	-- Complete the code to implement an Address Selector (multiplexer) which determines between two data sources
	-- (which two?) based on the AddrSel line. Be careful - the process sensitivity list has 4 signals!
	
	process(Clock, Reset_L, AddrSel, PC)
  	begin				 
		if(AddrSel = '1') then
			Addr <= MARHi & MARLo;
		elsif (AddrSel = '0') then
			Addr <= PC;
		end if;
  	end process;   
		
		
		
--------------------------------------------------------------------------------
--ALU Instantiation
--------------------------------------------------------------------------------	
	
	--Sweet name.  
	da_ALU: ALU PORT MAP(
		OpSel => OpSel,
		Data => Data,
		Accumulator => Accumulator,
		Result => ALU_Result
	);
	
	
	
	-- Complete the code to implement an Accumulator.  Use a standard register with an 
	-- asynchronous Reset_L line and clocked data input.  Which control signal also determines
	-- when data is loaded?	   What are the inputs and outputs from the register?
	process(Clock, Reset_L)
  	begin			
		if(Reset_L = '0') then
			Accumulator <= "0000";
		elsif (rising_edge(Clock) and (AccLd = '1')) then
		--this is where the alu comes in handy. 
			Accumulator <= ALU_Result;
		end if;
  	end process;     
	 

	 
	-- Complete the code to implement a tri-state buffer which places the Accumulator data on the 
	-- Data Bus when enabled and goes to High Z the rest of the time	
	-- Note: use "Z" just like a bit.  If you want to set a signal to  High Z, you'd say mySignal <= 'Z';
	Data <= Accumulator when EnAccBuffer = '1' else "ZZZZ";  


	
  	-- Complete the code to implement the Datapath status signals 
	--we just want the sign of the accumulator here. 
   AlessZero <= Accumulator(3);  
  	AeqZero <= '1' when Accumulator = "0000" else '0';
			   
end Datapath;