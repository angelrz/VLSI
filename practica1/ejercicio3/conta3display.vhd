library ieee;
use ieee.std_logic_1164.all;

entity conta3display is
port(clk: in std_logic;
	ssg0: out std_logic_vector(6 downto 0);
	ssg1: out std_logic_vector(6 downto 0);
	ssg2: out std_logic_vector(6 downto 0);
	banderaSal: out std_logic);
end entity;

architecture a of conta3display is 
signal bandera: std_logic;
signal conteo: integer range 0 to 9;
begin
	u7: entity work.conta2display(a) port map(clk, ssg0, ssg1, bandera); 
	u8: entity work.cont(arqcont) port map(bandera,conteo,banderaSal); 
	u9: entity work.ss7(arqss7) port map(conteo,ssg2); 
end architecture;
