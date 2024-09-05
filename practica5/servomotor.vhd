library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity servomotor is
port(clk, pi,pf,inc,dec,rst: in std_logic;
	control: out std_logic);
end entity;

architecture Behavioral of servomotor is
signal clkl: std_logic;
signal duty: integer range 0 to 200:= 85;
begin
	u1: entity work.divf(arqdivf) generic map(500) port map (clk,clkl);
	u2: entity work.senal(a) port map (clkl,duty,control);
	u3: entity work.movimiento(arqmov) port map (clkl,pi,pf,inc,dec,rst,duty);
end architecture;
