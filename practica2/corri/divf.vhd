library ieee;
use ieee.std_logic_1164.all;

entity divf is 
port(
	clk: in std_logic;
	led: buffer std_logic:='0');
end entity;

architecture a of divf is 
signal contador: integer range 0 to 25000000;
begin
    process(clk)
        begin
            if(clk' event and clk='1') then 
                if(contador = 25000000) then 
                    contador<= 0;
                    led<= not(led);
                else
					contador<= contador+1;
                end if;
            end if;
        end process;
end architecture;
