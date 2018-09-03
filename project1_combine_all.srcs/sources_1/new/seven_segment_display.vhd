----------------------------------------------------------------------------------
-- Company: WPI ECE
-- Engineer: Zhenyu Pan
-- 
-- Create Date: 10/10/2017
-- Design Name: ECE574 Project1
-- Module Name: seven_segment_display - Behavioral
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

entity seven_segment_display is
	port(	clk_fpga: in STD_LOGIC;
			rst : in STD_LOGIC;
			
			d_in_0 : in STD_LOGIC_VECTOR (3 downto 0);				-- display data input
			d_in_1 : in STD_LOGIC_VECTOR (3 downto 0);
			d_in_2 : in STD_LOGIC_VECTOR (3 downto 0);
			d_in_3 : in STD_LOGIC_VECTOR (3 downto 0);
			d_in_4 : in STD_LOGIC_VECTOR (3 downto 0);
			d_in_5 : in STD_LOGIC_VECTOR (3 downto 0);
			d_in_6 : in STD_LOGIC_VECTOR (3 downto 0);
			d_in_7 : in STD_LOGIC_VECTOR (3 downto 0);
				
			AN : out STD_LOGIC_VECTOR (7 downto 0);
			seven_seg : out STD_LOGIC_VECTOR (6 downto 0)
		);
end seven_segment_display;

architecture Behavioral of seven_segment_display is

	component clock_generate_500Hz
		port(	clk_fpga: in STD_LOGIC;
				rst: in STD_LOGIC;
				clk_500Hz : out STD_LOGIC
			);
	end component;	

	component data_convert
		port(	
				clk_fpga : in STD_LOGIC;
				rst : in STD_LOGIC;
				data_in : in STD_LOGIC_VECTOR (3 downto 0);
				data_out : out STD_LOGIC_VECTOR (6 downto 0)
			);
	end component;
	
signal clk_500Hz : STD_LOGIC;	
signal counter_8 : integer range 0 to 8;

signal MEM_0: STD_LOGIC_VECTOR (6 downto 0);
signal MEM_1: STD_LOGIC_VECTOR (6 downto 0);
signal MEM_2: STD_LOGIC_VECTOR (6 downto 0);
signal MEM_3: STD_LOGIC_VECTOR (6 downto 0);
signal MEM_4: STD_LOGIC_VECTOR (6 downto 0);
signal MEM_5: STD_LOGIC_VECTOR (6 downto 0);
signal MEM_6: STD_LOGIC_VECTOR (6 downto 0);
signal MEM_7: STD_LOGIC_VECTOR (6 downto 0);

begin
U_clock_500Hz : clock_generate_500Hz port map(clk_fpga => clk_fpga, rst => rst, clk_500Hz => clk_500Hz);

U0 : data_convert port map (clk_fpga => clk_fpga, rst => rst, data_in => d_in_0, data_out => MEM_0);
U1 : data_convert port map (clk_fpga => clk_fpga, rst => rst, data_in => d_in_1, data_out => MEM_1);
U2 : data_convert port map (clk_fpga => clk_fpga, rst => rst, data_in => d_in_2, data_out => MEM_2);
U3 : data_convert port map (clk_fpga => clk_fpga, rst => rst, data_in => d_in_3, data_out => MEM_3);
U4 : data_convert port map (clk_fpga => clk_fpga, rst => rst, data_in => d_in_4, data_out => MEM_4);
U5 : data_convert port map (clk_fpga => clk_fpga, rst => rst, data_in => d_in_5, data_out => MEM_5);
U6 : data_convert port map (clk_fpga => clk_fpga, rst => rst, data_in => d_in_6, data_out => MEM_6);
U7 : data_convert port map (clk_fpga => clk_fpga, rst => rst, data_in => d_in_7, data_out => MEM_7);

--------- choose which anode to display 
process(clk_500Hz, rst)
begin
	if rst = '1' then
		counter_8 <= 0;
	elsif rising_edge(clk_500Hz) then
		if counter_8 = 7 then
			counter_8 <= 0;
		else
			counter_8 <= counter_8 + 1;
		end if;
	end if;
end process;

process(rst, clk_500Hz)
begin
	if rst = '1' then
		AN <= "00000000";
		seven_seg <= MEM_0;
	elsif rising_edge(clk_500Hz) then
		if counter_8 = 0 then
			AN <= "11111110";
			seven_seg <= MEM_0;
		end if;
		if counter_8 = 1 then
			AN <= "11111101";
			seven_seg <= MEM_1;
		end if;
		if counter_8 = 2 then
			AN <= "11111011" ;
			seven_seg <= MEM_2;
		end if;
		if counter_8 = 3 then
			AN <= "11110111";
			seven_seg <= MEM_3;
		end if;
		if counter_8 = 4 then
			AN <= "11101111";
			seven_seg <= MEM_4;
		end if;
		if counter_8 = 5 then
			AN <= "11011111";
			seven_seg <= MEM_5;
		end if;
		if counter_8 = 6 then 
			AN <= "10111111";
			seven_seg <= MEM_6;
		end if;
		if counter_8 = 7 then
			AN <= "01111111";
			seven_seg <= MEM_7;
		end if;
	end if;	
end process;


end Behavioral;
