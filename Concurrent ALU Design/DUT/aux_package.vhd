library IEEE;
use ieee.std_logic_1164.all;
package aux_package is
--------------------------------------------------------
	component top is
	GENERIC (n : INTEGER := 8;
		   k : integer := 3;   -- k=log2(n)
		   m : integer := 4	); -- m=2^(k-1)
	PORT 
	(  
		Y_i,X_i: IN STD_LOGIC_VECTOR (n-1 DOWNTO 0);
		ALUFN_i : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
		ALUout_o: OUT STD_LOGIC_VECTOR(n-1 downto 0);
		Nflag_o,Cflag_o,Zflag_o,Vflag_o: OUT STD_LOGIC 
	); -- Zflag,Cflag,Nflag,Vflag
	end component;
---------------------------------------------------------  
	component FA is
		PORT (xi, yi, cin: IN std_logic;
			      s, cout: OUT std_logic);
	end component;
---------------------------------------------------------	
    component AdderSub IS
      GENERIC (n : INTEGER := 8);
      PORT 
      (  
    	Y_in,X_in   : IN STD_LOGIC_VECTOR (n-1 DOWNTO 0);
    	ALUFN       : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
    	Nflag_o,Cflag_o,Zflag_o,Vflag_o: OUT STD_LOGIC ;
    	S_out       : OUT STD_LOGIC_VECTOR(n-1 downto 0)
      ); 
    end component;
-- AdderSub GENERIC (n : INTEGER := 8)PORT (Y_in(dim n) ,
--X_in(dim n),ALUFN (dim3),Nflag_o,Cflag_o,Zflag_o,Vflag_o,S_out (dim n))
---------------------------------------------------------		
	
    component Logic is 
      GENERIC (n : INTEGER := 8);
      PORT (
        Y_in, X_in   : IN STD_LOGIC_VECTOR (n-1 DOWNTO 0);
        op           : IN STD_LOGIC_VECTOR (2 DOWNTO 0); -- op code in ALUFN (ALU FANE IN )
        Nflag_o, Cflag_o, Zflag_o, Vflag_o : OUT STD_LOGIC;
        Res        : OUT STD_LOGIC_VECTOR (n-1 DOWNTO 0)
      );
    end component;
-- Logic GENERIC (n) PORT(Y_in, X_in, op, Nflag_o, Cflag_o, Zflag_o, Vflag_o,  result)	
---------------------------------------------------------
	component Shifter IS
	  GENERIC (n : INTEGER := 8;k : INTEGER := 3);
	  PORT (
		Y_in, X_in   : IN STD_LOGIC_VECTOR (n-1 DOWNTO 0);
		op           : IN STD_LOGIC_VECTOR (2 DOWNTO 0); -- op code in ALUFN (ALU FANE IN )
		Nflag_o, Cflag_o, Zflag_o, Vflag_o : OUT STD_LOGIC;
		result        : OUT STD_LOGIC_VECTOR (n-1 DOWNTO 0)
	  );
	end component;
-- Shifter GENERIC (n : INTEGER := 8;k : INTEGER := 3)PORT (Y_in, X_in, op, Nflag_o, Cflag_o, Zflag_o, Vflag_o,  result)














	
	
	
	
	
	
	
	
end aux_package;

