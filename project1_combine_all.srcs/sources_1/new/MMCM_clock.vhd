----------------------------------------------------------------------------------
-- Company: WPI ECE
-- Engineer: Zhenyu Pan
-- 
-- Create Date: 10/10/2017
-- Design Name: ECE574 Project1
-- Module Name: MMCM_clock - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MMCM_clock is
	port (	clk_fpga: in STD_LOGIC;
			rst: in STD_LOGIC;
				
			clk_25MHz: out STD_LOGIC;
			locked: out STD_LOGIC 
		 );
end MMCM_clock;

architecture Behavioral of MMCM_clock is

component clk_wiz_0
port
 (-- Clock in ports
  clk_fpga           : in     std_logic;
  -- Clock out ports
  clk_25MHz          : out    std_logic;
  -- Status and control signals
  reset             : in     std_logic;
  locked            : out    std_logic
 );
end component;

begin
-- COMP_TAG_END ------ End COMPONENT Declaration ------------
-- The following code must appear in the VHDL architecture
-- body. Substitute your own instance name and net names.
------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG
U_mmcm_clock : clk_wiz_0
   port map ( 
   -- Clock in ports
   clk_fpga => clk_fpga,
  -- Clock out ports  
   clk_25MHz => clk_25MHz,
  -- Status and control signals                
   reset => rst,
   locked => locked            
 );


end Behavioral;
