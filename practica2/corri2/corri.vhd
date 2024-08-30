library ieee;
use ieee.std_logic_1164.all;

-- corri coordina los modulos para la visualizar s en varios displays.
entity corri is 
port(
	clk,reset: in std_logic;
	hex0,hex1,hex2,hex3,hex4: buffer std_logic_vector(7 downto 0));
end;

-- la arquitectura describe la el flujo de los modulos funcionales (reloj lento,conteo, 
-- dec7seg y la de salida a través de los displays
architecture arqcorri of corri is
signal clkl: std_logic;
signal bcd: std_logic_vector(2 downto 0);
begin
	u1: entity work.relojlento(arqrelojlento) port map (clk, clkl);
	u2: entity work.conta(a) port map(clkl, reset, bcd);
	u3: entity work.dec7seg(a) port map('0'&bcd, hex0); --mensaje
	u4: entity work.display(a) port map(clkl, hex0, hex1);
	u5: entity work.display(a) port map(clkl, hex1, hex2);
	u6: entity work.display(a) port map(clkl, hex2, hex3);
	u7: entity work.display(a) port map(clkl, hex3, hex4);
end;

