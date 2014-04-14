--------------------------------------------------------------------------------
-- Company: USAFA
-- Engineer: C3C John Paul Terragnoli 
--
-- Create Date:   10:30 04/08/2014
-- Design Name:   Testbench for ALU
-- Project Name:  PRISM_test
-- Target Device:  ALU_shell
-- Tool versions:  1.0
-- Description:   tests the ALU shell 
-- 
-- VHDL Test Bench Created by ISE for module: ALU
-- 
-- Dependencies: ALU_shell.vhd
-- 
-- Revision: none
-- Revision 0.01 - File Created
-- Additional Comments: none
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
 
ENTITY ALU_testbench IS
END ALU_testbench;
 
ARCHITECTURE behavior OF ALU_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         OpSel : IN  std_logic_vector(2 downto 0);
         Data : IN  std_logic_vector(3 downto 0);
         Accumulator : IN  std_logic_vector(3 downto 0);
         Result : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;

   signal OpSel : std_logic_vector(2 downto 0) := (others => '0');
   signal Data : std_logic_vector(3 downto 0) := (others => '0');
   signal Accumulator : std_logic_vector(3 downto 0) := (others => '0');
   signal Result : std_logic_vector(3 downto 0);
 

BEGIN
 
   uut: ALU PORT MAP (
          OpSel => OpSel,
          Data => Data,
          Accumulator => Accumulator,
          Result => Result
        );

   stim_proc: process
	 
   begin		
      
		wait for 20 ns;
		
		OpSel <= "000";
		Data <= "0000";
		Accumulator <= "0000";
		wait for 20 ns;

		OpSel <= "000";
		Data <= "0001";
		Accumulator <= "0010";
		wait for 20 ns;

		OpSel <= "001";
		Data <= "0001";
		Accumulator <= "0011";
		wait for 20 ns;

		OpSel <= "001";
		Data <= "0010";
		Accumulator <= "0100";
		wait for 20 ns;
	
		OpSel <= "001";
		Data <= "0010";
		Accumulator <= "0101";
		wait for 20 ns;
		
		OpSel <= "010";
		Data <= "0011";
		Accumulator <= "0110";
		wait for 20 ns;
		
		OpSel <= "010";
		Data <= "0011";
		Accumulator <= "0111";
		wait for 20 ns;
		
		OpSel <= "010";
		Data <= "0100";
		Accumulator <= "1000";
		wait for 20 ns;
		
		OpSel <= "011";
		Data <= "0100";
		Accumulator <= "1001";
		wait for 20 ns;
		
		OpSel <= "011";
		Data <= "0101";
		Accumulator <= "1010";
		wait for 20 ns;

		OpSel <= "011";
		Data <= "0101";
		Accumulator <= "1011";
		wait for 20 ns;
		
		OpSel <= "100";
		Data <= "0110";
		Accumulator <= "1100";
		wait for 20 ns;
		
		OpSel <= "100";
		Data <= "0110";
		Accumulator <= "1101";
		wait for 20 ns;
		
		OpSel <= "100";
		Data <= "0111";
		Accumulator <= "1110";
		wait for 20 ns;
		
		OpSel <= "101";
		Data <= "0111";
		Accumulator <= "1111";
		wait for 20 ns;
		
		OpSel <= "101";
		Data <= "1000";
		Accumulator <= "0000";
		wait for 20 ns;
		
		OpSel <= "101";
		Data <= "1000";
		Accumulator <= "0001";
		wait for 20 ns;
		
		OpSel <= "110";
		Data <= "1001";
		Accumulator <= "0010";
		wait for 20 ns;
		
		OpSel <= "110";
		Data <= "1001";
		Accumulator <= "0011";
		wait for 20 ns;
		
		OpSel <= "110";
		Data <= "1010";
		Accumulator <= "0100";
		wait for 20 ns;
		
		OpSel <= "111";
		Data <= "1010";
		Accumulator <= "0101";
		wait for 20 ns;
		
		OpSel <= "111";
		Data <= "1011";
		Accumulator <= "0110";
		wait for 20 ns;
		
		OpSel <= "111";
		Data <= "1011";
		Accumulator <= "0111";
		wait for 20 ns;
		
		
      wait;
   end process;

END;
