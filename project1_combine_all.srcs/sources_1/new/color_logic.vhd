----------------------------------------------------------------------------------
-- Company: WPI ECE
-- Engineer: Zhenyu Pan
-- 
-- Create Date: 10/10/2017
-- Design Name: ECE574 Project1
-- Module Name: color_logic - Behavioral
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

entity color_logic is
	port(
			rst : in STD_LOGIC;
			clk_in:in STD_LOGIC;
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
end entity;



architecture Behavioral of color_logic is

component position_convert  --- convert the POSITION (HEX) to POSITION (DECIMAL), whcih can be used by the display
	port(	clk_in : in STD_LOGIC;
			rst: in STD_LOGIC;
			
			position : in STD_LOGIC_VECTOR (4 downto 0);
			position_l : out STD_LOGIC_VECTOR (3 downto 0);
			position_h : out STD_LOGIC_VECTOR (3 downto 0)
		);
end component;

signal counter_x : std_logic_vector(10 downto 0);
signal counter_y : std_logic_vector(10 downto 0);

signal counter_xx : std_logic_vector(10 downto 0);
signal counter_yy : std_logic_vector(10 downto 0);

signal counter_5M : integer range 0 to 5000000;
signal clk_motion_control : STD_LOGIC;

signal position_X : STD_LOGIC_VECTOR (4 downto 0);
signal position_Y : STD_LOGIC_VECTOR (4 downto 0);

begin

counter_xx <= counter_x + 32;
counter_yy <= counter_y + 24;

--named association
Ux : position_convert port map(clk_in => clk_in, rst => rst, position => position_X, position_l => position_x0, position_h => position_x1);
Uy : position_convert port map(clk_in => clk_in, rst => rst, position => position_Y, position_l => position_y0, position_h => position_y1);
-- generate a clock to control the motion
process(clk_in, rst)
begin
	if rst = '1' then
		counter_5M <= 0;
	elsif rising_edge(clk_in) then
		if counter_5M = 4999999 then
			counter_5M <= 0;
		else
			counter_5M <= counter_5M + 1;
		end if;
	end if;
end process;

process(clk_in, rst)
begin
	if rst = '1' then
		clk_motion_control <= '0';
	elsif rising_edge(clk_in) then
		if counter_5M = 0 then
			clk_motion_control <= not clk_motion_control;
		else
			clk_motion_control <= clk_motion_control;
		end if;
	end if;
end process;


process(clk_motion_control,rst)
begin
	if rst = '1' then
		counter_x <= "00000000000";
	elsif rising_edge(clk_motion_control) then
		if left_button = '1' then
			if counter_x = 0 then
				counter_x <= counter_x;
			else
				counter_x <= counter_x - 32;
			end if;
		end if;
		if right_button = '1' then
			if counter_x >= 608 then
				counter_x <= counter_x;
			else
				counter_x <= counter_x + 32;
			end if;
		end if;
	end if;
end process;

process(clk_motion_control,rst)
begin
	if rst = '1' then
		counter_y <= "00000000000";
	elsif rising_edge(clk_motion_control) then
		if up_button = '1' then
			if counter_y = 0 then
				counter_y <= counter_y;
			else
				counter_y <= counter_y - 24;
			end if;
		end if;
		if down_button = '1' then
			if counter_y >= 456 then
				counter_y <= counter_y;
			else
				counter_y <= counter_y + 24;
			end if;
		end if;
	end if;
end process;


process(vcount_in,hcount_in,blank_in)
begin
	if blank_in = '1' then --- display all black screen when no switch
		Red <= "0000";Green <= "0000";Blue <= "0000";
    elsif SW = "000001" then --- switch 1 : Complete yellow display
        Red <= "1111";Green <= "1111";Blue <= "0000";
	elsif SW = "000010" then --- switch 2: Horizontal bars of alternating green and red colors with each horizontal bar 16 pixels high
        if vcount_in < 16*1 and hcount_in < 640 then Red <= "1111";Green <= "0000";Blue <= "0000"; 
		elsif vcount_in < 16*2 and hcount_in < 640 then Red <= "0000";Green <= "1111";Blue <= "0000";
		elsif vcount_in < 16*3 and hcount_in < 640 then Red <= "1111";Green <= "0000";Blue <= "0000"; 
        elsif vcount_in < 16*4 and hcount_in < 640 then Red <= "0000";Green <= "1111";Blue <= "0000";
 		elsif vcount_in < 16*5 and hcount_in < 640 then Red <= "1111";Green <= "0000";Blue <= "0000"; 
        elsif vcount_in < 16*6 and hcount_in < 640 then Red <= "0000";Green <= "1111";Blue <= "0000";
        elsif vcount_in < 16*7 and hcount_in < 640 then Red <= "1111";Green <= "0000";Blue <= "0000"; 
        elsif vcount_in < 16*8 and hcount_in < 640 then Red <= "0000";Green <= "1111";Blue <= "0000";
		elsif vcount_in < 16*9 and hcount_in < 640 then Red <= "1111";Green <= "0000";Blue <= "0000"; 
        elsif vcount_in < 16*10 and hcount_in < 640 then Red <= "0000";Green <= "1111";Blue <= "0000";
        elsif vcount_in < 16*11 and hcount_in < 640 then Red <= "1111";Green <= "0000";Blue <= "0000"; 
        elsif vcount_in < 16*12 and hcount_in < 640 then Red <= "0000";Green <= "1111";Blue <= "0000";
		elsif vcount_in < 16*13 and hcount_in < 640 then Red <= "1111";Green <= "0000";Blue <= "0000"; 
        elsif vcount_in < 16*14 and hcount_in < 640 then Red <= "0000";Green <= "1111";Blue <= "0000";
        elsif vcount_in < 16*15 and hcount_in < 640 then Red <= "1111";Green <= "0000";Blue <= "0000"; 
        elsif vcount_in < 16*16 and hcount_in < 640 then Red <= "0000";Green <= "1111";Blue <= "0000";
		elsif vcount_in < 16*17 and hcount_in < 640 then Red <= "1111";Green <= "0000";Blue <= "0000"; 
        elsif vcount_in < 16*18 and hcount_in < 640 then Red <= "0000";Green <= "1111";Blue <= "0000";
        elsif vcount_in < 16*19 and hcount_in < 640 then Red <= "1111";Green <= "0000";Blue <= "0000"; 
        elsif vcount_in < 16*20 and hcount_in < 640 then Red <= "0000";Green <= "1111";Blue <= "0000";
		elsif vcount_in < 16*21 and hcount_in < 640 then Red <= "1111";Green <= "0000";Blue <= "0000"; 
        elsif vcount_in < 16*22 and hcount_in < 640 then Red <= "0000";Green <= "1111";Blue <= "0000";
        elsif vcount_in < 16*23 and hcount_in < 640 then Red <= "1111";Green <= "0000";Blue <= "0000"; 
        elsif vcount_in < 16*24 and hcount_in < 640 then Red <= "0000";Green <= "1111";Blue <= "0000";
        elsif vcount_in < 16*25 and hcount_in < 640 then Red <= "1111";Green <= "0000";Blue <= "0000"; 
        elsif vcount_in < 16*26 and hcount_in < 640 then Red <= "0000";Green <= "1111";Blue <= "0000";
        elsif vcount_in < 16*27 and hcount_in < 640 then Red <= "1111";Green <= "0000";Blue <= "0000"; 
        elsif vcount_in < 16*28 and hcount_in < 640 then Red <= "0000";Green <= "1111";Blue <= "0000";
        elsif vcount_in < 16*29 and hcount_in < 640 then Red <= "1111";Green <= "0000";Blue <= "0000"; 
        elsif vcount_in < 16*30 and hcount_in < 640 then Red <= "0000";Green <= "1111";Blue <= "0000";                                                 	           
		end if;
	elsif SW = "000100" then -- switch 3: A white colored block and place it at a starting position of (0,0)
	    if vcount_in < 24*1 and hcount_in < 32*1 and vcount_in > 24*0 and hcount_in > 32*0 then 
	        Red <= "1111";Green <= "1111";Blue <= "1111"; -- position_X <= "00000";position_Y <= "00000";
	    else  --- this part mainly used to erase the bug. if this part is not included, there will be a yellow bar after the white squre block
	        Red <= "0000";Green <= "0000";Blue <= "0000";
	    end if;
	elsif SW = "001000" then --- switch 4: A blue colored block and place it at a starting position of (10,10)
	    if vcount_in < 24*11 and hcount_in < 32*11 and vcount_in > 24*10 and hcount_in > 32*10 then 
	        Red <= "0000";Green <= "0000";Blue <= "1111"; -- position_X <= "01010";position_Y <= "01010";
        end if;
	elsif SW = "010000" then --- switch 5: A yellow colored block and place it at a starting position of (19,19)
	    if vcount_in < 24*20 and hcount_in < 32*20 and vcount_in > 24*19 and hcount_in > 32*19 then
	        Red <= "1111";Green <= "1111";Blue <= "0000"; -- position_X <= "10011";position_Y <= "10011";
        end if;
	elsif SW = "100000" then --- switch 6: extra feature and Use two of the seven-segment displays and display the current¡®x¡¯position of the block in decimal (00 to 19)
		if vcount_in < counter_yy and vcount_in > counter_y and hcount_in < counter_xx and hcount_in > counter_x then
			Red <= "0000";Green <= "1111";Blue <= "0000";
		end if;
	end if;
end process;

----calculate the position (X,Y) of the block
--- positon of X
process(clk_motion_control,rst)
begin
	if rst = '1' then
		position_X <= "00000";
	elsif rising_edge(clk_motion_control) then
		if left_button = '1' then
			if position_X = "00000" then  ---- the block hit the left edge
				position_X <= position_X;
			else
				position_X <= position_X - '1';
			end if;
		end if;
		if right_button = '1' then
			if position_X = "10011" then  ---- block hit the right edge
				position_X <= position_X;
			else
				position_X <= position_X + '1';
			end if;
		end if;
	end if;
end process;

-- position of Y
process(clk_motion_control,rst)
begin
	if rst = '1' then
		position_Y <= "00000";
	elsif rising_edge(clk_motion_control) then
		if up_button = '1' then
			if position_Y = "00000" then  ---- the block hit the up edge
				position_Y <= position_Y;
			else
				position_Y <= position_Y - '1';
			end if;
		end if;
		if down_button = '1' then
			if position_Y = "10011" then  ---- block hit the bottom edge
				position_Y <= position_Y;
			else
				position_Y <= position_Y + '1';
			end if;
		end if;
	end if;
end process;


end Behavioral;