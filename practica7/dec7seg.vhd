library ieee;
use ieee.std_logic_1164.all; -- importar bibliotecas

entity dec7seg is
port(
    estado: in std_logic_vector(3 downto 0);-- estado del display para (decenas y unidades)
    seg: out std_logic_vector(7 downto 0));	-- salida para el display de 7 segmentos
end entity;

-- DECO para convertir conteo en al patron del display de 7 segmentos.
architecture arqdec of dec7seg  is
begin
with estado select
	SEG <= 
		"00000011" when "0000", -- en estado 0, muestra 
		"10011111" when "0001", --1
		"00100101" when "0010", --2
		"00001101" when "0011", --3
		"10011001" when "0100", --4
		"01001001" when "0101", --5
		"01000001" when "0110", --6
		"00011111" when "0111", --7
		"00000001" when "1000", --8
		"00001001" when "1001", --9
		"11111111" when others; --apagar display
end arqdec;
