----------------------------------------------------------------------------------
-- Company: WPI ECE
-- Engineer: Zhenyu Pan
-- 
-- Create Date: 10/10/2017
-- Design Name: ECE574 Project1
-- Module Name: clock_generate_4Hz - Behavioral
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

entity clock_generate_4Hz is
	port(	clk_fpga : in STD_LOGIC;
			rst : in STD_LOGIC;
			
			clk_4Hz : out STD_LOGIC
		);
end clock_generate_4Hz;

architecture Behavioral of clock_generate_4Hz is

signal counter_100M   : integer range 0 to 99_999_999;
signal clk_4Hz_buffer : STD_LOGIC;

begin

--generate a 4Hz clock
process(rst, clk_fpga)
begin
	if rst = '1' then
		counter_100M <= 0;
	elsif rising_edge(clk_fpga) then
		if counter_100M = 12_499_499 then
			counter_100M <= 0;
		else
			counter_100M <= counter_100M + 1;
		end if;
	end if;
end process;

process(rst, clk_fpga)
begin
	if rst = '1' then
		clk_4Hz_buffer <= '0';
	elsif rising_edge(clk_fpga) then
		if counter_100M = 0 then
			clk_4Hz_buffer <= not clk_4Hz_buffer;
		else
			clk_4Hz_buffer <= clk_4Hz_buffer;
		end if;
	end if;
end process;

clk_4Hz <= clk_4Hz_buffer;

end Behavioral;
