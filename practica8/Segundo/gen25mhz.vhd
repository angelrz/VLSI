library ieee;
use ieee.std_logic_1164.all;

entity gen25mhz is
port(clk50: in std_logic;
	clk25: inout std_logic:='0');
end entity;

architecture arqgen of gen25mhz is 
begin
	process(clk50mhz)
	begin
		if clk50'event and clk50='1' then
			clk25<= not clk25;
		end if;
	end process;
end architecture;