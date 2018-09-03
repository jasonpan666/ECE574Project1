----------------------------------------------------------------------------------
-- Company: WPI ECE
-- Engineer: Zhenyu Pan
-- 
-- Create Date: 10/10/2017
-- Design Name: ECE574 Project1
-- Module Name: TOP_module - Behavioral
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

entity TOP_module is
	port(	clk_fpga: in STD_LOGIC;
			rst: in STD_LOGIC;
			
			-- connect seven segment display
			AN : out STD_LOGIC_VECTOR (7 downto 0);         
			seven_seg : out STD_LOGIC_VECTOR (6 downto 0);
			
			-- connect to VGA port
			RED: out STD_LOGIC_VECTOR (3 downto 0); -- color output RED
			GREEN: out STD_LOGIC_VECTOR (3 downto 0);
			BLUE : out STD_LOGIC_VECTOR (3 downto 0);
			
			HS : out STD_LOGIC; -- horizontal synch pulse
			VS : out STD_LOGIC; -- vertical synch pulse
			
			-- motion control and VGA mode choice
			up_button: in STD_LOGIC;     -- motion control
			down_button: in STD_LOGIC;		
			left_button: in STD_LOGIC;
			right_button: in STD_LOGIC;
			SW : in STD_LOGIC_VECTOR(5 downto 0);			-- choose different display mode
			
			-- connect to light sensor
			sclk: out STD_LOGIC; -- drive the light sensor
			cs : out STD_LOGIC; -- choose mode in light sensor
			sdo : in STD_LOGIC; -- data in from light sensor
			
			-- connect to the MMCM_clock
			locked : out STD_LOGIC 
			
		);
end TOP_module;

architecture Behavioral of TOP_module is

	
	component decimal_counter 
		port(	clk_fpga: in STD_LOGIC;
				rst : in STD_LOGIC;
				display_out_l: out STD_LOGIC_VECTOR(3 downto 0); -- for seven segment display
				display_out_h: out STD_LOGIC_VECTOR(3 downto 0)  -- for seven segment display
			);
	end component;

	component VGA_DISPLAY  
		port(	clk_25MHz: in STD_LOGIC;
				rst: in STD_LOGIC;
				
				up_button: in STD_LOGIC;     -- motion control
				down_button: in STD_LOGIC;		
				left_button: in STD_LOGIC;
				right_button: in STD_LOGIC;
				SW :in STD_LOGIC_VECTOR(5 downto 0);			-- choose different display mode
				
				RED: out STD_LOGIC_VECTOR (3 downto 0); -- color output RED
				GREEN: out STD_LOGIC_VECTOR (3 downto 0);
				BLUE : out STD_LOGIC_VECTOR (3 downto 0);
				
				HS : out STD_LOGIC; -- horizontal synch pulse
				VS : out STD_LOGIC; -- vertical synch pulse
				
				display_out_x0 : out STD_LOGIC_VECTOR (3 downto 0);  --position display in seven segment display (XX,YY)
				display_out_x1 : out STD_LOGIC_VECTOR (3 downto 0);  --position display in seven segment display (XX,YY)
				display_out_y0 : out STD_LOGIC_VECTOR (3 downto 0);  --position display in seven segment display (XX,YY)
				display_out_y1 : out STD_LOGIC_VECTOR (3 downto 0)   --position display in seven segment display (XX,YY)
			);
	end component;
	
	component light_sensor 
		port(	clk_fpga: in STD_LOGIC;
				rst : in STD_LOGIC;
				
				sclk: out STD_LOGIC; -- drive the light sensor
				cs : out STD_LOGIC; -- choose mode in light sensor
				sdo : in STD_LOGIC; -- data in from light sensor
				
				display_out_l: out STD_LOGIC_VECTOR (3 downto 0);  -- for seven segment display the light intensity
				display_out_h: out STD_LOGIC_VECTOR (3 downto 0)
				
			);
	end component;
	
	component MMCM_clock 
		port(	clk_fpga: in STD_LOGIC;
				rst: in STD_LOGIC;
				
				clk_25MHz: out STD_LOGIC;
				locked: out STD_LOGIC 
			);
	end component;
	
	component seven_segment_display 
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
	end component;
	
-- display buffer
signal	display_data_0 : STD_LOGIC_VECTOR (3 downto 0);  -- for vga block position y0 
signal	display_data_1 : STD_LOGIC_VECTOR (3 downto 0);  -- for vga block position y1
signal	display_data_2 : STD_LOGIC_VECTOR (3 downto 0);  -- for vga block position x0
signal	display_data_3 : STD_LOGIC_VECTOR (3 downto 0);  -- for vga block position x1
signal	display_data_4 : STD_LOGIC_VECTOR (3 downto 0);  -- for decimal_counter lower bit
signal	display_data_5 : STD_LOGIC_VECTOR (3 downto 0);  -- for decimal_counter higher bit 
signal	display_data_6 : STD_LOGIC_VECTOR (3 downto 0);  -- for light sensor L
signal 	display_data_7 : STD_LOGIC_VECTOR (3 downto 0);  -- for light sensor H

-- 25MHz clock wire
signal clk_25MHz : STD_LOGIC;  -- connect the MMCM_clock with VGA_DISPLAY
	
	
begin	

-- combine all the component using named association
U0 : MMCM_clock 
	port map (	clk_fpga => clk_fpga, rst => rst, 
				clk_25MHz => clk_25MHz, locked => locked);

U1 : decimal_counter
	port map (	clk_fpga => clk_fpga, rst => rst, 
				display_out_l => display_data_4, display_out_h => display_data_5);
	
U2 : VGA_DISPLAY
	port map (	clk_25MHz => clk_25MHz, rst => rst,
				up_button => up_button, down_button => down_button, left_button => left_button, right_button => right_button, SW => SW,
				RED => RED, GREEN => GREEN, BLUE => BLUE,
				HS => HS, VS => VS,
				display_out_x0 => display_data_2, display_out_x1 => display_data_3, display_out_y0 => display_data_0, display_out_y1 => display_data_1);
				
U3 : light_sensor
	port map (	clk_fpga => clk_fpga, rst => rst,
				sclk => sclk, cs => cs, sdo => sdo,
				display_out_l => display_data_6, display_out_h => display_data_7);
				
U4 : seven_segment_display
	port map (	clk_fpga => clk_fpga, rst => rst,
				d_in_0 => display_data_0, d_in_1 => display_data_1, d_in_2 => display_data_2, d_in_3 => display_data_3,
				d_in_4 => display_data_4, d_in_5 => display_data_5, d_in_6 => display_data_6, d_in_7 => display_data_7,
				AN => AN, seven_seg => seven_seg);
	
end Behavioral;
