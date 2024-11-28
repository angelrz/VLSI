library ieee;
use ieee.std_logic_1164.all; -- importar bibliotecas

-- Declarar entidad del generador de imagen
entity imagen is
port(
	display_ena: in std_logic;	-- Entrada para habilitar el display
	column: in integer range 0 to 640;	-- Columnas del monitor
	row: in integer range 0 to 480;		-- Filas del monitor
	red, green, blue: out std_logic_vector(3 downto 0)); -- Salida: color
end entity;

architecture arqim of imagen is
begin
	process(display_ena, row, column)
	begin
		if (display_ena = '1') then -- Cuando el habilitador esta activo
			if (((row>0) and (row<50)) and ((column>20) and (column<70))) then
			-- Con las filas y columnas asignamos la posicion de la imagen, en este caso
			-- la esquina superior izquierda del monitor y le daremos un color rojo
				red <= (others => '1');
				green <= (others => '0');
				blue <= (others => '0');
			elsif (((row>0) and (row<50)) and ((column>570) and (column<620))) then
				-- Color verde en la esquina superior derecha
				red <= (others => '0');
				green <= (others => '1');
				blue <= (others => '0');
				-- Color azul
			elsif (((row>430) and (row<480)) and ((column>20) and (column<70))) then
				-- Color azul en la esquina inferior izquierda
				red <= (others => '0');
				green <= (others => '0');
				blue <= (others => '1');
			elsif (((row>430) and (row<480)) and ((column>570) and (column<620))) then
				-- Color rosa en la esquina inferior derecha
				red <= (others => '1');
				green <= (others => '0');
				blue <= (others => '1');
			else
				-- Sino asignamos una posicion que el display muestre un fondo negro
				red <= (others => '0');
				green <= (others => '0');
				blue <= (others => '0');
			end if;
			
		else	-- Cuando el habilitador esta apagado, el display mostrara un fondo en negro
			red <= (others => '0');
			green <= (others => '0');
			blue <= (others => '0');
		end if;
		
	end process;
end architecture;