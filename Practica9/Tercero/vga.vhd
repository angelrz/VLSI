library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; -- Importar bibliotecas

-- entidad VGA
entity vga is
port (clk: in std_logic;
	red,green,blue: out std_logic_vector(3 downto 0);
	h_sync,v_sync: out std_logic);
end entity;

architecture arqvga of vga is
-- En la arquitectura de vga, unir las entidades previamente declaradas
signal clkl, clkl2, disp_ena: std_logic;
signal column, row: integer;
signal num_entrada: std_logic_vector(3 downto 0);
begin
	u1: entity work.divf(arqdivf) generic map(0) port map(clk, clkl);	-- RelojPixel
	u2: entity work.vga_core(arqcr) port map(clkl, disp_ena, h_sync, v_sync, column, row);
	u3: entity work.divf(arqdivf) generic map(25000000) port map(clk, clkl2); --RelojContador
	u4: entity work.cont(arqcont) port map(clkl2, num_entrada);
	u5: entity work.imagen(arqim) port map(disp_ena, column, row, num_entrada, red, green, blue);
end architecture;