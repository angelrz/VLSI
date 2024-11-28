library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity vga is
port (clk: in std_logic;
		red: out std_logic_vector(3 downto 0);
		green: out std_logic_vector(3 downto 0);
		blue: out std_logic_vector(3 downto 0);
		h_sync: out std_logic;
		v_sync: out std_logic);
end entity;

architecture arqvga of vga is
signal clkl, disp_ena: std_logic;
signal column, row: integer;
begin
	
	u1: entity work.divf(arqdivf) generic map(0) port map(clk, clkl);
	u2: entity work.vga_core(arqcr) port map(clkl, disp_ena, h_sync, v_sync, column, row);
	u3: entity work.imagen(arqim) port map(disp_ena, column, row, red, green, blue);

end architecture;