library ieee;
use ieee.std_logic_1164.all;

entity display is
port(
	clk: in std_logic; -- senal de reloj
	mi: in std_logic_vector(7 downto 0);	-- entrada de datos para mostrar
	mo: out std_logic_vector(7 downto 0));	-- salida de datos mostrados
end entity;

architecture a of display is
begin
    process(clk)
    begin
        if rising_edge(clk) then
            mo<= mi;-- transferir la entrada a la salida en cada flanco de subida
        end if;
    end process;
end;

