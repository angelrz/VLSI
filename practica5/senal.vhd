library ieee;
use ieee.std_logic_1164.all; -- importar bibliotecas

entity senal is
port(
	clk: in std_logic;	-- senal de reloj de entrada (controlar temporizacion del proceso)
	duty: in integer;	-- entrada de ciclo de trabajo, especifica la duracion del pulso
	snl: out std_logic);-- salida de senal PWM, genera un pulso modulado
end entity;

architecture a of senal is
signal conteo: integer range 0 to 1000; -- senal interna, actua como contador hasta 1000
begin
	process(clk)	-- proceso que depende del reloj para generar la senal PWM
		begin
			if rising_edge(clk) then	-- detectar flancos de subida de la señal de reloj
				if(conteo<= duty) then	-- comparar contador con el ciclo de trabajo (duty) para definir el estado de snl
					snl<= '1';			-- si es menor o igual a duty, la senal de salida sera 1
				else
					snl<= '0';			-- sino, la senal de salida sera 0
				end if;
				if (conteo=1000) then 	-- si el contador llega a 1000, se reinicia
					conteo<= 0;
				else
					conteo<= conteo+1; 	-- de lo contrario incrementa el contador
				end if;
			end if;
	end process;
end architecture;
