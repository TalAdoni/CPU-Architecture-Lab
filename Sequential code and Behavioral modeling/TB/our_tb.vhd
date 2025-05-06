library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
USE work.aux_package.all;
---------------------------------------------------------
entity tb is
	constant n : integer := 32;
end tb;
---------------------------------------------------------
architecture rtb of tb is
	signal rst, clk, repeat : std_logic;
	signal upperBound : std_logic_vector(n-1 downto 0);
	signal count : std_logic_vector(n-1 downto 0);
	signal busy	: std_logic;
begin
	L0 : top generic map (n) port map(rst,clk,repeat,upperBound,count,busy);
    
	--------- start of stimulus section ------------------	
        gen_clk : process
        begin
		  clk <= '0';
		  wait for 50 ns;
		  clk <= not clk;
		  wait for 50 ns;
        end process;
				
	gen_upperBound : process
        begin
		   upperBound <=(1=>'1',0=>'0',others => '0'); wait for 1000 ns;--"10" wait for 300 ns;
		  upperBound <= upperBound + 8 ; wait for 1000 ns;
		  upperBound<=(others =>'0');
		 -- upperBound <=(1=>'1',0=>'0',others => '0'); wait for 300 ns;--"10" wait for 300 ns;
		 
		 
		  
		  
		--  for i in 0 to 1 loop
		--	wait for 8000 ns;
		--		upperBound <= upperBound+2;
		--  end loop;
		--  upperBound <=(1=>'1',0=>'0',others => '0');
		--  for i in 0 to 0 loop
		--	wait for 800 ns;
		--		upperBound <= upperBound-4;
		--  end loop;
		--  
		--  for i in 0 to 2 loop
		--	wait for 800 ns;
		--		upperBound <= upperBound+1;
		--  end loop;
        end process;
		  
		gen_rst : process
        begin
		  rst <='1'; wait for 150 ns;
		  rst <='0'; wait for 2000 ns;
		  wait ;
        end process;
		
		gen_repeat : process
        begin
		  repeat <=	'0'; wait for 1000 ns;
		  repeat <= '1'; wait for 280000 ns;--for 250 ns;
		  wait ;
		  --repeat <=	'1',
		--			'0' after 2000 ns;
		  
        end process;
		
end architecture rtb;
