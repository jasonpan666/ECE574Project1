----------------------------------------------------------------------------------
-- Company: WPI ECE
-- Engineer: Zhenyu Pan
-- 
-- Create Date: 10/10/2017
-- Design Name: ECE574 Project1
-- Module Name: position_convert - Behavioral
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

entity position_convert is
	port(	clk_in : in STD_LOGIC;
			rst: in STD_LOGIC;
			
			position : in STD_LOGIC_VECTOR (4 downto 0);
			position_l : out STD_LOGIC_VECTOR (3 downto 0);
			position_h : out STD_LOGIC_VECTOR (3 downto 0)
		);
end entity;

architecture Behavioral of position_convert is

begin

process(clk_in, rst, position)
begin
	if rst = '1' then
		position_l <= "0000";
		position_h <= "0000";
	elsif rising_edge(clk_in) then
		case position is
			when "00000" =>  -- 0
				position_l <= "0000";
				position_h <= "0000";
			when "00001" =>  -- 1
				position_l <= "0001";
				position_h <= "0000";
			when "00010" =>  -- 2
				position_l <= "0010";
				position_h <= "0000";
			when "00011" =>  -- 3
				position_l <= "0011";
				position_h <= "0000";
			when "00100" =>  -- 4
				position_l <= "0100";
				position_h <= "0000";
			when "00101" =>  -- 5
				position_l <= "0101";
				position_h <= "0000";
			when "00110" =>  -- 6
				position_l <= "0110";
				position_h <= "0000";
			when "00111" =>  -- 7
				position_l <= "0111";
				position_h <= "0000";
			when "01000" =>  -- 8
				position_l <= "1000";
				position_h <= "0000";
			when "01001" =>  -- 9
				position_l <= "1001";
				position_h <= "0000";
			when "01010" =>  -- 10
				position_l <= "0000";
				position_h <= "0001";
			when "01011" =>  -- 11
				position_l <= "0001";
				position_h <= "0001";
			when "01100" =>  -- 12
				position_l <= "0010";
				position_h <= "0001";
			when "01101" =>  -- 13
				position_l <= "0011";
				position_h <= "0001";
			when "01110" =>  -- 14
				position_l <= "0100";
				position_h <= "0001";
			when "01111" =>  -- 15
				position_l <= "0101";
				position_h <= "0001";
			when "10000" =>  -- 16
				position_l <= "0110";
				position_h <= "0001";
			when "10001" =>  -- 17
				position_l <= "0111";
				position_h <= "0001";
			when "10010" =>  -- 18
				position_l <= "1000";
				position_h <= "0001";
			when "10011" =>  -- 19
				position_l <= "1001";
				position_h <= "0001";
			when "10100" =>  -- 20
				position_l <= "0000";
				position_h <= "0010";
			when others =>
				position_l <= "0000";
				position_h <= "0000";
		end case;
	end if;
end process;

end Behavioral;