library IEEE;
use ieee.std_logic_1164.all;
package aux_package is
--------------------------------------------------------
--top GENERIC map(n,k,m) PORT map(rst,clk,enable,Y_i,X_i,ALUFN_i,ALUout_o,Nflag_o,Cflag_o,Zflag_o,Vflag_o,PWM_out);
component top IS
  GENERIC (n 		: INTEGER := 16;
		   k 		: integer := 4; -- k=log2(n)
		   m 		: integer := 8; -- m=2^(k-1)
		   Reg_size :integer  := 8);
  PORT 
  (  
	rst,clk,enable :					in std_logic;
	Y_i,X_i: 							IN STD_LOGIC_VECTOR (n-1 DOWNTO 0);
	ALUFN_i : 							IN STD_LOGIC_VECTOR (4 DOWNTO 0);
	ALUout_o: 							OUT STD_LOGIC_VECTOR(Reg_size-1 downto 0);
	Nflag_o,Cflag_o,Zflag_o,Vflag_o:	OUT STD_LOGIC;
	PWM_out:							out std_logic
  );
END component;
---------------------------------------------------------  
--GPIOtop GENERIC map(n,k,m,Reg_size) PORT map(Inclk,rst,enable,KEY0,KEY1,KEY2,SW9,SW7to0,PWMout,LEDS,
--		  									   HEX0,HEX1,HEX2,HEX3,HEX4,HEX5);
component GPIOtop IS
  GENERIC (n 		: INTEGER := 16;
		   k 		: integer := 4;   -- k=log2(n)
		   m 		: integer := 8; -- m=2^(k-1)
		   Reg_size :integer  := 8				
		   ); 
  PORT 
  (  
	Inclk,rst,enable :					in std_logic; --enable=SW8,rst=key3
	KEY0,KEY1,KEY2,SW9 :				in std_logic; 
	SW7to0: 							in std_logic_vector(7 downto 0); 
	PWMout:								out std_logic; 
	LEDS:								out std_logic_vector(9 downto 0);
	HEX0,HEX1,HEX2,HEX3,HEX4,HEX5:		out std_logic_vector(6 downto 0)
	
  );
end component;
---------------------------------------------------------  
	component FA is
		PORT (xi, yi, cin: IN std_logic;
			      s, cout: OUT std_logic);
	end component;
---------------------------------------------------------	
-- AdderSub GENERIC (n : INTEGER := 8)PORT (Y_in(dim n) ,
--X_in(dim n),ALUFN (dim3),Nflag_o,Cflag_o,Zflag_o,Vflag_o,S_out (dim n))
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
---------------------------------------------------------		
-- Logic GENERIC (n) PORT(Y_in, X_in, op, Nflag_o, Cflag_o, Zflag_o, Vflag_o,  result)	
    component Logic is 
      GENERIC (n : INTEGER := 8);
      PORT (
        Y_in, X_in   : IN STD_LOGIC_VECTOR (n-1 DOWNTO 0);
        op           : IN STD_LOGIC_VECTOR (2 DOWNTO 0); -- op code in ALUFN (ALU FANE IN )
        Nflag_o, Cflag_o, Zflag_o, Vflag_o : OUT STD_LOGIC;
        Res        : OUT STD_LOGIC_VECTOR (n-1 DOWNTO 0)
      );
    end component;
---------------------------------------------------------
-- Shifter GENERIC (n : INTEGER := 8;k : INTEGER := 2)PORT (Y_in, X_in, op, Nflag_o, Cflag_o, Zflag_o, Vflag_o,  result)
	component Shifter IS
	  GENERIC (n : INTEGER := 8;k : INTEGER := 2);
	  PORT (
		Y_in, X_in   : IN STD_LOGIC_VECTOR (n-1 DOWNTO 0);
		op           : IN STD_LOGIC_VECTOR (2 DOWNTO 0); -- op code in ALUFN (ALU FANE IN )
		Nflag_o, Cflag_o, Zflag_o, Vflag_o : OUT STD_LOGIC;
		result        : OUT STD_LOGIC_VECTOR (n-1 DOWNTO 0)
	  );
	end component;
---------------------------------------------------------
-- Counter generic map(n : integer := 16) port map(rst,clk,enable, EQUY,q);
component Counter is 
	generic(n : integer := 16);
	port (rst,clk,enable, EQUY :	in std_logic;	
	q: 						out std_logic_vector (n-1 downto 0)); 
end component;
---------------------------------------------------------
-- PWM_Output_Unit generic map(n) port map(X_Value,Y_Value,PWM_Mod,rst,clk,enable,PWM_Out); 
component PWM_Output_Unit is 
	generic(n : integer := 16);
	port (
			X_Value, Y_Value:		in std_logic_vector(n-1 downto 0);
			PWM_Mod:				in std_logic_vector(2 downto 0);
			rst,clk,enable :		in std_logic;	
			PWM_Out: 				out std_logic
		); 
end component;
---------------------------------------------------------
--PLL port(areset,inclk0,c0,locked);
	 component PLL port(
	      areset		: IN STD_LOGIC  := '0';
		   inclk0		: IN STD_LOGIC  := '0';
		       c0		: OUT STD_LOGIC ;
		    locked		: OUT STD_LOGIC );
    end component;
---------------------------------------------------------
-- Reg generic map ( Dwidth ) port map (clk,en,D,Q);
component Reg is
	generic( Dwidth: integer:=8 );
	port(   clk,en:				in 		std_logic;
			D: 					in 		std_logic_vector(Dwidth-1 downto 0);
			Q:					out		std_logic_vector(Dwidth-1 downto 0)
			);
end component;

---------------------------------------------------------
--HexDecoder port map (Data_IN,Data_OUT);
component HexDecoder is
  port (
		Data_IN:			in STD_LOGIC_VECTOR(3 downto 0);
		Data_OUT:			out STD_LOGIC_VECTOR(6 downto 0)
  );
end component;
---------------------------------------------------------
---------------------------------------------------------
---------------------------------------------------------











	
	
	
	
	
	
	
	
end aux_package;

