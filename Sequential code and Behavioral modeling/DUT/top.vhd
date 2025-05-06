LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE work.aux_package.all;
------------------------------------------------------------------
entity top is
	generic ( n : positive := 8 ); 
	port( rst_i, clk_i, repeat_i : in std_logic;
		  upperBound_i : in std_logic_vector(n-1 downto 0);
		  count_o : out std_logic_vector(n-1 downto 0);
		  busy_o : out std_logic);
		  
end top;
------------------------------------------------------------------
architecture arc_sys of top is
	signal count_fast 		 : std_logic_vector(n-1 downto 0);
	signal count_slow 		 : std_logic_vector(n-1 downto 0);
	signal slow_eq_fast_flag : std_logic ;
	signal clr_count_fast : std_logic ;
	
begin
	----------------------------------------------------------------
	----------------------- fast counter process -------------------
	----------------------------------------------------------------
	proc1 : process(clk_i,rst_i,clr_count_fast)
	begin
		if (rst_i = '1') then -- reset works regardless to the clock events and has the highest priority
			count_fast <= (others => '0');
		elsif (clk_i'EVENT and clk_i = '1') then -- sequential
			if (clr_count_fast = '1') then -- described in the control section
				count_fast <= (others => '0'); --the counter neesd to repeat itself again
			elsif (count_fast >= count_slow) then
				count_fast <= count_fast; -- the counter needs to stop
			else
				count_fast <= count_fast + 1; -- count increment
			end if;
		end if;	
		
		
	end process;
	----------------------------------------------------------------
	---------------------- slow counter process --------------------
	----------------------------------------------------------------
	proc2 : process(clk_i,rst_i,slow_eq_fast_flag)
	begin
		if (rst_i = '1') then -- reset works regardless to the clock events and has the highest priority
			count_slow <= (others => '0');
		elsif (clk_i'EVENT and clk_i = '1') then -- sequential
			if (slow_eq_fast_flag = '1') then -- count_fast works as a time counter for count_slow
		    	if (count_slow >= upperBound_i and repeat_i = '0' ) then
		    		count_slow <= count_slow; -- we don't change if we don't need to repeat
		    	elsif (count_slow >= upperBound_i and repeat_i = '1' ) 
					then count_slow <= (others=>'0'); -- we need to repeat so starts again from 0
				else		
		    		count_slow <= count_slow + 1; --count increment
		    	end if;
		    else
				count_slow <= count_slow; -- no need for change yet - count_fast works as a time counter for count_slow
			end if;	
		
		end if;
	
	end process;
	
	---------------------------------------------------------------
	--------------------- combinational part ----------------------
	---------------------------------------------------------------
	
	count_o <= count_fast;
	slow_eq_fast_flag <= '1' when count_fast >= count_slow else '0' ; -- helps with counting logic
	busy_o <= '0' when count_fast >= upperBound_i and slow_eq_fast_flag = '1' and repeat_i = '0' 
				  else '1';
	clr_count_fast <= '1' when (slow_eq_fast_flag = '1' and repeat_i = '1') 
						    or (repeat_i = '0' and slow_eq_fast_flag = '1' and count_slow < upperBound_i) 
						  else '0';
	
	
	----------------------------------------------------------------
end arc_sys;







