LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;  -- Use numeric_std for modern arithmetic and type conversions
USE work.aux_package.all;  -- Assuming aux_package contains necessary utilities

ENTITY AdderSub IS
  GENERIC (n : INTEGER := 8);
  PORT (
    Y_in, X_in   : IN STD_LOGIC_VECTOR (n-1 DOWNTO 0);
    ALUFN        : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
    Nflag_o, Cflag_o, Zflag_o, Vflag_o : OUT STD_LOGIC;
    S_out        : OUT STD_LOGIC_VECTOR (n-1 DOWNTO 0)
  );
END AdderSub;

ARCHITECTURE data_calc OF AdderSub IS
  signal C_vec : STD_LOGIC_VECTOR(n DOWNTO 0);
  signal S_vec, S_AddSub, Y_swapped, X_signal_pre, X_signal, Y_signal ,zeros_vec : STD_LOGIC_VECTOR(n-1 DOWNTO 0);
  signal legal_command ,overflow_add,overflow_sub: STD_LOGIC;
  signal XOR_with : STD_LOGIC_VECTOR(n-1 DOWNTO 0);
BEGIN
  zeros_vec <= (others => '0');
  C_vec(0)  <= '1' when ALUFN = "001" else  -- sub
              '1' when ALUFN= "010" else  -- nge
              '1' when ALUFN = "100" else  -- dec 1
              '0';  -- default case

  legal_command <= '1' when ALUFN = "000" or ALUFN = "001" or ALUFN = "010" or 
                           ALUFN = "011" or ALUFN = "100" or ALUFN = "101" -- checks whether the opcode is legal
					else '0';

  XOR_with <= (others => '1') when ALUFN = "001" else  -- sub
              (others => '1') when ALUFN = "010" else  -- nge
              (others => '1') when ALUFN= "100" else  -- dec 1
              (others => '0');

  Y_signal <= (others => '0') when ALUFN = "010" else  -- neg
				Y_in ;

  X_signal_pre <= zeros_vec(n-1 DOWNTO 1)&'1' when ALUFN = "011" else  --inc 1
                  zeros_vec(n-1 DOWNTO 1)&'1' when ALUFN = "100" else  --dec
                  X_in ;

  X_signal <= X_signal_pre xor XOR_with;



  -- Full Adder instantiation  
  first : FA port map (
    xi => X_signal(0),
    yi => Y_signal(0),
    cin => C_vec(0),
    s => S_AddSub(0),
    cout => C_vec(1)
  );
  rest : for i in 1 to n-1 generate
    chain : FA port map (
      xi => X_signal(i),
      yi => Y_signal(i),
      cin => C_vec(i),
      s => S_AddSub(i),                                                                                         
      cout => C_vec(i+1)
    );
	end generate;
 --Swap Architecture
--Swap_arc: Y_swapped(n-1 downto 0) <= Y_in(0 to n-1); 

Swap : for i in 0 to n-1 generate
    Swap_chain : Y_swapped(i) <=Y_in(n-1-i);
	end generate;



	S_vec <= Y_swapped when ALUFN = "101" else S_AddSub;

	
  	Nflag_o <=S_vec(n-1) when legal_command = '1' else '0'; -- last bit tells if the output is positive/ negetive
	
	Cflag_o <= C_vec(n)when legal_command = '1' else '0';
	
	Zflag_o <= '1' when S_vec = zeros_vec or legal_command = '0' else '0' ; -- checks if the output vector is zero and if the commande is legal 
	
-- overflow according to the command
	overflow_add <= '1' when( 
    (not X_signal_pre(n-1) and not Y_signal(n-1) and S_vec(n-1)) or 
    (X_signal_pre(n-1) and Y_signal(n-1) and not S_vec(n-1))) = '1' else '0';

	overflow_sub <= '1' when 
    ((not X_signal_pre(n-1) and Y_signal(n-1) and not S_vec(n-1)) or 
    (X_signal_pre(n-1) and not Y_signal(n-1) and S_vec(n-1)))='1' else '0';

	Vflag_o <= overflow_add when (ALUFN = "000" or ALUFN = "011") and legal_command = '1' --checks cases we can get overflow from add and inc
	else overflow_sub when (ALUFN = "001" or ALUFN =  "100" or ALUFN = "010") and legal_command = '1' else '0' ; -- checks cases we can get overflow from sub or dec and neg
	S_out <= S_vec when legal_command = '1' else (others => '0'); 
	
	
END data_calc;



