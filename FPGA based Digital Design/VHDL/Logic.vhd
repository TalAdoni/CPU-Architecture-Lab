LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;  -- Use numeric_std for modern arithmetic and type conversions
USE work.aux_package.all;  -- Assuming aux_package contains necessary utilities

ENTITY Logic is 
  GENERIC (n : INTEGER := 8);
  PORT (
    Y_in, X_in   					   : IN STD_LOGIC_VECTOR (n-1 DOWNTO 0);
    op           					   : IN STD_LOGIC_VECTOR (2 DOWNTO 0); -- op code in ALUFN (ALU FANE IN )
    Nflag_o, Cflag_o, Zflag_o, Vflag_o : OUT STD_LOGIC;
    Res      						   : OUT STD_LOGIC_VECTOR (n-1 DOWNTO 0)
  );
END Logic;

ARCHITECTURE data_calc OF Logic IS

signal C_vec ,X_signal_pre ,X_signal ,Y_signal, zeros_vec : STD_LOGIC_VECTOR(n-1 DOWNTO 0 ); 
signal S_vec 		 									  : STD_LOGIC_VECTOR(n-1 DOWNTO 0 ); -- we can't read output so we need to create a signal that goes to output
signal legal_command 								      : STD_LOGIC ;


BEGIN
zeros_vec <= (others => '0'); 

	with op select -- checks if the opcode from the ALUFN_i is legal
			legal_command <= '1' when "000" ,
							 '1' when "001" ,
							 '1' when "010" ,
							 '1' when "011" ,
							 '1' when "100" ,
							 '1' when "101" ,
							 '1' when "110" ,
							 '0' when others ;
	
	with op select -- selecting the operation according to the opcode
			S_vec <= not(Y_in) when"000" ,
 				    (Y_in or X_in) when "001" ,
					(Y_in and X_in) when "010" ,
					(Y_in xor X_in) when "011" ,
					(Y_in nor X_in) when "100" ,
					(Y_in nand X_in) when "101" ,
					(Y_in xnor X_in) when "110" ,
					(others => '0') when others ;
					
		 
	Nflag_o <= S_vec(n-1) when legal_command = '1' else '0'  ;  -- last bit tells if the output is positive/ negetive
	
	Cflag_o <= '0' ; -- theres no summing or shifting so we never get carry
	
	Zflag_o <= '1' when S_vec = zeros_vec or legal_command = '0' else '0'  ; -- checks if the output vector is zero and if the commande is legal 
	
	Vflag_o <= '0'; -- theres no summing so we never get overflow
	
	res <= S_vec; -- instert the result to the output 
	
END data_calc;
