library ieee;
use ieee.std_logic_1164.all; -- importar bibliotecas

entity movimiento is
port(
	clk,pi,pf,inc,dec,rst: in std_logic;
	ancho: out integer);
end entity;

architecture arqmov of movimiento is
signal valor: integer range 0 to 100;
signal cont: integer range 0 to 5000:= 0; -- ajustar valor segun la frecuencia deseada
begin
	process(clk,pi,pf,inc,dec)
	begin
		if(rst='1') then
			valor<= 75;
			
		elsif(pi='1') then
			valor<= 55; -- 5.5% 1ms
			
		elsif(pf='1') then
			valor<= 95; -- 9.5% 2ms
			
		elsif rising_edge(clk) then
            if (cont=5000) then
                cont<= 0;
                if (inc='1' and valor<=95) then
                    valor<= valor+1;
                elsif (dec='1' and valor>=55) then
                    valor<= valor-1;
                end if;
            else
                cont<= cont+1;
            end if;
		end if;
	ancho<= valor;
	end process;
end architecture;
