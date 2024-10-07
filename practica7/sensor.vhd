library ieee;
use ieee.std_logic_1164.all; --importar bibliotecas

-- entidad sensor
entity sensor is
port(
	clk,rst,echo: in std_logic;	-- senal de reloj, reset, echo
	trig,led: out std_logic;	-- trigger,led
	unidades,decenas: out std_logic_vector(7 downto 0)); -- displays de 7 segmentos
end entity;

architecture arqsns of sensor is
signal clkl,clkl2,tr: std_logic; -- senal interna para clk lento y trigger
signal unit,dec: std_logic_vector(3 downto 0);	-- senales para las unidades y decenas
begin
	-- mapear las entradas y salidas
	u1: entity work.divf(arqdivf) generic map(25) port map(clk, clkl);
	u2: entity work.senal(arqsenal) port map(clk, clkl2);
	u3: entity work.trigger(arqtrigger) port map(clkl2,rst,echo,tr);
	--asignar tr al trigger
	trig<= tr;
	u4: entity work.contador(arqcont) port map(echo,clkl,tr,led,dec,unit);
	u5: entity work.dec7seg(arqdec) port map(unit,unidades);
	u6: entity work.dec7seg(arqdec) port map(dec,decenas);
end architecture;
