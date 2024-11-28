library ieee;
use ieee.std_logic_1164.all; -- Importar bibliotecas

-- Entidad del generador de imagen
entity imagen is
port(
	display_ena: in std_logic; -- -- Entrada para habilitar el display
	column: in integer range 0 to 640;	-- Columna actual (ancho de la pantalla)
	row: in integer range 0 to 480;		-- Fila actual (alto de la pantalla)
	num_entrada: in std_logic_vector(3 downto 0); -- Entrada para seleccionar el número
	red, green, blue: out std_logic_vector(3 downto 0)); -- Salidas de color (RGB)
end entity;

-- Arquitectura del generador de imagen
architecture arqim of imagen is
begin
process (display_ena, row, column, num_entrada)
variable num: std_logic_vector(6 downto 0);  -- Variable para almacenar el valor del número
-- Definición de constantes para cada número del 0 al 9
constant cero:  std_logic_vector(6 downto 0) := "0000000";
constant uno:   std_logic_vector(6 downto 0) := "0111111";
constant dos:   std_logic_vector(6 downto 0) := "0000110";
constant tres:  std_logic_vector(6 downto 0) := "1100111";
constant cuatro: std_logic_vector(6 downto 0) := "1100110";
constant cinco: std_logic_vector(6 downto 0) := "1101101";
constant seis:  std_logic_vector(6 downto 0) := "1111101";
constant siete: std_logic_vector(6 downto 0) := "0000111";
constant ocho:  std_logic_vector(6 downto 0) := "1111111";
constant nueve: std_logic_vector(6 downto 0) := "1110011";
-- Definición de constantes para colores RGB
constant r1: std_logic_vector(3 downto 0) := (others => '1');  -- Rojo alto
constant r0: std_logic_vector(3 downto 0) := (others => '0');  -- Rojo bajo
constant g1: std_logic_vector(3 downto 0) := (others => '1');  -- Verde alto
constant g0: std_logic_vector(3 downto 0) := (others => '0');  -- Verde bajo
constant b1: std_logic_vector(3 downto 0) := (others => '1');  -- Azul alto
constant b0: std_logic_vector(3 downto 0) := (others => '0');  -- Azul bajo
begin
	-- Verificar si la visualización está habilitada
	if (display_ena = '1') then
		-- Selección del número según la entrada
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
			when others => num := cero; -- Por defecto, cero
		end case;
	
		-- Determina el color de salida según el número
		case num is
			when cero =>
				-- Definición de la forma del número 0
				if (((row > 200) and (row < 210)) and ((column > 110) and (column < 140))) then
					red <=  (others => '1'); -- Color rojo
					green <= (others => '0'); -- Sin verde
					blue <=  (others => '0'); -- Sin azul
				elsif (((row > 210) and (row < 240)) and ((column > 100) and (column < 110))) then
					red <=  (others => '0');
					green <= (others => '1'); -- Color verde
					blue <=  (others => '0');
				elsif (((row > 210) and (row < 240)) and ((column > 140) and (column < 150))) then
					red <=  (others => '0');
					green <= (others => '0');
					blue <=  (others => '1'); -- Color azul
				elsif (((row > 250) and (row < 280)) and ((column > 100) and (column < 110))) then
					red <=  (others => '0');
					green <= (others => '1');
					blue <=  (others => '1'); -- Verde y azul
				elsif (((row > 250) and (row < 280)) and ((column > 140) and (column < 150))) then
					red <=  (others => '1');
					green <= (others => '0');
					blue <=  (others => '1'); -- Rojo y azul
				elsif (((row > 280) and (row < 290)) and ((column > 110) and (column < 140))) then
					red <=  (others => '1');
					green <= (others => '1'); -- Rojo y verde
					blue <=  (others => '1'); -- RGB alto
				else
					red <=  (others => '0'); -- Apagar color
					green <= (others => '0');
					blue <=  (others => '0');
				end if;

			-- Definiciones de color para el resto de los números (1 a 9)
			when uno =>
				if (((row > 210) and (row < 240)) and ((column > 140) and (column < 150))) then
					red <=  (others => '0');
					green <= (others => '1');
					blue <=  (others => '0'); -- Color verde
				elsif (((row > 250) and (row < 280)) and ((column > 140) and (column < 150))) then
					red <=  (others => '1'); -- Color rojo
					green <= (others => '0');
					blue <=  (others => '0');
				else
					red <=  (others => '0');
					green <= (others => '0');
					blue <=  (others => '0');
				end if;

			when dos =>
				if (((row > 200) and (row < 210)) and ((column > 110) and (column < 140))) then
					red <=  (others => '0');
					green <= (others => '0');
					blue <=  (others => '1'); -- Color azul
				elsif (((row > 210) and (row < 240)) and ((column > 140) and (column < 150))) then
					red <=  (others => '0');
					green <= (others => '1'); -- Color verde
					blue <=  (others => '0');
				elsif (((row > 240) and (row < 250)) and ((column > 110) and (column < 140))) then
					red <=  (others => '1'); -- Color rojo
					green <= (others => '0');
					blue <=  (others => '1'); -- Rojo y azul
				elsif (((row > 250) and (row < 280)) and ((column > 100) and (column < 110))) then
					red <=  (others => '0');
					green <= (others => '1'); -- Color verde
					blue <=  (others => '1'); -- Verde y azul
				elsif (((row > 280) and (row < 290)) and ((column > 110) and (column < 140))) then
					red <=  (others => '1');
					green <= (others => '1'); -- Rojo y verde
					blue <=  (others => '1'); -- RGB alto
				else
					red <=  (others => '0'); -- Apagar color
					green <= (others => '0');
					blue <=  (others => '0');
				end if;

			when tres =>
				if (((row > 200) and (row < 210)) and ((column > 110) and (column < 140))) then
					red <=  (others => '1'); -- Color rojo
					green <= (others => '0');
					blue <=  (others => '0');
				elsif (((row > 210) and (row < 240)) and ((column > 140) and (column < 150))) then
					red <=  (others => '0');
					green <= (others => '1'); -- Color verde
					blue <=  (others => '0');
				elsif (((row > 240) and (row < 250)) and ((column > 110) and (column < 140))) then
					red <=  (others => '0');
					green <= (others => '0');
					blue <=  (others => '1'); -- Color azul
				elsif (((row > 250) and (row < 280)) and ((column > 140) and (column < 150))) then
					red <=  (others => '1'); -- Color rojo
					green <= (others => '0');
					blue <=  (others => '1'); -- Rojo y azul
				elsif (((row > 280) and (row < 290)) and ((column > 110) and (column < 140))) then
					red <=  (others => '1'); -- Color rojo
					green <= (others => '1'); -- Color verde
					blue <=  (others => '0'); -- Sin azul
				else
					red <=  (others => '0'); -- Apagar color
					green <= (others => '0');
					blue <=  (others => '0');
				end if;

			when cuatro =>
				if (((row > 200) and (row < 230)) and ((column > 100) and (column < 110))) then
					red <=  (others => '1'); -- Color rojo
					green <= (others => '0');
					blue <=  (others => '0');
				elsif (((row > 200) and (row < 230)) and ((column > 140) and (column < 150))) then
					red <=  (others => '0');
					green <= (others => '1'); -- Color verde
					blue <=  (others => '0');
				elsif (((row > 230) and (row < 240)) and ((column > 110) and (column < 140))) then
					red <=  (others => '0');
					green <= (others => '0');
					blue <=  (others => '1'); -- Color azul
				elsif (((row > 240) and (row < 270)) and ((column > 140) and (column < 150))) then
					red <=  (others => '1'); -- Color rojo
					green <= (others => '1'); -- Color verde
					blue <=  (others => '0'); -- Sin azul
				else
					red <=  (others => '0'); -- Apagar color
					green <= (others => '0');
					blue <=  (others => '0');
				end if;

			when cinco =>
				if (((row > 200) and (row < 210)) and ((column > 110) and (column < 140))) then
					red <=  (others => '0');
					green <= (others => '0');
					blue <=  (others => '1'); -- Color azul
				elsif (((row > 210) and (row < 240)) and ((column > 100) and (column < 110))) then
					red <=  (others => '1'); -- Color rojo
					green <= (others => '1'); -- Color verde
					blue <=  (others => '0'); -- Sin azul
				elsif (((row > 240) and (row < 250)) and ((column > 110) and (column < 140))) then
					red <=  (others => '1'); -- Color rojo
					green <= (others => '0');
					blue <=  (others => '1'); -- Rojo y azul
				elsif (((row > 250) and (row < 280)) and ((column > 140) and (column < 150))) then
					red <=  (others => '1'); -- Color rojo
					green <= (others => '0');
					blue <=  (others => '0'); -- Sin azul
				elsif (((row > 280) and (row < 290)) and ((column > 110) and (column < 140))) then
					red <=  (others => '1'); -- Color rojo
					green <= (others => '0'); -- Sin verde
					blue <=  (others => '0'); -- Sin azul
				else
					red <=  (others => '0'); -- Apagar color
					green <= (others => '0');
					blue <=  (others => '0');
				end if;

			when seis =>
				if (((row > 200) and (row < 210)) and ((column > 110) and (column < 140))) then
					red <=  (others => '1'); -- Color rojo
					green <= (others => '0');
					blue <=  (others => '0');
				elsif (((row > 210) and (row < 240)) and ((column > 100) and (column < 110))) then
					red <=  (others => '0');
					green <= (others => '1'); -- Color verde
					blue <=  (others => '0');
				elsif (((row > 240) and (row < 250)) and ((column > 110) and (column < 140))) then
					red <=  (others => '0');
					green <= (others => '0');
					blue <=  (others => '1'); -- Color azul
				elsif (((row > 250) and (row < 280)) and ((column > 100) and (column < 110))) then
					red <=  (others => '1'); -- Color rojo
					green <= (others => '1'); -- Color verde
					blue <=  (others => '0'); -- Sin azul
				elsif (((row > 250) and (row < 280)) and ((column > 140) and (column < 150))) then
					red <=  (others => '0');
					green <= (others => '1'); -- Color verde
					blue <=  (others => '1'); -- Verde y azul
				elsif (((row > 280) and (row < 290)) and ((column > 110) and (column < 140))) then
					red <=  (others => '1'); -- Color rojo
					green <= (others => '0');
					blue <=  (others => '1'); -- Rojo y azul
				else
					red <=  (others => '0'); -- Apagar color
					green <= (others => '0');
					blue <=  (others => '0');
				end if;

			when siete =>
				if (((row > 200) and (row < 210)) and ((column > 110) and (column < 140))) then
					red <=  (others => '1'); -- Color rojo
					green <= (others => '0');
					blue <=  (others => '0');
				elsif (((row > 210) and (row < 240)) and ((column > 140) and (column < 150))) then
					red <=  (others => '0');
					green <= (others => '1'); -- Color verde
					blue <=  (others => '0');
				elsif (((row > 250) and (row < 280)) and ((column > 140) and (column < 150))) then
					red <=  (others => '0');
					green <= (others => '0');
					blue <=  (others => '1'); -- Color azul
				else
					red <=  (others => '0'); -- Apagar color
					green <= (others => '0');
					blue <=  (others => '0');
				end if;

			when ocho =>
				if (((row > 200) and (row < 210)) and ((column > 110) and (column < 140))) then
					red <=  (others => '1'); -- Color rojo
					green <= (others => '0');
					blue <=  (others => '0');
				elsif (((row > 210) and (row < 240)) and ((column > 100) and (column < 110))) then
					red <=  (others => '0');
					green <= (others => '1'); -- Color verde
					blue <=  (others => '0');
				elsif (((row > 210) and (row < 240)) and ((column > 140) and (column < 150))) then
					red <=  (others => '0');
					green <= (others => '0');
					blue <=  (others => '1'); -- Color azul
				elsif (((row > 240) and (row < 250)) and ((column > 110) and (column < 140))) then
					red <=  (others => '1'); -- Color rojo
					green <= (others => '1'); -- Color verde
					blue <=  (others => '0'); -- Sin azul
				elsif (((row > 250) and (row < 280)) and ((column > 100) and (column < 110))) then
					red <=  (others => '0');
					green <= (others => '1'); -- Color verde
					blue <=  (others => '1'); -- Verde y azul
				elsif (((row > 250) and (row < 280)) and ((column > 140) and (column < 150))) then
					red <=  (others => '1'); -- Color rojo
					green <= (others => '0'); -- Sin verde
					blue <=  (others => '1'); -- Rojo y azul
				elsif (((row > 280) and (row < 290)) and ((column > 110) and (column < 140))) then
					red <=  (others => '1'); -- Color rojo
					green <= (others => '1'); -- Color verde
					blue <=  (others => '1'); -- RGB alto
				else
					red <=  (others => '0'); -- Apagar color
					green <= (others => '0');
					blue <=  (others => '0');
				end if;
			
			when nueve =>
				if (((row > 200) and (row < 210)) and ((column > 110) and (column < 140))) then
					red <=  (others => '0');
					green <= (others => '0');
					blue <=  (others => '1'); -- Color azul
				elsif (((row > 210) and (row < 240)) and ((column > 140) and (column < 150))) then
					red <=  (others => '0');
					green <= (others => '1'); -- Color verde
					blue <=  (others => '0');
				elsif (((row > 250) and (row < 280)) and ((column > 140) and (column < 150))) then
					red <=  (others => '1'); -- Color rojo
					green <= (others => '0'); -- Sin verde
					blue <=  (others => '0');
				elsif (((row > 210) and (row < 240)) and ((column > 100) and (column < 110))) then
					red <=  (others => '1'); -- Color rojo
					green <= (others => '1'); -- Color verde
					blue <=  (others => '0'); -- Sin azul
				elsif (((row > 240) and (row < 250)) and ((column > 110) and (column < 140))) then
					red<=  (others => '1'); -- Color rojo
					green<= (others => '0'); -- Sin verde
					blue<=  (others => '1'); -- Rojo y azul
				else
					red<=  (others => '0'); -- Apagar color o fondo negro
					green<= (others => '0');
					blue<=  (others => '0');
				end if;
		
			when others =>
				-- Por defecto, apaga los colores o bien el fondo negro
				red<= r0;
				green<= g0;
				blue<= b0;
            end case;
        end if;
    end process;
end architecture;
