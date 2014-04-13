--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:27:11 07/10/2012
-- Design Name:   
-- Module Name:   C:/My_Designs/ECE281_Xilinx14/PRISM_test/Datapath_testbench.vhd
-- Project Name:  PRISM_test
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Datapath
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Datapath_testbench IS
END Datapath_testbench;
 
ARCHITECTURE behavior OF Datapath_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Datapath
    PORT(
         --Control_Bus : OUT  std_logic_vector(25 downto 0);
         IRLd : IN  std_logic;
         MARLoLd : IN  std_logic;
         MARHiLd : IN  std_logic;
         JmpSel : IN  std_logic;
         PCLd : IN  std_logic;
         AddrSel : IN  std_logic;
         AccLd : IN  std_logic;
         EnAccBuffer : IN  std_logic;
         OpSel : IN  std_logic_vector(2 downto 0);
         Addr : OUT  std_logic_vector(7 downto 0);
         AeqZero : OUT  std_logic;
         AlessZero : OUT  std_logic;
         IR : OUT  std_logic_vector(3 downto 0);
         Reset_L : IN  std_logic;
         Clock : IN  std_logic;
         Data : INOUT  std_logic_vector(3 downto 0);
         --IOSEL_L : IN  std_logic;
         --MEMSEL_L : IN  std_logic;
         --R_W : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal IRLd : std_logic := '0';
   signal MARLoLd : std_logic := '0';
   signal MARHiLd : std_logic := '0';
   signal JmpSel : std_logic := '0';
   signal PCLd : std_logic := '0';
   signal AddrSel : std_logic := '0';
   signal AccLd : std_logic := '0';
   signal EnAccBuffer : std_logic := '0';
   signal OpSel : std_logic_vector(2 downto 0) := (others => '0');
   signal Reset_L : std_logic := '0';
   signal Clock : std_logic := '0';
   --signal IOSEL_L : std_logic := '0';
   --signal MEMSEL_L : std_logic := '0';
   --signal R_W : std_logic := '0';

	--BiDirs
   signal Data : std_logic_vector(3 downto 0);

 	--Outputs
   --signal Control_Bus : std_logic_vector(25 downto 0);
   signal Addr : std_logic_vector(7 downto 0);
   signal AeqZero : std_logic;
   signal AlessZero : std_logic;
   signal IR : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant Clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Datapath PORT MAP (
          --Control_Bus => Control_Bus,
          IRLd => IRLd,
          MARLoLd => MARLoLd,
          MARHiLd => MARHiLd,
          JmpSel => JmpSel,
          PCLd => PCLd,
          AddrSel => AddrSel,
          AccLd => AccLd,
          EnAccBuffer => EnAccBuffer,
          OpSel => OpSel,
          Addr => Addr,
          AeqZero => AeqZero,
          AlessZero => AlessZero,
          IR => IR,
          Reset_L => Reset_L,
          Clock => Clock,
          Data => Data,
          --IOSEL_L => IOSEL_L,
          --MEMSEL_L => MEMSEL_L,
          --R_W => R_W
        );

   -- Clock process definitions
   Clock_process :process
   begin
		Clock <= '0';
		wait for Clock_period/2;
		Clock <= '1';
		wait for Clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
		
		RESET_L<='0';  
		wait for 10 ns;
		
		RESET_L<='1';
		IRLd <= '1';				
		MARLoLd <= '0';
		MARHiLd <= '0';
		JmpSel <=  '0';
		PCLd <=  '1';
		AddrSel <=  '0';
		AccLd <=  '0';
		EnAccBuffer <=  '0';
		OpSel <= "000";
		Data <= "0111";
		wait for 16 ns;

		IRLd <= '0';			   
		MARLoLd <= '0';
		MARHiLd <= '0';
		JmpSel <=  '0';
		PCLd <=  '1';
		AddrSel <=  '0';
		AccLd <=  '0';
		EnAccBuffer <=  '0';
		OpSel <= "000";
		Data <= "1011";
		wait for 10 ns;
		
		IRLd <= '0';			  
		MARLoLd <= '0';
		MARHiLd <= '0';
		JmpSel <=  '0';
		PCLd <=  '0';
		AddrSel <=  '0';
		AccLd <=  '1';
		EnAccBuffer <=  '0';
		OpSel <= "111";
		Data <= "1011";
		wait for 10 ns;		
		
		IRLd <= '1';	  	 
		MARLoLd <= '0';
		MARHiLd <= '0';
		JmpSel <=  '0';
		PCLd <=  '1';
		AddrSel <=  '0';
		AccLd <=  '0';
		EnAccBuffer <=  '0';
		OpSel <= "000";
		Data <= "0011";
		wait for 10 ns;
		
		IRLd <= '0';			   
		MARLoLd <= '0';
		MARHiLd <= '0';
		JmpSel <=  '0';
		PCLd <=  '0';
		AddrSel <=  '0';
		AccLd <=  '0';
		EnAccBuffer <=  '0';
		OpSel <= "000";
		Data <= "0100";
		wait for 10 ns;
					
		IRLd <= '0';				
		MARLoLd <= '0';
		MARHiLd <= '0';
		JmpSel <=  '0';
		PCLd <=  '0';
		AddrSel <=  '0';
		AccLd <=  '1';
		EnAccBuffer <=  '0';
		OpSel <= "011";
		Data <= "ZZZZ";
		wait for 10 ns;
		
		IRLd <= '1';	  	 
		MARLoLd <= '0';
		MARHiLd <= '0';
		JmpSel <=  '0';
		PCLd <=  '1';
		AddrSel <=  '0';
		AccLd <=  '0';
		EnAccBuffer <=  '0';
		OpSel <= "000";
		Data <= "0100";
		wait for 10 ns;
		
		IRLd <= '0';			   
		MARLoLd <= '0';
		MARHiLd <= '0';
		JmpSel <=  '0';
		PCLd <=  '0';
		AddrSel <=  '0';
		AccLd <=  '0';
		EnAccBuffer <=  '0';
		OpSel <= "000";
		Data <= "0011";
		wait for 10 ns;
			
		IRLd <= '0';		
		MARLoLd <= '1';
		MARHiLd <= '0';
		JmpSel <=  '0';
		PCLd <=  '1';
		AddrSel <=  '0';
		AccLd <=  '0';
		EnAccBuffer <=  '0';
		OpSel <= "000";
		Data <= "0011";
		wait for 10 ns;
						
		IRLd <= '0';				  
		MARLoLd <= '0';
		MARHiLd <= '0';
		JmpSel <=  '0';
		PCLd <=  '0';
		AddrSel <=  '1';
		AccLd <=  '0';
		EnAccBuffer <=  '1';
		OpSel <= "100";
		Data <= "ZZZZ";
		wait for 10 ns;
		
		
		IRLd <= '1';				
		MARLoLd <= '0';
		MARHiLd <= '0';
		JmpSel <=  '0';
		PCLd <=  '1';
		AddrSel <=  '0';
		AccLd <=  '0';
		EnAccBuffer <=  '0';
		OpSel <= "000";
		Data <= "0000";
		wait for 10 ns;
		
		IRLd <= '0';			   
		MARLoLd <= '0';
		MARHiLd <= '0';
		JmpSel <=  '0';
		PCLd <=  '0';
		AddrSel <=  '0';
		AccLd <=  '0';
		EnAccBuffer <=  '0';
		OpSel <= "000";
		Data <= "1101";
		wait for 10 ns;
		
		IRLd <= '1';	  	 
		MARLoLd <= '0';
		MARHiLd <= '0';
		JmpSel <=  '0';
		PCLd <=  '1';
		AddrSel <=  '0';
		AccLd <=  '0';
		EnAccBuffer <=  '0';
		OpSel <= "000";
		Data <= "1101";
		wait for 10 ns;
		
		IRLd <= '0';			   
		MARLoLd <= '0';
		MARHiLd <= '0';
		JmpSel <=  '0';
		PCLd <=  '0';
		AddrSel <=  '0';
		AccLd <=  '0';
		EnAccBuffer <=  '0';
		OpSel <= "000";
		Data <= "0000";
		wait for 10 ns;
			
		IRLd <= '0';		
		MARLoLd <= '1';
		MARHiLd <= '0';
		JmpSel <=  '0';
		PCLd <=  '1';
		AddrSel <=  '0';
		AccLd <=  '0';
		EnAccBuffer <=  '0';
		OpSel <= "000";
		Data <= "0000";
		wait for 10 ns;
						
		IRLd <= '0';		
		MARLoLd <= '0';
		MARHiLd <= '1';
		JmpSel <=  '0';
		PCLd <=  '1';
		AddrSel <=  '0';
		AccLd <=  '0';
		EnAccBuffer <=  '0';
		OpSel <= "000";
		Data <= "1011";
		wait for 10 ns;
						
		IRLd <= '0';				  
		MARLoLd <= '0';
		MARHiLd <= '0';
		JmpSel <=  '0';
		PCLd <=  '0';
		AddrSel <=  '1';
		AccLd <=  '0';
		EnAccBuffer <=  '1';
		OpSel <= "101";
		Data <= "ZZZZ";
		wait for 10 ns;
		
		IRLd <= '1';	  	  
		MARLoLd <= '0';
		MARHiLd <= '0';
		JmpSel <=  '0';
		PCLd <=  '1';
		AddrSel <=  '0';
		AccLd <=  '0';
		EnAccBuffer <=  '0';
		OpSel <= "000";
		Data <= "1011";
		wait for 10 ns;
		
		IRLd <= '0';			   
		MARLoLd <= '0';
		MARHiLd <= '0';
		JmpSel <=  '0';
		PCLd <=  '0';
		AddrSel <=  '0';
		AccLd <=  '0';
		EnAccBuffer <=  '0';
		OpSel <= "000";
		Data <= "0010";
		wait for 10 ns;
			
		IRLd <= '0';		
		MARLoLd <= '1';
		MARHiLd <= '0';
		JmpSel <=  '0';
		PCLd <=  '1';
		AddrSel <=  '0';
		AccLd <=  '0';
		EnAccBuffer <=  '0';
		OpSel <= "000";
		Data <= "0010";
		wait for 10 ns;
						
		IRLd <= '0';		
		MARLoLd <= '0';
		MARHiLd <= '1';
		JmpSel <=  '0';
		PCLd <=  '1';
		AddrSel <=  '0';
		AccLd <=  '0';
		EnAccBuffer <=  '0';
		OpSel <= "000";
		Data <= "0000";
		wait for 10 ns;
						
		IRLd <= '0';				  
		MARLoLd <= '0';
		MARHiLd <= '0';
		JmpSel <=  '1';
		PCLd <=  '1';
		AddrSel <=  '1';
		AccLd <=  '0';
		EnAccBuffer <=  '0';
		OpSel <= "000";
		Data <= "0111";
		wait for 10 ns;
	
		IRLd <= '1';	  	 
		MARLoLd <= '0';
		MARHiLd <= '0';
		JmpSel <=  '0';
		PCLd <=  '1';
		AddrSel <=  '0';
		AccLd <=  '0';
		EnAccBuffer <=  '0';
		OpSel <= "000";
		Data <= "0011";
		wait for 10 ns;
		
		IRLd <= '0';			   
		MARLoLd <= '0';
		MARHiLd <= '0';
		JmpSel <=  '0';
		PCLd <=  '0';
		AddrSel <=  '0';
		AccLd <=  '0';
		EnAccBuffer <=  '0';
		OpSel <= "000";
		Data <= "0100";
		wait for 10 ns;
					
		IRLd <= '0';				  
		MARLoLd <= '0';
		MARHiLd <= '0';
		JmpSel <=  '0';
		PCLd <=  '0';
		AddrSel <=  '0';
		AccLd <=  '1';
		EnAccBuffer <=  '0';
		OpSel <= "011";
		Data <= "ZZZZ";
		wait for 10 ns;
		
		IRLd <= '1';	  	 
		MARLoLd <= '0';
		MARHiLd <= '0';
		JmpSel <=  '0';
		PCLd <=  '1';
		AddrSel <=  '0';
		AccLd <=  '0';
		EnAccBuffer <=  '0';
		OpSel <= "000";
		Data <= "0100";
		wait for 10 ns;
		
		IRLd <= '0';			   
		MARLoLd <= '0';
		MARHiLd <= '0';
		JmpSel <=  '0';
		PCLd <=  '0';
		AddrSel <=  '0';
		AccLd <=  '0';
		EnAccBuffer <=  '0';
		OpSel <= "000";
		Data <= "0011";
		wait for 10 ns;
			
		IRLd <= '0';		
		MARLoLd <= '1';
		MARHiLd <= '0';
		JmpSel <=  '0';
		PCLd <=  '1';
		AddrSel <=  '0';
		AccLd <=  '0';
		EnAccBuffer <=  '0';
		OpSel <= "000";
		Data <= "0011";
		wait for 10 ns;
						
		IRLd <= '0';				  
		MARLoLd <= '0';
		MARHiLd <= '0';
		JmpSel <=  '0';
		PCLd <=  '0';
		AddrSel <=  '1';
		AccLd <=  '0';
		EnAccBuffer <=  '1';
		OpSel <= "100";
		Data <= "ZZZZ";
		wait for 10 ns;
		
		
		IRLd <= '1';				
		MARLoLd <= '0';
		MARHiLd <= '0';
		JmpSel <=  '0';
		PCLd <=  '1';
		AddrSel <=  '0';
		AccLd <=  '0';
		EnAccBuffer <=  '0';
		OpSel <= "000";
		Data <= "0000";
		wait for 10 ns;
		
		IRLd <= '0';			   
		MARLoLd <= '0';
		MARHiLd <= '0';
		JmpSel <=  '0';
		PCLd <=  '0';
		AddrSel <=  '0';
		AccLd <=  '0';
		EnAccBuffer <=  '0';
		OpSel <= "000";
		Data <= "1101";
		wait for 10 ns;
		
		IRLd <= '1';	  	 
		MARLoLd <= '0';
		MARHiLd <= '0';
		JmpSel <=  '0';
		PCLd <=  '1';
		AddrSel <=  '0';
		AccLd <=  '0';
		EnAccBuffer <=  '0';
		OpSel <= "000";
		Data <= "1101";
		wait for 10 ns;
		
		IRLd <= '0';			   
		MARLoLd <= '0';
		MARHiLd <= '0';
		JmpSel <=  '0';
		PCLd <=  '0';
		AddrSel <=  '0';
		AccLd <=  '0';
		EnAccBuffer <=  '0';
		OpSel <= "000";
		Data <= "0000";
		wait for 10 ns;
			
		IRLd <= '0';		
		MARLoLd <= '1';
		MARHiLd <= '0';
		JmpSel <=  '0';
		PCLd <=  '1';
		AddrSel <=  '0';
		AccLd <=  '0';
		EnAccBuffer <=  '0';
		OpSel <= "000";
		Data <= "0000";
		wait for 10 ns;
						
		IRLd <= '0';		
		MARLoLd <= '0';
		MARHiLd <= '1';
		JmpSel <=  '0';
		PCLd <=  '1';
		AddrSel <=  '0';
		AccLd <=  '0';
		EnAccBuffer <=  '0';
		OpSel <= "000";
		Data <= "1011";
		wait for 10 ns;
						
		IRLd <= '0';				  
		MARLoLd <= '0';
		MARHiLd <= '0';
		JmpSel <=  '0';
		PCLd <=  '0';
		AddrSel <=  '1';
		AccLd <=  '0';
		EnAccBuffer <=  '1';
		OpSel <= "101";
		Data <= "ZZZZ";
		wait for 10 ns;
		
		IRLd <= '1';	  	  
		MARLoLd <= '0';
		MARHiLd <= '0';
		JmpSel <=  '0';
		PCLd <=  '1';
		AddrSel <=  '0';
		AccLd <=  '0';
		EnAccBuffer <=  '0';
		OpSel <= "000";
		Data <= "1011";
		wait for 10 ns;
		
		IRLd <= '0';			  
		MARLoLd <= '0';
		MARHiLd <= '0';
		JmpSel <=  '0';
		PCLd <=  '0';
		AddrSel <=  '0';
		AccLd <=  '0';
		EnAccBuffer <=  '0';
		OpSel <= "000";
		Data <= "0010";
		wait for 10 ns;
			
		IRLd <= '0';		
		MARLoLd <= '1';
		MARHiLd <= '0';
		JmpSel <=  '0';
		PCLd <=  '1';
		AddrSel <=  '0';
		AccLd <=  '0';
		EnAccBuffer <=  '0';
		OpSel <= "000";
		Data <= "0010";
		wait for 10 ns;
						
		IRLd <= '0';		
		MARLoLd <= '0';
		MARHiLd <= '1';
		JmpSel <=  '0';
		PCLd <=  '1';
		AddrSel <=  '0';
		AccLd <=  '0';
		EnAccBuffer <=  '0';
		OpSel <= "000";
		Data <= "0000";
		wait for 10 ns;
						
		IRLd <= '0';				  
		MARLoLd <= '0';
		MARHiLd <= '0';
		JmpSel <=  '1';
		PCLd <=  '1';
		AddrSel <=  '1';
		AccLd <=  '0';
		EnAccBuffer <=  '0';
		OpSel <= "000";
		Data <= "0111";
		wait for 10 ns;
	
		IRLd <= '1';	  	 
		MARLoLd <= '0';
		MARHiLd <= '0';
		JmpSel <=  '0';
		PCLd <=  '1';
		AddrSel <=  '0';
		AccLd <=  '0';
		EnAccBuffer <=  '0';
		OpSel <= "000";
		Data <= "0011";
		wait for 10 ns;
		
		IRLd <= '0';			   
		MARLoLd <= '0';
		MARHiLd <= '0';
		JmpSel <=  '0';
		PCLd <=  '0';
		AddrSel <=  '0';
		AccLd <=  '0';
		EnAccBuffer <=  '0';
		OpSel <= "000";
		Data <= "0100";
		wait for 10 ns;
					
		IRLd <= '0';				  
		MARLoLd <= '0';
		MARHiLd <= '0';
		JmpSel <=  '0';
		PCLd <=  '0';
		AddrSel <=  '0';
		AccLd <=  '1';
		EnAccBuffer <=  '0';
		OpSel <= "011";
		Data <= "ZZZZ";
		wait for 10 ns;
		
		IRLd <= '1';	  	 
		MARLoLd <= '0';
		MARHiLd <= '0';
		JmpSel <=  '0';
		PCLd <=  '1';
		AddrSel <=  '0';
		AccLd <=  '0';
		EnAccBuffer <=  '0';
		OpSel <= "000";
		Data <= "0100";
		wait for 10 ns;
		
		IRLd <= '0';			   
		MARLoLd <= '0';
		MARHiLd <= '0';
		JmpSel <=  '0';
		PCLd <=  '0';
		AddrSel <=  '0';
		AccLd <=  '0';
		EnAccBuffer <=  '0';
		OpSel <= "000";
		Data <= "0011";
		wait for 10 ns;
			
		IRLd <= '0';		
		MARLoLd <= '1';
		MARHiLd <= '0';
		JmpSel <=  '0';
		PCLd <=  '1';
		AddrSel <=  '0';
		AccLd <=  '0';
		EnAccBuffer <=  '0';
		OpSel <= "000";
		Data <= "0011";
		wait for 10 ns;
						
		IRLd <= '0';				  
		MARLoLd <= '0';
		MARHiLd <= '0';
		JmpSel <=  '0';
		PCLd <=  '0';
		AddrSel <=  '1';
		AccLd <=  '0';
		EnAccBuffer <=  '1';
		OpSel <= "100";
		Data <= "ZZZZ";
		wait for 10 ns;
		
		
		IRLd <= '1';				
		MARLoLd <= '0';
		MARHiLd <= '0';
		JmpSel <=  '0';
		PCLd <=  '1';
		AddrSel <=  '0';
		AccLd <=  '0';
		EnAccBuffer <=  '0';
		OpSel <= "000";
		Data <= "0000";
		wait for 10 ns;
		
		IRLd <= '0';			   
		MARLoLd <= '0';
		MARHiLd <= '0';
		JmpSel <=  '0';
		PCLd <=  '0';
		AddrSel <=  '0';
		AccLd <=  '0';
		EnAccBuffer <=  '0';
		OpSel <= "000";
		Data <= "1101";
		wait for 10 ns;
		
		IRLd <= '1';	  	 
		MARLoLd <= '0';
		MARHiLd <= '0';
		JmpSel <=  '0';
		PCLd <=  '1';
		AddrSel <=  '0';
		AccLd <=  '0';
		EnAccBuffer <=  '0';
		OpSel <= "000";
		Data <= "1101";
		wait for 10 ns;
		
		IRLd <= '0';			   
		MARLoLd <= '0';
		MARHiLd <= '0';
		JmpSel <=  '0';
		PCLd <=  '0';
		AddrSel <=  '0';
		AccLd <=  '0';
		EnAccBuffer <=  '0';
		OpSel <= "000";
		Data <= "0000";
		wait for 10 ns;
			
		IRLd <= '0';		
		MARLoLd <= '1';
		MARHiLd <= '0';
		JmpSel <=  '0';
		PCLd <=  '1';
		AddrSel <=  '0';
		AccLd <=  '0';
		EnAccBuffer <=  '0';
		OpSel <= "000";
		Data <= "0000";
		wait for 10 ns;
						
		IRLd <= '0';		
		MARLoLd <= '0';
		MARHiLd <= '1';
		JmpSel <=  '0';
		PCLd <=  '1';
		AddrSel <=  '0';
		AccLd <=  '0';
		EnAccBuffer <=  '0';
		OpSel <= "000";
		Data <= "1011";
		wait for 10 ns;
						
		IRLd <= '0';				  
		MARLoLd <= '0';
		MARHiLd <= '0';
		JmpSel <=  '0';
		PCLd <=  '0';
		AddrSel <=  '1';
		AccLd <=  '0';
		EnAccBuffer <=  '1';
		OpSel <= "101";
		Data <= "ZZZZ";
		wait for 10 ns;
		
		IRLd <= '1';	  	 
		MARLoLd <= '0';
		MARHiLd <= '0';
		JmpSel <=  '0';
		PCLd <=  '1';
		AddrSel <=  '0';
		AccLd <=  '0';
		EnAccBuffer <=  '0';
		OpSel <= "000";
		Data <= "1011";
		wait for 10 ns;
		
		IRLd <= '0';			   
		MARLoLd <= '0';
		MARHiLd <= '0';
		JmpSel <=  '0';
		PCLd <=  '0';
		AddrSel <=  '0';
		AccLd <=  '0';
		EnAccBuffer <=  '0';
		OpSel <= "000";
		Data <= "0010";
		wait for 10 ns;
			
		IRLd <= '0';		
		MARLoLd <= '1';
		MARHiLd <= '0';
		JmpSel <=  '0';
		PCLd <=  '1';
		AddrSel <=  '0';
		AccLd <=  '0';
		EnAccBuffer <=  '0';
		OpSel <= "000";
		Data <= "0010";
		wait for 10 ns;
						
		IRLd <= '0';		
		MARLoLd <= '0';
		MARHiLd <= '1';
		JmpSel <=  '0';
		PCLd <=  '1';
		AddrSel <=  '0';
		AccLd <=  '0';
		EnAccBuffer <=  '0';
		OpSel <= "000";
		Data <= "0000";
		wait for 10 ns;
						
		IRLd <= '0';				  
		MARLoLd <= '0';
		MARHiLd <= '0';
		JmpSel <=  '0';
		PCLd <=  '0';
		AddrSel <=  '1';
		AccLd <=  '0';
		EnAccBuffer <=  '0';
		OpSel <= "000";
		Data <= "1001";
		wait for 10 ns;
		
		IRLd <= '1';	  	  
		MARLoLd <= '0';
		MARHiLd <= '0';
		JmpSel <=  '0';
		PCLd <=  '1';
		AddrSel <=  '0';
		AccLd <=  '0';
		EnAccBuffer <=  '0';
		OpSel <= "000";
		Data <= "1001";
		wait for 10 ns;
		
		IRLd <= '0';			   
		MARLoLd <= '0';
		MARHiLd <= '0';
		JmpSel <=  '0';
		PCLd <=  '0';
		AddrSel <=  '0';
		AccLd <=  '0';
		EnAccBuffer <=  '0';
		OpSel <= "000";
		Data <= "1100";
		wait for 10 ns;
			
		IRLd <= '0';		
		MARLoLd <= '1';
		MARHiLd <= '0';
		JmpSel <=  '0';
		PCLd <=  '1';
		AddrSel <=  '0';
		AccLd <=  '0';
		EnAccBuffer <=  '0';
		OpSel <= "000";
		Data <= "1100";
		wait for 10 ns;
						
		IRLd <= '0';		
		MARLoLd <= '0';
		MARHiLd <= '1';
		JmpSel <=  '0';
		PCLd <=  '1';
		AddrSel <=  '0';
		AccLd <=  '0';
		EnAccBuffer <=  '0';
		OpSel <= "000";
		Data <= "0000";
		wait for 10 ns;
						
		IRLd <= '0';				  
		MARLoLd <= '0';
		MARHiLd <= '0';
		JmpSel <=  '1';
		PCLd <=  '1';
		AddrSel <=  '1';
		AccLd <=  '0';
		EnAccBuffer <=  '0';
		OpSel <= "000";
		Data <= "ZZZZ";
		wait for 10 ns;
		
		IRLd <= '1';	  	  
		MARLoLd <= '0';
		MARHiLd <= '0';
		JmpSel <=  '0';
		PCLd <=  '1';
		AddrSel <=  '0';
		AccLd <=  '0';
		EnAccBuffer <=  '0';
		OpSel <= "000";
		Data <= "1001";
		wait for 10 ns;
		
		IRLd <= '0';			   
		MARLoLd <= '0';
		MARHiLd <= '0';
		JmpSel <=  '0';
		PCLd <=  '0';
		AddrSel <=  '0';
		AccLd <=  '0';
		EnAccBuffer <=  '0';
		OpSel <= "000";
		Data <= "1100";
		wait for 10 ns;
			
		IRLd <= '0';		
		MARLoLd <= '1';
		MARHiLd <= '0';
		JmpSel <=  '0';
		PCLd <=  '1';
		AddrSel <=  '0';
		AccLd <=  '0';
		EnAccBuffer <=  '0';
		OpSel <= "000";
		Data <= "1100";
		wait for 10 ns;
						
		IRLd <= '0';		
		MARLoLd <= '0';
		MARHiLd <= '1';
		JmpSel <=  '0';
		PCLd <=  '1';
		AddrSel <=  '0';
		AccLd <=  '0';
		EnAccBuffer <=  '0';
		OpSel <= "000";
		Data <= "0000";
		wait for 10 ns;
						
		IRLd <= '0';				  
		MARLoLd <= '0';
		MARHiLd <= '0';
		JmpSel <=  '1';
		PCLd <=  '1';
		AddrSel <=  '1';
		AccLd <=  '0';
		EnAccBuffer <=  '0';
		OpSel <= "000";
		Data <= "ZZZZ";
		wait for 10 ns;
		
		IRLd <= '1';	  	  
		MARLoLd <= '0';
		MARHiLd <= '0';
		JmpSel <=  '0';
		PCLd <=  '1';
		AddrSel <=  '0';
		AccLd <=  '0';
		EnAccBuffer <=  '0';
		OpSel <= "000";
		Data <= "1001";
		wait for 10 ns;
		
		IRLd <= '0';			   
		MARLoLd <= '0';
		MARHiLd <= '0';
		JmpSel <=  '0';
		PCLd <=  '0';
		AddrSel <=  '0';
		AccLd <=  '0';
		EnAccBuffer <=  '0';
		OpSel <= "000";
		Data <= "1100";
		wait for 10 ns;
			
		IRLd <= '0';		
		MARLoLd <= '1';
		MARHiLd <= '0';
		JmpSel <=  '0';
		PCLd <=  '1';
		AddrSel <=  '0';
		AccLd <=  '0';
		EnAccBuffer <=  '0';
		OpSel <= "000";
		Data <= "1100";
		wait for 10 ns;
						
		IRLd <= '0';		
		MARLoLd <= '0';
		MARHiLd <= '1';
		JmpSel <=  '0';
		PCLd <=  '1';
		AddrSel <=  '0';
		AccLd <=  '0';
		EnAccBuffer <=  '0';
		OpSel <= "000";
		Data <= "0000";
		wait for 10 ns;
						
		IRLd <= '0';				  
		MARLoLd <= '0';
		MARHiLd <= '0';
		JmpSel <=  '1';
		PCLd <=  '1';
		AddrSel <=  '1';
		AccLd <=  '0';
		EnAccBuffer <=  '0';
		OpSel <= "000";
		Data <= "ZZZZ";
		wait for 10 ns;
		
		IRLd <= '1';	  	  
		MARLoLd <= '0';
		MARHiLd <= '0';
		JmpSel <=  '0';
		PCLd <=  '1';
		AddrSel <=  '0';
		AccLd <=  '0';
		EnAccBuffer <=  '0';
		OpSel <= "000";
		Data <= "1001";
		wait for 10 ns;
		
		IRLd <= '0';			   
		MARLoLd <= '0';
		MARHiLd <= '0';
		JmpSel <=  '0';
		PCLd <=  '0';
		AddrSel <=  '0';
		AccLd <=  '0';
		EnAccBuffer <=  '0';
		OpSel <= "000";
		Data <= "1100";
		wait for 10 ns;
			
		IRLd <= '0';		
		MARLoLd <= '1';
		MARHiLd <= '0';
		JmpSel <=  '0';
		PCLd <=  '1';
		AddrSel <=  '0';
		AccLd <=  '0';
		EnAccBuffer <=  '0';
		OpSel <= "000";
		Data <= "1100";
		wait for 10 ns;
						
		IRLd <= '0';		
		MARLoLd <= '0';
		MARHiLd <= '1';
		JmpSel <=  '0';
		PCLd <=  '1';
		AddrSel <=  '0';
		AccLd <=  '0';
		EnAccBuffer <=  '0';
		OpSel <= "000";
		Data <= "0000";
		wait for 10 ns;
						
		IRLd <= '0';				  
		MARLoLd <= '0';
		MARHiLd <= '0';
		JmpSel <=  '1';
		PCLd <=  '1';
		AddrSel <=  '1';
		AccLd <=  '0';
		EnAccBuffer <=  '0';
		OpSel <= "000";
		Data <= "ZZZZ";
		wait for 10 ns;
		
		IRLd <= '1';	  	  
		MARLoLd <= '0';
		MARHiLd <= '0';
		JmpSel <=  '0';
		PCLd <=  '1';
		AddrSel <=  '0';
		AccLd <=  '0';
		EnAccBuffer <=  '0';
		OpSel <= "000";
		Data <= "1001";
		wait for 10 ns;
		
		IRLd <= '0';			   
		MARLoLd <= '0';
		MARHiLd <= '0';
		JmpSel <=  '0';
		PCLd <=  '0';
		AddrSel <=  '0';
		AccLd <=  '0';
		EnAccBuffer <=  '0';
		OpSel <= "000";
		Data <= "1100";
		wait for 10 ns;
			
		IRLd <= '0';		
		MARLoLd <= '1';
		MARHiLd <= '0';
		JmpSel <=  '0';
		PCLd <=  '1';
		AddrSel <=  '0';
		AccLd <=  '0';
		EnAccBuffer <=  '0';
		OpSel <= "000";
		Data <= "1100";
		wait for 10 ns;
						
		IRLd <= '0';		
		MARLoLd <= '0';
		MARHiLd <= '1';
		JmpSel <=  '0';
		PCLd <=  '1';
		AddrSel <=  '0';
		AccLd <=  '0';
		EnAccBuffer <=  '0';
		OpSel <= "000";
		Data <= "0000";
		wait for 10 ns;
						
		IRLd <= '0';				  
		MARLoLd <= '0';
		MARHiLd <= '0';
		JmpSel <=  '1';
		PCLd <=  '1';
		AddrSel <=  '1';
		AccLd <=  '0';
		EnAccBuffer <=  '0';
		OpSel <= "000";
		Data <= "ZZZZ";
		wait for 10 ns;
		
		IRLd <= '1';	  	  
		MARLoLd <= '0';
		MARHiLd <= '0';
		JmpSel <=  '0';
		PCLd <=  '1';
		AddrSel <=  '0';
		AccLd <=  '0';
		EnAccBuffer <=  '0';
		OpSel <= "000";
		Data <= "1001";
		wait for 10 ns;
		
		IRLd <= '0';			   
		MARLoLd <= '0';
		MARHiLd <= '0';
		JmpSel <=  '0';
		PCLd <=  '0';
		AddrSel <=  '0';
		AccLd <=  '0';
		EnAccBuffer <=  '0';
		OpSel <= "000";
		Data <= "1100";
		wait for 10 ns;
			
		IRLd <= '0';		
		MARLoLd <= '1';
		MARHiLd <= '0';
		JmpSel <=  '0';
		PCLd <=  '1';
		AddrSel <=  '0';
		AccLd <=  '0';
		EnAccBuffer <=  '0';
		OpSel <= "000";
		Data <= "1100";
		wait for 10 ns;
						
		IRLd <= '0';		
		MARLoLd <= '0';
		MARHiLd <= '1';
		JmpSel <=  '0';
		PCLd <=  '1';
		AddrSel <=  '0';
		AccLd <=  '0';
		EnAccBuffer <=  '0';
		OpSel <= "000";
		Data <= "0000";
		wait for 10 ns;
						
		IRLd <= '0';				  
		MARLoLd <= '0';
		MARHiLd <= '0';
		JmpSel <=  '1';
		PCLd <=  '1';
		AddrSel <=  '1';
		AccLd <=  '0';
		EnAccBuffer <=  '0';
		OpSel <= "000";
		Data <= "ZZZZ";
		wait for 10 ns;
	
      wait;
   end process;

END;
