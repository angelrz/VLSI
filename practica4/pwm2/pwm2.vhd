library ieee;
use ieee.std_logic_1164.all; -- importar bibliotecas

entity pwm2 is
port(
	clk: in std_logic;	-- senal de reloj de entrada
	leds: out std_logic_vector(8 downto 0));	-- vector de salida para ver cada uno de los LEDs
end entity;

architecture a of pwm2 is
signal clkl: std_logic;	-- senal interna usada para conectar la salida del divf con las entradas de PWM
begin
	u1: entity work.divf(a) generic map(250) port map(clk, clkl);	-- dividir clk usando el param. con 250
	led0: entity work.senal(b) port map(clkl, 900, leds(0)); -- cada led se controla por senal con diferente duty's
	led1: entity work.senal(b) port map(clkl, 800, leds(1)); -- con valores que van desde 900 a 100
	led2: entity work.senal(b) port map(clkl, 700, leds(2));
	led3: entity work.senal(b) port map(clkl, 600, leds(3));
	led4: entity work.senal(b) port map(clkl, 500, leds(4));
	led5: entity work.senal(b) port map(clkl, 400, leds(5));
	led6: entity work.senal(b) port map(clkl, 300, leds(6));
	led7: entity work.senal(b) port map(clkl, 200, leds(7));
	led8: entity work.senal(b) port map(clkl, 100, leds(8));
end architecture;
