library ieee;
use ieee.std_logic_1164.all; -- importar bibliotecas

-- Esta entidad implementa un contador que genera la salida del led y controla dos displays 7 segmentos
-- segun echo y el valor del contador
entity contador is
port(
    echo,clk,rst: in std_logic; -- controla el incremento del contador, senal reloj, reinicio o reset
    led: out std_logic;			-- led que se ajusta al valor del contador
    decenas: out std_logic_vector(3 downto 0);	-- display de 7 segmentos de decenas
    unidades: out std_logic_vector(3 downto 0));-- display de 7 segmentos de unidades
end entity;

architecture arqcont of contador is
signal conteo: integer range 0 to 12000 := 0; -- contador con rango de 0 a 12,000 (tiempo en ms) 
begin
process(echo,clk,rst)
begin
	if (rst = '1') then	--verificar si reset está activa
		conteo<= 0;		-- reiniciar el contador a 0
		led<= '0';	-- asignar '0' a la salida
		
	elsif rising_edge(clk) then -- detecta flanco de subida del clk
		if (echo = '1') then
			conteo <= conteo + 1; -- incrementar contador si 'echo' es '1'
			led <= '0';        -- establece la salida en '0'
		else
			-- controlar el led y los displays de 7 segmentos 
			if (conteo >= 118 and conteo < 176) then -- 118-176ms (2cm)
				led <= '0';		-- led apagado
				decenas <= "0000";	-- decenas en estado 0
				unidades <= "0010";	-- unidad en estado 2
			elsif (conteo >= 176 and conteo < 235) then	-- 3cm
				led <= '0';
				decenas <= "0000";
				unidades <= "0011";
			elsif (conteo >= 235 and conteo < 294) then -- 4cm
				led <= '0';
				decenas <= "0000";
				unidades <= "0100";
			elsif (conteo >= 294 and conteo < 353) then	-- 294-354ms (5cm)
				led <= '1';		-- led encendido
				decenas <= "0000";	-- decenas en estado 0
				unidades <= "0101";	-- unidades en estado 5
			elsif (conteo >= 353 and conteo < 412) then -- 6cm
				led <= '0';
				decenas <= "0000";
				unidades <= "0110";
			elsif (conteo >= 412 and conteo < 471) then	-- 7cm
				led <= '0';
				decenas <= "0000";
				unidades <= "0111";
			elsif (conteo >= 471 and conteo < 529) then	-- 8cm
				led <= '0';
				decenas <= "0000";
				unidades <= "1000";
			elsif (conteo >= 529 and conteo < 588) then	-- 9cm
				led <= '0';
				decenas <= "0000";
				unidades <= "1001";
			elsif (conteo >= 588 and conteo < 647) then	--10cm
				led <= '0';
				decenas <= "0001";	-- 1
				unidades <= "0000";	-- 0
			elsif (conteo >= 647 and conteo < 706) then	--11cm
				led <= '0';
				decenas <= "0001";
				unidades <= "0001";
			elsif (conteo >= 706 and conteo < 765) then	--12cm
				led <= '0';
				decenas <= "0001";
				unidades <= "0010";
			elsif (conteo >= 765 and conteo < 824) then	--13cm
				led <= '0';
				decenas <= "0001";
				unidades <= "0011";
			elsif (conteo >= 824 and conteo < 882) then	--14cm
				led <= '0';
				decenas <= "0001";
				unidades <= "0100";
			elsif (conteo >= 882 and conteo < 941) then	--15cm
				led <= '0';
				decenas<= "0001";
				unidades <= "0101";
			elsif (conteo >= 941 and conteo < 1000) then--16cm
				led <= '0';
				decenas <= "0001";
				unidades <= "0110";
			elsif (conteo >= 1000 and conteo < 1059) then--17cm
				led <= '0';
				decenas <= "0001";
				unidades <= "0111";
			elsif (conteo >= 1059 and conteo < 1118) then--18cm
				led <= '0';
				unidades <= "1000";
				decenas <= "0001";
			elsif (conteo >= 1118 and conteo < 1176) then--19cm
				led <= '0';
				decenas <= "0001";
				unidades <= "1001";
			elsif (conteo >= 1176 and conteo < 1235) then -- 1176-1235ms (20cm)
				led <= '1';	-- led encendido 20cm
				decenas <= "0010";	-- decenas en estado 2
				unidades <= "0000";	-- unidades en estado 0
			elsif (conteo >= 1235 and conteo < 1235) then	
				led <= '1';	-- led encendido en 21cm
				unidades <= "0001";
				decenas <= "0010";
			else
				led <= '0';	-- sino esta en el rango apagar el led y los displays
				unidades <= "1111";
				decenas <= "1111";
			end if;
		end if;
	end if;
end process;
end arqcont;
