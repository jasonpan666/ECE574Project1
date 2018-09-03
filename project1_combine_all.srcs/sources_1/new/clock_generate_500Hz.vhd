----------------------------------------------------------------------------------
-- Company: WPI ECE
-- Engineer: Zhenyu Pan
-- 
-- Create Date: 10/10/2017
-- Design Name: ECE574 Project1
-- Module Name: clock_generate_500Hz - Behavioral
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

entity clock_generate_500Hz is
	Port(	clk_fpga : in STD_LOGIC;
			rst    : in STD_LOGIC;
			clk_500Hz : out STD_LOGIC
		);
end entity;


architecture Behavioral of clock_generate_500Hz is

signal counter_4M : integer range 0 to 200000; --generate a 500Hz clock
signal clk_500Hz_buffer: STD_LOGIC;

begin

process(clk_fpga, rst)
begin
	if rst = '1' then
		counter_4M <= 0;
	elsif rising_edge(clk_fpga) then
		if counter_4M = 99999 then
			counter_4M <= 0;
		else
			counter_4M <= counter_4M + 1;
		end if;
	end if;
end process;

process(clk_fpga, rst)
begin
	if rst = '1' then
		clk_500Hz_buffer <= '0';
	elsif rising_edge(clk_fpga) then
		if counter_4M = 0 then
			clk_500Hz_buffer <= not clk_500Hz_buffer;
		else
			clk_500Hz_buffer <= clk_500Hz_buffer;
		end if;
	end if;
end process;

clk_500Hz <= clk_500Hz_buffer;

end Behavioral;