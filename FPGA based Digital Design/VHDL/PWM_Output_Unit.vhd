library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_unsigned.all; 
USE work.aux_package.all;
------------------------------------------------------------------ 
entity PWM_Output_Unit is 
	generic(n : integer := 16);
	port (
			X_Value, Y_Value:		in std_logic_vector(n-1 downto 0);
			PWM_Mod:				in std_logic_vector(2 downto 0);
			rst,clk,enable :		in std_logic;	
			PWM_Out: 				out std_logic
		); 
end PWM_Output_Unit;
------------------------------------------------------------------
architecture rtl of PWM_Output_Unit is
    signal counter_out:								std_logic_vector (n-1 downto 0):=(others => '0');
	signal EQUY, PWM_signal:									std_logic:= '0';
	signal PWM_SetReset,PWM_ResetSet, PWM_Toggle:	std_logic := '0'; --Output signals
begin
-- Counter generic map(n : integer := 16) port map(rst,clk,enable,EQUY,q);
Counter_Ports: Counter generic map(n) port map(rst,clk,enable,EQUY,counter_out);

    process (clk)
    begin
        if (rising_edge(clk) and enable = '1') then
			if (X_Value > Y_Value) then
				PWM_SetReset <= '0';
				PWM_ResetSet <= '0';
				PWM_Toggle <= '0';
				EQUY <= '1';
			elsif(counter_out >= Y_Value)then
				if (X_Value = 0) then --
					PWM_Toggle <= not(PWM_Toggle);
				else
					PWM_SetReset <= '0';
					PWM_ResetSet <= '1';
				end if;
				EQUY <= '1' ;
			elsif (X_Value > counter_out+1) then
				PWM_SetReset <= '0';
				PWM_ResetSet <= '1';
				EQUY <= '0';
			elsif (X_Value <= counter_out+1) then
				if (X_Value = counter_out +1) then
					PWM_Toggle <= not(PWM_Toggle);
				end if;
				PWM_SetReset <= '1';
				PWM_ResetSet <= '0';
				EQUY <= '0';
			end if;
		end if;
		--if (not(clk'event and clk='1')and EQUY ='1' )then
		--	EQUY <='0';
		--end if;
		
    end process;
	
with PWM_Mod select -- checks if the opcode from the ALUFN_i is legal
		PWM_Out <= PWM_SetReset when "000" ,
				   PWM_ResetSet when "001" ,
				   PWM_Toggle when "010" ,
				   '0' when others;
end rtl;
