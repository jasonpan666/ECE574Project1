----------------------------------------------------------------------------------
-- Company: WPI ECE
-- Engineer: Zhenyu Pan
-- 
-- Create Date: 10/10/2017
-- Design Name: ECE574 Project1
-- Module Name: clock_generate_1MHz - Behavioral
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

entity clock_generate_1MHz is
Port(clk_fpga : in STD_LOGIC;
	 rst    : in STD_LOGIC;
	 clk_1MHz : out STD_LOGIC);
end entity;


architecture Behavioral of clock_generate_1MHz is

signal count_100 : integer range 0 to 100;
signal clk_1MHz_buffer: STD_LOGIC;

begin

process(clk_fpga, rst)
begin
	if rst = '1' then
		count_100 <= 0;
	elsif rising_edge(clk_fpga) then
		if count_100 = 49 then
			count_100 <= 0;
		else
			count_100 <= count_100 + 1;
		end if;
	end if;
end process;

process(clk_fpga, rst)
begin
	if rst = '1' then
		clk_1MHz_buffer <= '0';
	elsif rising_edge(clk_fpga) then
		if count_100 = 0 then
			clk_1MHz_buffer <= not clk_1MHz_buffer;
		else
			clk_1MHz_buffer <= clk_1MHz_buffer;
		end if;
	end if;
end process;

clk_1MHz <= clk_1MHz_buffer;

end Behavioral;
