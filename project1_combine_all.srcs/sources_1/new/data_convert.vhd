----------------------------------------------------------------------------------
-- Company: WPI ECE
-- Engineer: Zhenyu Pan
-- 
-- Create Date: 10/10/2017
-- Design Name: ECE574 Project1
-- Module Name: data_convert - Behavioral
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

entity data_convert is
	port(	clk_fpga : in STD_LOGIC;
			rst : in STD_LOGIC;
			data_in : in STD_LOGIC_VECTOR (3 downto 0);
			data_out : out STD_LOGIC_VECTOR (6 downto 0)
		);
end data_convert;

architecture Behavioral of data_convert is

constant ZERO : STD_LOGIC_VECTOR (6 downto 0) := "1000000";
constant ONE  : STD_LOGIC_VECTOR (6 downto 0) := "1111001";
constant TWO  : STD_LOGIC_VECTOR (6 downto 0) := "0100100";
constant THREE: STD_LOGIC_VECTOR (6 downto 0) := "0110000";
constant FOUR : STD_LOGIC_VECTOR (6 downto 0) := "0011001";
constant FIVE : STD_LOGIC_VECTOR (6 downto 0) := "0010010";
constant SIX  : STD_LOGIC_VECTOR (6 downto 0) := "0000010";
constant SEVEN: STD_LOGIC_VECTOR (6 downto 0) := "1111000";
constant EIGHT: STD_LOGIC_VECTOR (6 downto 0) := "0000000";
constant NINE : STD_LOGIC_VECTOR (6 downto 0) := "0010000";
constant TEN  : STD_LOGIC_VECTOR (6 downto 0) := "0001000";
constant ELEVEN : STD_LOGIC_VECTOR (6 downto 0) := "0000011";
constant TWELVE : STD_LOGIC_VECTOR (6 downto 0) := "1000110";
constant THIRTEEN : STD_LOGIC_VECTOR (6 downto 0) := "0100001";
constant FOURTEEN : STD_LOGIC_VECTOR (6 downto 0) := "0000110";
constant FIFTEEN : STD_LOGIC_VECTOR (6 downto 0) := "0001110";

begin

process(data_in, clk_fpga, rst)
begin
	if rst = '1' then
		data_out <= ONE;
	elsif rising_edge(clk_fpga) then
		case data_in is
			when "0000" => data_out <= ZERO;
			when "0001" => data_out <= ONE;
			when "0010" => data_out <= TWO;
			when "0011" => data_out <= THREE;
			when "0100" => data_out <= FOUR;
			when "0101" => data_out <= FIVE;
			when "0110" => data_out <= SIX;
			when "0111" => data_out <= SEVEN;
			when "1000" => data_out <= EIGHT;
			when "1001" => data_out <= NINE;
			when "1010" => data_out <= TEN;
			when "1011" => data_out <= ELEVEN;
			when "1100" => data_out <= TWELVE;
			when "1101" => data_out <= THIRTEEN;
		    when "1110" => data_out <= FOURTEEN;
			when "1111" => data_out <= FIFTEEN;
		end case;
	end if;
end process;

end Behavioral;
