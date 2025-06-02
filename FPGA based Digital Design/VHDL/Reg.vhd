library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
-----------------------------------------------------------------
entity Reg is
	generic( Dwidth: integer:=8 );
	port(   clk,en:				in 		std_logic;
			D: 					in 		std_logic_vector(Dwidth-1 downto 0);
			Q:					out		std_logic_vector(Dwidth-1 downto 0)
			);
end Reg;

architecture sync of Reg is

begin 
	process(clk)
	variable Q_temp:	std_logic_vector(Dwidth-1 downto 0);
	begin
		if (rising_edge(clk)) then
			if (en ='1') then
				Q_temp := D;
			else 
			 Q_temp := Q_temp;
			end if;
		end if;
	Q <= Q_temp;
	end process;
	
end sync;

