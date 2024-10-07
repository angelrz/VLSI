library ieee;
use ieee.std_logic_1164.all;    -- Importar la biblioteca estándar para señales digitales

entity trigger is
port(
    clk,rst: in std_logic;-- senal de reloj, reset o reinicio, 
    echo: in std_logic;   -- senal de entrada del sensor, indica el eco recibido
    salida: out std_logic -- salida que se ajusta en funcion de clk y echo
);
end entity;

architecture arqtrigger of trigger is
begin
    process(clk)
    begin
        if (rst = '1') then	-- verificar si reset esta activo
            salida <= '0';  -- si es '1', establecer la salida a '0'
        elsif (echo = '0') then
            salida <= clk;  -- si echo es '0', la salida seguira el estado de clk
        end if;
    end process;
end arqtrigger;
