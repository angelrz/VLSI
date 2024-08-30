library IEEE;
use IEEE.std_logic_1164.all;

entity corri is
port( 
	clk,reset: in std_logic;
	hex0,hex1,hex2,hex3: out std_logic_vector(7 downto 0));
end entity;

architecture a of corri is
signal clkC: std_logic;
signal bcdC: std_logic_vector(2 downto 0);
begin
	u1: entity work.divf(a) port map (clk,clkC);	-- damos la senal de reloj 
	u2: entity work.conta(a) port map (clkC,reset,bcdC); -- iniciamos el contador
	u3: entity work.ss7(a) port map ("011", hex0); 		-- bit menos significativo es 3
	u4: entity work.ss7(a) port map ('0'&"10", hex1);	-- bit 2, sera el numero 2
	u5: entity work.ss7(a) port map (bcdC, hex2);		-- segundo sera el siguiente (1)
	u6: entity work.ss7(a) port map (bcdC, hex3);		-- bit mas significativo en 0
end architecture;
