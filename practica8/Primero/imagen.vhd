library ieee;
use ieee.std_logic_1164.all;

entity imagen is
port (display_ena: in std_logic;
		column: in integer range 0 to 640;
		row: in integer range 0 to 480;
		red, green, blue: out std_logic_vector(3 downto 0));
end entity;

architecture arqim of imagen is
begin

	process (display_ena, row, column)
	begin
		
		if (display_ena = '1') then
		
			if (((row > 300) and (row < 350)) and ((column > 350) and (column < 400))) then
				red <= (others => '1');
				green <= (others => '0');
				blue <= (others => '0');
			elsif (((row > 300) and (row < 350)) and ((column > 450) and (column < 500))) then
				red <= (others => '0');
				green <= (others => '1');
				blue <= (others => '0');
			elsif (((row > 300) and (row < 350)) and ((column > 550) and (column < 600))) then
				red <= (others => '0');
				green <= (others => '0');
				blue <= (others => '1');
			else
				red <= (others => '0');
				green <= (others => '0');
				blue <= (others => '0');
			end if;
			
		else
			red <= (others => '0');
			green <= (others => '0');
			blue <= (others => '0');
		end if;
		
	end process;
end architecture;