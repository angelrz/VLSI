library ieee;
use ieee.std_logic_1164.all;

entity divf is
	generic (num: integer := 25000000);
	port(
	clk: in std_logic;
	clkl: buffer std_logic:= '0');
end entity;

architecture arqdivf of divf is
signal contador: integer range 0 to num;
begin
	process(clk)
	begin
		if(rising_edge(clk)) then
			if (contador = num) then
				contador<= 0;
				clkl<= not clkl;
			else
			contador<= contador + 1;
			end if;
		end if;
	end process;
end architecture;