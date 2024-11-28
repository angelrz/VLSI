library ieee;
use ieee.std_logic_1164.all;

entity imagen is
port (display_ena: in std_logic;
		column: in integer range 0 to 640;
		row: in integer range 0 to 480;
		num_entrada: in std_logic_vector(3 downto 0);
		red, green, blue: out std_logic_vector(3 downto 0));
end entity;

architecture arqim of imagen is
begin

	process (display_ena, row, column, num_entrada)
	variable num: 		std_logic_vector(6 downto 0);
	constant cero: 	std_logic_vector(6 downto 0) := "0000000";
	constant uno: 		std_logic_vector(6 downto 0) := "0111111";
	constant dos: 		std_logic_vector(6 downto 0) := "0000110";
	constant tres: 	std_logic_vector(6 downto 0) := "1100111";
	constant cuatro: 	std_logic_vector(6 downto 0) := "1100110";
	constant cinco: 	std_logic_vector(6 downto 0) := "1101101";
	constant seis: 	std_logic_vector(6 downto 0) := "1111101";
	constant siete: 	std_logic_vector(6 downto 0) := "0000111";
	constant ocho: 	std_logic_vector(6 downto 0) := "1111111";
	constant nueve: 	std_logic_vector(6 downto 0) := "1110011";
	constant r1: std_logic_vector(3 downto 0) := (others => '1');
	constant r0: std_logic_vector(3 downto 0) := (others => '0');
	constant g1: std_logic_vector(3 downto 0) := (others => '1');
	constant g0: std_logic_vector(3 downto 0) := (others => '0');
	constant b1: std_logic_vector(3 downto 0) := (others => '1');
	constant b0: std_logic_vector(3 downto 0) := (others => '0');
	begin
	
		--num := nueve;
		
		if (display_ena = '1') then
		
			case num_entrada is
			
			when "0001" => num := uno;
			when "0010" => num := dos;
			when "0011" => num := tres;
			when "0100" => num := cuatro;
			when "0101" => num := cinco;
			when "0110" => num := seis;
			when "0111" => num := siete;
			when "1000" => num := ocho;
			when "1001" => num := nueve;
			when others => num := cero;
			
			end case;
		
			case num is
			
			when cero =>
			
				if (((row > 200) and (row < 210)) and ((column > 110) and (column < 140))) then
					red <= 	(others => '1');
					green <= (others => '0');
					blue <= 	(others => '0');
				elsif (((row > 210) and (row < 240)) and ((column > 100) and (column < 110))) then
					red <= 	(others => '0');
					green <= (others => '1');
					blue <= 	(others => '0');
				elsif (((row > 210) and (row < 240)) and ((column > 140) and (column < 150))) then
					red <= 	(others => '0');
					green <= (others => '0');
					blue <= 	(others => '1');
				elsif (((row > 250) and (row < 280)) and ((column > 100) and (column < 110))) then
					red <= 	(others => '0');
					green <= (others => '1');
					blue <= 	(others => '1');
				elsif (((row > 250) and (row < 280)) and ((column > 140) and (column < 150))) then
					red <= 	(others => '1');
					green <= (others => '0');
					blue <= 	(others => '1');
				elsif (((row > 280) and (row < 290)) and ((column > 110) and (column < 140))) then
					red <= 	(others => '1');
					green <= (others => '1');
					blue <= 	(others => '1');
				else
					red <= 	(others => '0');
					green <= (others => '0');
					blue <= 	(others => '0');
				end if;
			
			when uno =>
			
				if (((row > 210) and (row < 240)) and ((column > 140) and (column < 150))) then
					red <= 	(others => '0');
					green <= (others => '1');
					blue <= 	(others => '0');
				elsif (((row > 250) and (row < 280)) and ((column > 140) and (column < 150))) then
					red <= 	(others => '1');
					green <= (others => '0');
					blue <= 	(others => '0');
				else
					red <= 	(others => '0');
					green <= (others => '0');
					blue <= 	(others => '0');
				end if;
				
			when dos =>
			
				if (((row > 200) and (row < 210)) and ((column > 110) and (column < 140))) then
					red <= 	(others => '0');
					green <= (others => '0');
					blue <= 	(others => '1');
				elsif (((row > 210) and (row < 240)) and ((column > 140) and (column < 150))) then
					red <= 	(others => '0');
					green <= (others => '1');
					blue <= 	(others => '0');
				elsif (((row > 240) and (row < 250)) and ((column > 110) and (column < 140))) then
					red <= 	(others => '1');
					green <= (others => '0');
					blue <= 	(others => '1');
				elsif (((row > 250) and (row < 280)) and ((column > 100) and (column < 110))) then
					red <= 	(others => '0');
					green <= (others => '1');
					blue <= 	(others => '1');
				elsif (((row > 280) and (row < 290)) and ((column > 110) and (column < 140))) then
					red <= 	(others => '1');
					green <= (others => '1');
					blue <= 	(others => '1');
				else
					red <= 	(others => '0');
					green <= (others => '0');
					blue <= 	(others => '0');
				end if;
				
			when tres =>
			
				if (((row > 200) and (row < 210)) and ((column > 110) and (column < 140))) then
					red <= 	(others => '1');
					green <= (others => '0');
					blue <= 	(others => '0');
				elsif (((row > 210) and (row < 240)) and ((column > 140) and (column < 150))) then
					red <= 	(others => '0');
					green <= (others => '1');
					blue <= 	(others => '0');
				elsif (((row > 240) and (row < 250)) and ((column > 110) and (column < 140))) then
					red <= 	(others => '0');
					green <= (others => '0');
					blue <= 	(others => '1');
				elsif (((row > 250) and (row < 280)) and ((column > 140) and (column < 150))) then
					red <= 	(others => '1');
					green <= (others => '0');
					blue <= 	(others => '1');
				elsif (((row > 280) and (row < 290)) and ((column > 110) and (column < 140))) then
					red <= 	(others => '1');
					green <= (others => '1');
					blue <= 	(others => '0');
				else
					red <= 	(others => '0');
					green <= (others => '0');
					blue <= 	(others => '0');
				end if;

			when cuatro =>
			
				if (((row > 200) and (row < 230)) and ((column > 100) and (column < 110))) then
					red <= 	(others => '1');
					green <= (others => '0');
					blue <= 	(others => '0');
				elsif (((row > 200) and (row < 230)) and ((column > 140) and (column < 150))) then
					red <= 	(others => '0');
					green <= (others => '1');
					blue <= 	(others => '0');
				elsif (((row > 230) and (row < 240)) and ((column > 110) and (column < 140))) then
					red <= 	(others => '0');
					green <= (others => '0');
					blue <= 	(others => '1');
				elsif (((row > 240) and (row < 270)) and ((column > 140) and (column < 150))) then
					red <= 	(others => '1');
					green <= (others => '1');
					blue <= 	(others => '0');
				else
					red <= 	(others => '0');
					green <= (others => '0');
					blue <= 	(others => '0');
				end if;

			when cinco =>
			
				if (((row > 200) and (row < 210)) and ((column > 110) and (column < 140))) then
					red <= 	(others => '0');
					green <= (others => '0');
					blue <= 	(others => '1');
				elsif (((row > 210) and (row < 240)) and ((column > 100) and (column < 110))) then
					red <= 	(others => '1');
					green <= (others => '1');
					blue <= 	(others => '0');
				elsif (((row > 240) and (row < 250)) and ((column > 110) and (column < 140))) then
					red <= 	(others => '1');
					green <= (others => '0');
					blue <= 	(others => '1');
				elsif (((row > 250) and (row < 280)) and ((column > 140) and (column < 150))) then
					red <= 	(others => '1');
					green <= (others => '0');
					blue <= 	(others => '0');
				elsif (((row > 280) and (row < 290)) and ((column > 110) and (column < 140))) then
					red <= 	(others => '1');
					green <= (others => '0');
					blue <= 	(others => '0');
				else
					red <= 	(others => '0');
					green <= (others => '0');
					blue <= 	(others => '0');
				end if;

			when seis =>
			
				if (((row > 200) and (row < 210)) and ((column > 110) and (column < 140))) then
					red <= 	(others => '1');
					green <= (others => '0');
					blue <= 	(others => '0');
				elsif (((row > 210) and (row < 240)) and ((column > 100) and (column < 110))) then
					red <= 	(others => '0');
					green <= (others => '1');
					blue <= 	(others => '0');
				elsif (((row > 240) and (row < 250)) and ((column > 110) and (column < 140))) then
					red <= 	(others => '0');
					green <= (others => '0');
					blue <= 	(others => '1');
				elsif (((row > 250) and (row < 280)) and ((column > 100) and (column < 110))) then
					red <= 	(others => '1');
					green <= (others => '1');
					blue <= 	(others => '0');
				elsif (((row > 250) and (row < 280)) and ((column > 140) and (column < 150))) then
					red <= 	(others => '0');
					green <= (others => '1');
					blue <= 	(others => '1');
				elsif (((row > 280) and (row < 290)) and ((column > 110) and (column < 140))) then
					red <= 	(others => '1');
					green <= (others => '0');
					blue <= 	(others => '1');
				else
					red <= 	(others => '0');
					green <= (others => '0');
					blue <= 	(others => '0');
				end if;

			when siete =>
			
				if (((row > 200) and (row < 210)) and ((column > 110) and (column < 140))) then
					red <= 	(others => '1');
					green <= (others => '0');
					blue <= 	(others => '0');
				elsif (((row > 210) and (row < 240)) and ((column > 140) and (column < 150))) then
					red <= 	(others => '0');
					green <= (others => '1');
					blue <= 	(others => '0');
				elsif (((row > 250) and (row < 280)) and ((column > 140) and (column < 150))) then
					red <= 	(others => '0');
					green <= (others => '0');
					blue <= 	(others => '1');
				else
					red <= 	(others => '0');
					green <= (others => '0');
					blue <= 	(others => '0');
				end if;

			when ocho =>
			
				if (((row > 200) and (row < 210)) and ((column > 110) and (column < 140))) then
					red <= 	(others => '1');
					green <= (others => '0');
					blue <= 	(others => '0');
				elsif (((row > 210) and (row < 240)) and ((column > 100) and (column < 110))) then
					red <= 	(others => '0');
					green <= (others => '1');
					blue <= 	(others => '0');
				elsif (((row > 210) and (row < 240)) and ((column > 140) and (column < 150))) then
					red <= 	(others => '0');
					green <= (others => '0');
					blue <= 	(others => '1');
				elsif (((row > 240) and (row < 250)) and ((column > 110) and (column < 140))) then
					red <= 	(others => '1');
					green <= (others => '1');
					blue <= 	(others => '0');
				elsif (((row > 250) and (row < 280)) and ((column > 100) and (column < 110))) then
					red <= 	(others => '0');
					green <= (others => '1');
					blue <= 	(others => '1');
				elsif (((row > 250) and (row < 280)) and ((column > 140) and (column < 150))) then
					red <= 	(others => '1');
					green <= (others => '0');
					blue <= 	(others => '1');
				elsif (((row > 280) and (row < 290)) and ((column > 110) and (column < 140))) then
					red <= 	(others => '1');
					green <= (others => '1');
					blue <= 	(others => '1');
				else
					red <= 	(others => '0');
					green <= (others => '0');
					blue <= 	(others => '0');
				end if;
				
			when nueve =>
			
				if (((row > 200) and (row < 210)) and ((column > 110) and (column < 140))) then
					red <= 	(others => '0');
					green <= (others => '0');
					blue <= 	(others => '1');
				elsif (((row > 210) and (row < 240)) and ((column > 140) and (column < 150))) then
					red <= 	(others => '0');
					green <= (others => '1');
					blue <= 	(others => '0');
				elsif (((row > 250) and (row < 280)) and ((column > 140) and (column < 150))) then
					red <= 	(others => '1');
					green <= (others => '0');
					blue <= 	(others => '0');
				elsif (((row > 210) and (row < 240)) and ((column > 100) and (column < 110))) then
					red <= 	(others => '1');
					green <= (others => '1');
					blue <= 	(others => '0');
				elsif (((row > 240) and (row < 250)) and ((column > 110) and (column < 140))) then
					red <= 	(others => '1');
					green <= (others => '0');
					blue <= 	(others => '1');
				else
					red <= 	(others => '0');
					green <= (others => '0');
					blue <= 	(others => '0');
				end if;
			
			when others =>
			
				red <= r0;
				green <= g0;
				blue <= b0;

			end case;
		end if;	
	end process;
end architecture;