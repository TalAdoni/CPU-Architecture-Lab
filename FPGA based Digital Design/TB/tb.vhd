library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
USE work.aux_package.all;
---------------------------------------------------------
entity GPIOtopTB is
	constant n 			: INTEGER 	:= 16;
	constant k 			: integer 	:= 4;   -- k=log2(n)
	constant m 			: integer 	:= 8; -- m=2^(k-1)
	constant Reg_size 	:integer	:= 8;
	constant ROWmax 	: integer 	:= 19;
	constant u			: integer 	:= 1;
	constant ALUFN_Size : integer 	:= 5;
	
end GPIOtopTB;
-------------------------------------------------------------------------------
architecture TB_GPIO of GPIOtopTB is
	type mem is array (0 to ROWmax) of std_logic_vector(7 downto 0);
	signal clk,Inclk,KEY3,SW8 :					std_logic; --enable=SW8,rst=key3
	signal KEY0,KEY1,KEY2,SW9 :					std_logic; 
	signal SW7to0: 								std_logic_vector(7 downto 0):= (others=>'0'); 
	signal PWMout:								std_logic; 
	signal LEDS:								std_logic_vector(9 downto 0);
	signal HEX0,HEX1,HEX2,HEX3,HEX4,HEX5:		std_logic_vector(6 downto 0);
	SIGNAL Icache : mem := ("00001101", "00001001", "00001010", "00001011", "00001100", "00001000",
							"00001101", "00001101", "00001111", "00001110", "00001101", "00001001",
							"00001010", "00001011", "00001100", "00001000", "00001001", "00001101",
							"00001111", "00001110");




-------------------------------------------------------------------------------

begin
--GPIOtop GENERIC map(n,k,m,Reg_size,u,ALUFN_Size) PORT map(Inclk,rst,enable,KEY0,KEY1,KEY2,SW9,SW7to0,PWMout,LEDS,
--		  									   HEX0,HEX1,HEX2,HEX3,HEX4,HEX5);
GPIOtop_ports: GPIOtop GENERIC map(n,k,m,Reg_size) PORT map(clk,KEY3,SW8,KEY0,KEY1,KEY2,SW9,SW7to0,PWMout,LEDS,
															HEX0,HEX1,HEX2,HEX3,HEX4,HEX5);
	--------- start of stimulus section ----------------------------------------

		tb_clk : process
        begin
		clk <= '1';
		wait for 10 ns;
		clk <= not (clk);
		wait for 10 ns;
		end process;

		gen_SW_KEYs: process
		begin
		SW7to0  <=(others=>'0'); -- makeing Y=0
		KEY0	<= '1';
		KEY1	<= '1';
		KEY2	<= '1';
		SW9		<= '0';
		wait for 1000 ns;
		SW9		<= '1';
		wait for 500 ns;
		KEY1	<= '0';
		KEY2	<= '0';
		SW8		<= '1';
		SW7to0  <=(1 => '1', others=>'0'); -- makeing Y=2^
		wait for 500 ns;
		KEY0	<= '0';
		KEY1	<= '1';
		SW7to0  <=(0 => '1', others=>'0'); -- makeing X=2^12
		wait for 2 us;
		KEY1	<= '0';
		KEY2	<= '1';
		for i in 0 to ROWmax loop
			SW7to0 <= Icache(i);
			wait for 1 us;
		end loop;
		wait for 10 us;
		SW7to0  <=(others=>'0'); -- makeing Y=0
		KEY0	<= '1';
		KEY1	<= '1';
		KEY2	<= '1';
		SW9		<= '0';
		wait for 1000 ns;
		SW9		<= '1';
		wait for 500 ns;
		KEY1	<= '0';
		KEY2	<= '0';
		SW8		<= '1';
		SW7to0  <=(1 => '1', others=>'0'); -- makeing Y=2^
		wait for 500 ns;
		KEY0	<= '0';
		KEY1	<= '1';
		SW7to0  <=(0 => '1', others=>'0'); -- makeing X=2^12
		wait for 2 us;
		KEY1	<= '0';
		KEY2	<= '1';
		SW7to0  <=( others=>'0');
		for i in 0 to ROWmax loop
			wait for 1 ms;
			SW7to0 <= SW7to0 + 1 ;
		end loop;
		wait ;
		
		end process;
		
		 		
end architecture TB_GPIO;
