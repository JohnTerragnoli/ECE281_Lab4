--------------------------------------------------------------------------------
-- Company: USAFA
-- Engineer: C3C John Paul Terragnoli 
--
-- Create Date:   23:16:48 04/07/2014
-- Design Name:   ALU testbench
-- Module Name:   C:/Users/C16John.Terragnoli/Documents/Documents/My Documents/Academics/Sophomore Year/Spring Semester/ECE 281/ISE Project Stuff/Lab4_Terragnoli/ALU_Testbench.vhd
-- Project Name:  Lab4_Terragnoli
-- Target Device:  ALU
-- Tool versions:  1.0
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU
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
 
ENTITY ALU_Testbench IS
END ALU_Testbench;
 
ARCHITECTURE behavior OF ALU_Testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         OpSel : IN  std_logic_vector(2 downto 0);
         Data : IN  std_logic_vector(3 downto 0);
         Accumulator : IN  std_logic_vector(3 downto 0);
         Result : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal OpSel : std_logic_vector(2 downto 0) := (others => '0');
   signal Data : std_logic_vector(3 downto 0) := (others => '0');
   signal Accumulator : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal Result : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          OpSel => OpSel,
          Data => Data,
          Accumulator => Accumulator,
          Result => Result
        );

   -- Clock process definitions
   <clock>_process :process
   begin
		<clock> <= '0';
		wait for <clock>_period/2;
		<clock> <= '1';
		wait for <clock>_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
