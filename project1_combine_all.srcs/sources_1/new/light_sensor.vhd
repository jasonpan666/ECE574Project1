----------------------------------------------------------------------------------
-- Company: WPI ECE
-- Engineer: Zhenyu Pan
-- 
-- Create Date: 10/10/2017
-- Design Name: ECE574 Project1
-- Module Name: light_sensor - Behavioral
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

entity light_sensor is
	port(	clk_fpga: in STD_LOGIC;
			rst : in STD_LOGIC;
			
			sclk: out STD_LOGIC; -- drive the light sensor
			cs : out STD_LOGIC; -- choose mode in light sensor
			sdo : in STD_LOGIC; -- data in from light sensor
				
			display_out_l: out STD_LOGIC_VECTOR (3 downto 0);  -- for seven segment display the light intensity
			display_out_h: out STD_LOGIC_VECTOR (3 downto 0)
		);
end light_sensor;

architecture Behavioral of light_sensor is
	
	component clock_generate_1MHz is
		Port( clk_fpga : in STD_LOGIC;
			  rst    : in STD_LOGIC;
			  clk_1MHz : out STD_LOGIC
			  );
	end component;
	
	component PmodALS is
		Port( sclk  : in STD_LOGIC;
			  cs    : out STD_LOGIC;
			  rst : in STD_LOGIC;
			  sdo   : in STD_LOGIC;
			  data_out_H: out STD_LOGIC_VECTOR (3 downto 0);
			  data_out_L: out STD_LOGIC_VECTOR (3 downto 0)
			  );
	end component;

signal clk_1MHz : STD_LOGIC;
	
begin
-- named association
	U1 : clock_generate_1MHz Port map (clk_fpga => clk_fpga, rst => rst, clk_1MHz => clk_1MHz);
	U2 : PmodALS Port map (sclk => clk_1MHz, cs => cs, rst => rst, sdo => sdo, data_out_H => display_out_h, data_out_L => display_out_l);
-- sclk 
	sclk <= clk_1MHz;

end Behavioral;
