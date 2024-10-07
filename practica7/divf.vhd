library ieee;
use ieee.std_logic_1164.all; -- importar bibliotecas

entity divf is
generic(num : integer := 25000000);	-- parametro que establece el no. de ciclos del reloj para el cambio de estado
port(
	clk: in std_logic;
	CLKL: buffer std_logic:= '0');
end entity;

architecture arqdivf of divf is
signal contador: integer range 0 to num; -- senal interna que actúa como contador desde 0 hasta num
begin
	process(clk)
	begin
	if rising_edge(clk) then	-- detecta flancos de la señal de reloj
		if (contador=num) then	-- verifica si el contador ha alcanzado el valor num
			contador<= 0;		-- si es asi, se reinicia
			CLKL<= not(CLKL);
		else
			contador<= contador+1;	-- sino aumenta el contador
		end if;
	end if;
	end process;
end architecture;