library ieee;
use ieee.std_logic_1164.all;

entity ss7 is
port(
	bcd: in std_logic_vector (2 downto 0);
	HEX: out std_logic_vector (7 downto 0));
end entity;

architecture a of ss7 is
begin
with bcd select
HEX<=
	"00000011" when "000",
	"10011111" when "001",
	"00100101" when "010",
	"00001101" when "011",
	"10011001" when "100",
	"01001001" when "101",
	"01000001" when "110",
	"00011101" when "111",
--	"00000001" when "1000",
--	"00001001" when "1001",
	"11111111" when others;
end architecture;
