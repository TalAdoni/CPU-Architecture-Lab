LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
USE work.aux_package.all;
-------------------------------------
ENTITY top IS
  GENERIC (n : INTEGER := 8;
		   k : integer := 3;   -- k=log2(n)
		   m : integer := 4	); -- m=2^(k-1)
  PORT 
  (  
	Y_i,X_i: IN STD_LOGIC_VECTOR (n-1 DOWNTO 0);
		  ALUFN_i : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
		  ALUout_o: OUT STD_LOGIC_VECTOR(n-1 downto 0);
		  Nflag_o,Cflag_o,Zflag_o,Vflag_o: OUT STD_LOGIC
  );
END top;
------------- complete the top Architecture code --------------
ARCHITECTURE struct OF top IS 
	signal Adder_Nflag,Adder_Cflag,Adder_Zflag,Adder_Vflag : STD_LOGIC;
	signal Adder_result : STD_LOGIC_VECTOR (n-1 DOWNTO 0);
	signal Shifter_Nflag,Shifter_Cflag,Shifter_Zflag,Shifter_Vflag : STD_LOGIC;
	signal Shifter_result : STD_LOGIC_VECTOR (n-1 DOWNTO 0);
	signal Logic_Nflag,Logic_Cflag,Logic_Zflag,Logic_Vflag : STD_LOGIC;
	signal Logic_result : STD_LOGIC_VECTOR (n-1 DOWNTO 0);

	
BEGIN

AdderSub_label: AdderSub generic map (n) port map(Y_i,X_i, ALUFN_i(2 downto 0), Adder_Nflag,Adder_Cflag,Adder_Zflag,Adder_Vflag, Adder_result);

-- AdderSub GENERIC (n : INTEGER := 8)PORT (Y_i(dim n) ,
--X_i(dim n),ALUFN (dim3),Nflag_o,Cflag_o,Zflag_o,Vflag_o,result_out (dim n))

Shifter_label: 	Shifter generic map (n,k)  port map (Y_i, X_i, ALUFN_i(2 downto 0), Shifter_Nflag, Shifter_Cflag, Shifter_Zflag, Shifter_Vflag, Shifter_result);
	
-- Shifter GENERIC (n : INTEGER := 8;k : INTEGER := 3)PORT (Y_i, X_i, op, Nflag_o, Cflag_o, Zflag_o, Vflag_o,  result)
	
Logic_label: Logic generic map (n) port map (Y_i, X_i, ALUFN_i(2 downto 0), Logic_Nflag, Logic_Cflag, Logic_Zflag, Logic_Vflag, Logic_result);
-- Logic GENERIC (n) PORT(Y_i, X_i, op, Nflag_o, Cflag_o, Zflag_o, Vflag_o,  result)	
			 
with ALUFN_i(4 downto 3) select 
	 ALUout_o <= Adder_result     when "01",
				 Shifter_result   when "10",
				 Logic_result     when "11", 
				 (others => '0')  when others;

with ALUFN_i(4 downto 3) select 
	 Nflag_o <=  Adder_Nflag      when "01",
				 Shifter_Nflag    when "10",
				 Logic_Nflag      when "11", 
				 '0'  			  when others;

with ALUFN_i(4 downto 3) select 
	 Vflag_o <=  Adder_Vflag      when "01",
				 Shifter_Vflag    when "10",
				 Logic_Vflag      when "11", 
				 '0'  			  when others;

with ALUFN_i(4 downto 3) select 
	 Cflag_o <=  Adder_Cflag      when "01",
				 Shifter_Cflag    when "10",
				 Logic_Cflag      when "11", 
				 '0'  			  when others;
				 
with ALUFN_i(4 downto 3) select 
	 Zflag_o <=  Adder_Zflag      when "01",
				 Shifter_Zflag    when "10",
				 Logic_Zflag      when "11", 
				 '1'  			  when others;				 
END struct;

