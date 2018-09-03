----------------------------------------------------------------------------------
-- Company: WPI ECE
-- Engineer: Zhenyu Pan
-- 
-- Create Date: 10/10/2017
-- Design Name: ECE574 Project1 
-- Module Name: decimal_counter - Behavioral
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

entity decimal_counter is
	port(	clk_fpga: in STD_LOGIC;
			rst : in STD_LOGIC;
			display_out_l: out STD_LOGIC_VECTOR(3 downto 0); -- for seven segment display
			display_out_h: out STD_LOGIC_VECTOR(3 downto 0)  -- for seven segment display)
		);
end decimal_counter;

architecture Behavioral of decimal_counter is
	
	component clock_generate_4Hz is
		port (	clk_fpga : in STD_LOGIC;
				rst : in STD_LOGIC;
				
				clk_4Hz : out STD_LOGIC
			 );
	end component;

signal counter_l      : STD_LOGIC_VECTOR (3 downto 0); -- lower bit
signal counter_h      : STD_LOGIC_VECTOR (3 downto 0); -- higher bit
signal clk_4Hz        : STD_LOGIC; -- 4Hz clock
	
begin
-- connect the clock_generate_4Hz
U_clock_generate_4Hz : clock_generate_4Hz
port map (	clk_fpga => clk_fpga, rst => rst, clk_4Hz => clk_4Hz);

-- do decimal counter with the 4hz clock
process(rst, clk_4Hz)
begin
	if rst = '1' then
		counter_l <= "0000";
	elsif rising_edge(clk_4Hz) then
		if counter_l = 9 then
			counter_l <= "0000";
		else
			counter_l <= counter_l + '1';
		end if;
	end if;
end process;

process(rst, clk_4Hz)
begin
	if rst = '1' then
		counter_h <= "0000";
	elsif rising_edge(clk_4Hz) then
		if counter_l = 9 then
			if counter_h = 9 then
				counter_h <= "0000";
			else
				counter_h <= counter_h + '1';
			end if;
		end if;
	end if;
end process;

display_out_l <= counter_l;
display_out_h <= counter_h;

end Behavioral;
