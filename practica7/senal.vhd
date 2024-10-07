library ieee;
use ieee.std_logic_1164.all; -- importar bibliotecas

-- La entidad genera una señal PWM utilizando un contador
entity senal is
port(
	clk: in std_logic;	-- senal de reloj de entrada
	snl: out std_logic);-- salida senal PWM
end entity;

architecture arqsenal of senal is
signal conteo: integer range 0 to 25000000:=0; -- senal interna, actua como contador para generar pwm
begin
	process(clk)
	begin
		if rising_edge(clk) then	-- verificar flancos de subida de la señal de reloj
			if(conteo<=500) then 
				snl<= '1';	-- la salida es '1' cuando el contador es menor o igual a 500
			else snl<= '0';	-- de lo contario es 0'
			end if;
			
			if(conteo=25000000) then 
				conteo<= 0;			-- Si el contador alcanza 25,000,000 se reinicia a 0
			else 
				conteo<= conteo+1;	-- sino incrementa en uno
			end if;
		end if;
	end process;
end arqsenal;