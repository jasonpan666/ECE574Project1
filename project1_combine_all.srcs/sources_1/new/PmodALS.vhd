----------------------------------------------------------------------------------
-- Company: WPI ECE
-- Engineer: Zhenyu Pan
-- 
-- Create Date: 10/10/2017
-- Design Name: ECE574 Project1
-- Module Name: PmodALS - Behavioral
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

entity PmodALS is
	Port( sclk  : in STD_LOGIC;
		  cs    : out STD_LOGIC;
		  rst : in STD_LOGIC;
		  sdo   : in STD_LOGIC;
		  data_out_H: out STD_LOGIC_VECTOR (3 downto 0);
		  data_out_L: out STD_LOGIC_VECTOR (3 downto 0)
		  );
end entity;

architecture Behavioral of PmodALS is

signal counter : integer range 0 to 31;
signal shift_register: STD_LOGIC_VECTOR (7 downto 0);

begin

---generate timing for the cs and sdo
process(rst, sclk)
begin
	if rst = '1' then
		counter <= 0;
	elsif rising_edge(sclk) then
		if counter = 31 then
			counter <= 0;
		else 
			counter <= counter + 1;
		end if;
	end if;
end process;

process(rst, sclk)
begin
	if rst = '1' then
		cs <= '1';
	elsif rising_edge(sclk) then
		if counter <= 20 then
			cs <= '0';
		else
			cs <= '1';
		end if;
	end if;
end process;

---- shift register to transfere data form sdo
process(rst, sclk)
begin
	if rst = '1' then
		shift_register <= "00000000";
	elsif rising_edge(sclk) then
			if counter > 3 and counter < 12 then
				shift_register(7 downto 1) <= shift_register(6 downto 0);
				shift_register(0) <= sdo;
			end if;
	end if;
end process;

data_out_H <= shift_register (7 downto 4);
data_out_L <= shift_register (3 downto 0);

end Behavioral;