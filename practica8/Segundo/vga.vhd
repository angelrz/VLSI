library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; -- importar bibliotecas

-- declarar entidad para control de vga
entity vga is
port(clk: in std_logic;
	red,green,blue: out std_logic_vector(3 downto 0);
	h_sync,v_sync: out std_logic);
end entity;

-- En la arquitectura, integramos las entidades anteriores
architecture arqvga of vga is
signal clkl,disp_ena: std_logic;
signal column,row: integer;
begin
	u1: entity work.divf(arqdivf) generic map(0) port map(clk, clkl);
	u2: entity work.vga_core(arqcr) port map(clkl, disp_ena, h_sync, v_sync, column, row);
	u3: entity work.imagen(arqim) port map(disp_ena, column, row, red, green, blue);
end architecture;
