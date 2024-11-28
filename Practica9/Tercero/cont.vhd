library ieee;
use ieee.std_logic_1164.all; -- Importar bibliotecas 

-- Declarar la entidad para el contador
entity cont is
port (
    clk: in std_logic; -- Señal de reloj
    num_entrada: out std_logic_vector(3 downto 0) -- Salida del numero del contador en binario
);
end entity;

architecture arqcont of cont is
signal conteo: integer := 0; -- Señal para el conteo del contador
signal num: integer := 0; -- Variable para almacenar el número actual (no se utiliza en este código)
begin
    process(clk)
    begin
        if rising_edge(clk) then
            -- CResetear el contador al llegar a 9
            if (conteo = 9) then
                conteo <= 0;
            else
                conteo <= conteo + 1; -- Incrementar el contador en 1
            end if;

            -- Asignar valor de salida (numero) con base en el conteo actual
            case conteo is
                when 1 => num_entrada <= "0001";
                when 2 => num_entrada <= "0010";
                when 3 => num_entrada <= "0011";
                when 4 => num_entrada <= "0100";
                when 5 => num_entrada <= "0101";
                when 6 => num_entrada <= "0110";
                when 7 => num_entrada <= "0111";
                when 8 => num_entrada <= "1000";
                when 9 => num_entrada <= "1001";
                when others => num_entrada <= "0000";
            end case;

        end if;
    end process;

end architecture;
