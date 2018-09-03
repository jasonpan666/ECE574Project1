----------------------------------------------------------------------------------
-- Company: WPI ECE
-- Engineer: Zhenyu Pan
-- 
-- Create Date: 10/10/2017
-- Design Name: ECE574 Project1
-- Module Name: VGA_DISPLAY - Behavioral
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

entity VGA_DISPLAY is
	port(	clk_25MHz: in STD_LOGIC;
			rst: in STD_LOGIC;
			
			up_button: in STD_LOGIC;     -- motion control
			down_button: in STD_LOGIC;		
			left_button: in STD_LOGIC;
			right_button: in STD_LOGIC;
			SW : in STD_LOGIC_VECTOR(5 downto 0);			-- choose different display mode
				
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
end VGA_DISPLAY;

architecture Behavioral of VGA_DISPLAY is

component vga_controller_640_60
	port(
			rst         : in std_logic;
			pixel_clk   : in std_logic;

			HS          : out std_logic;
			VS          : out std_logic;
			hcount      : out std_logic_vector(10 downto 0);
			vcount      : out std_logic_vector(10 downto 0);
			blank       : out std_logic 
		);
end component;
	
component color_logic 
	port(
			rst : in STD_LOGIC;
			clk_in: in STD_LOGIC;
			SW : in STD_LOGIC_VECTOR(5 downto 0);
			vcount_in : in STD_LOGIC_VECTOR(10 downto 0);
			hcount_in : in STD_LOGIC_VECTOR(10 downto 0);
			blank_in : in STD_LOGIC;
			
			Red : out STD_LOGIC_VECTOR (3 downto 0);
			Green : out STD_LOGIC_VECTOR (3 downto 0);
			Blue : out STD_LOGIC_VECTOR (3 downto 0);
			
			up_button : in STD_LOGIC;
			down_button: in STD_LOGIC;
			left_button : in STD_LOGIC;
			right_button : in STD_LOGIC;
			
			position_x0 : out STD_LOGIC_VECTOR (3 downto 0);
			position_x1 : out STD_LOGIC_VECTOR (3 downto 0);
			position_y0 : out STD_LOGIC_VECTOR (3 downto 0);
			position_y1 : out STD_LOGIC_VECTOR (3 downto 0)
		);
end component;

signal hcount_out : STD_LOGIC_VECTOR(10 downto 0);
signal vcount_out : STD_LOGIC_VECTOR(10 downto 0);
signal blank_out : STD_LOGIC;

begin

-- named association
U1 : vga_controller_640_60 port map (pixel_clk => clk_25MHz, rst => rst, HS => HS, VS => VS, hcount => hcount_out, vcount => vcount_out,blank => blank_out);
U2 : color_logic port map(rst => rst, clk_in => clk_25MHz, vcount_in => vcount_out, 
		hcount_in => hcount_out, blank_in => blank_out,  
		Red => RED, Green => GREEN, Blue => BLUE, SW => SW,
		up_button => up_button, down_button => down_button, left_button => left_button, right_button => right_button,
		position_x0 => display_out_x0, position_x1 => display_out_x1, position_y0 => display_out_y0, position_y1 => display_out_y1);

end Behavioral;
