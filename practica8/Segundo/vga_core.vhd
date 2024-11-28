library ieee;
use ieee.std_logic_1164.all; -- Importar bibliotecas

-- Declarar entidad del control del VGA
entity vga_core is
generic(h_pulse: integer := 96; -- Anchode sincronizacion horizontal
    h_bp: integer := 48;      -- Retardo horizontal tras el pulso de sincronizacion
    h_pixels: integer := 640; -- Num de pixeles horizontales
    h_fp: integer := 16;      -- Retardo horizontal antes del pulso de sincronizacion
    v_pulse: integer := 2;    -- Ancho de sincronizacion vertical
    v_bp: integer := 33;      -- Retardo vertical tras el pulso de sincronizacion
    v_pixels: integer := 480; -- Num de pixeles verticales
    v_fp: integer := 10);     -- Retardo vertical antes del pulso de sincronizacion
port(clk: in std_logic;	-- Senal de reloj
	display_ena, h_sync, v_sync: out std_logic; -- Habilitador de pantalla, sincr.  horizontal y vertical
	column, row: out integer);	-- Columna y fila del pixel actual
end entity;

architecture arqcr of vga_core is
signal h_period: integer:= h_pulse + h_bp + h_pixels + h_fp; --800
signal v_period: integer:= v_pulse + v_bp + v_pixels + v_fp; --525
-- Senales para contadores horizontal y vertical 
signal h_count: integer range 0 to h_period-1:= 0;
signal v_count: integer range 0 to v_period-1:= 0;
begin
	process (clk)
	begin
		if rising_edge(clk) then
			-- Contadores de pixeles horizontales y verticales. Se recorre por renglon
			-- cuando se acaba el renglon se pasa al siguiente renglon.
			if (h_count < (h_period-1)) then
				h_count<= h_count+1;
			else
				h_count <= 0;
				if (v_count < (v_period - 1)) then
					v_count<= v_count+1;
				else
					v_count<= 0;
				end if;
			end if;
			
			-- Sincr. horizontal
			if ((h_count > (h_pixels + h_fp)) or (h_count > (h_pixels + h_fp + h_pulse))) then
				h_sync<= '0';
			else
				h_sync<= '1';
			end if;
			
			-- Sincr. vertical
			if ((v_count > (v_pixels + v_fp)) or (v_count > (v_pixels + v_fp + v_pulse))) then
				v_sync<= '0';
			else
				v_sync<= '1';
			end if;
			
			
			-- Renombramiento
			-- Asignar columna
			if (h_count < h_pixels) then
				column<= h_count;
			end if;
			-- Asignar fila
			if (v_count < v_pixels) then
				row<= v_count;
			end if;
			
			-- Habilitador de imagen
			if ((h_count < h_pixels) and (v_count < v_pixels)) then
				display_ena<= '1';
			else
				display_ena<= '0';
			end if;
			
		end if;
	end process;
end architecture;