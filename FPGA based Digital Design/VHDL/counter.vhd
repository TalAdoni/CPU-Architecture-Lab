library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_unsigned.all; 
------------------------------------------------------------------ 
entity Counter is 
	generic(n : integer := 16);
	port (rst,clk,enable, EQUY :	in std_logic;	
	q: 						out std_logic_vector (n-1 downto 0)); 
end Counter;
------------------------------------------------------------------ 

architecture rtl of Counter is
    
begin
    process (clk, rst,EQUY)
	variable zeros_Vec : 						std_logic_vector (n-1 downto 0):= (others => '0');
	variable q_int : 						std_logic_vector (n-1 downto 0):= (others => '0');
    begin
        if ((rst = '1') or (EQUY = '1'))and q_int /= zeros_Vec then
				q_int := (others => '0');
		elsif((enable = '1') and (rising_edge(clk))) then

				q_int := q_int + 1; -- rising edge and enable = '1'
			
	    end if;
		q <= q_int;
    end process;
end rtl;
