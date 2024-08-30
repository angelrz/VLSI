library ieee;
use ieee.std_logic_1164.all;

entity dec7seg is
port(
	bcd: in std_logic_vector(3 downto 0);   -- entrada en formato BCD
	HEX: out std_logic_vector(7 downto 0));   -- salida para display de 7 segmentos
end entity;

-- deco para los displays
architecture a of dec7seg is
begin
with bcd select
HEX <=
--	"00000011" when "0000",
--	"10011111" when "0001",
--	"00100101" when "0010",
--	"00001101" when "0011",
--	"10011001" when "0100",
--	"01001001" when "0101",
--	"01000001" when "0110",
--	"00011111" when "0111",
----	"00000001" when "1000",
--	"00001101" when "1001",
--	"11111111" when others;
	"11111101" when "0000", -- -
	"10010001" when "0001", -- H
	"00000011" when "0010", -- O
	"11100011" when "0011", -- L
	"00010001" when "0100", -- A
	"10011111" when "0101", -- I
	"11010101" when "0110", -- n
	"01000001" when "0111", -- G
	"11111111" when others;  -- valores por defecto
end architecture;
