library ieee;
use ieee.std_logic_1164.all; -- importar bibliotecas

entity divf is
generic(num : integer := 25000);	-- parametro que establece el no. de ciclos del reloj para el cambio de estado del LED
port(
	clk: in std_logic;
	led: buffer std_logic:= '0');
end entity;

architecture arqdivf of divf is
signal contador : integer range 0 to num; -- senal interna que actúa como contador desde 0 hasta num
begin
	process(clk)	-- proceso que se ejecuta con cada cambio en la señal de reloj clk
	begin
	if rising_edge(clk) then	-- detecta flancos de la señal de reloj
		if (contador=num) then	-- verifica si el contador ha alcanzado el valor num
			contador<= 0;		-- si es asi, se reinicia
			led<= not(led);
		else
			contador<= contador+1;	-- sino cuenta
		end if;
	end if;
	end process;
end architecture;
