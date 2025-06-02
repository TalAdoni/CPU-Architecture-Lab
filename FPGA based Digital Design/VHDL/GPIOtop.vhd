LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
USE work.aux_package.all;
----------------------------------------------------------------
ENTITY GPIOtop IS
  GENERIC (n 		: INTEGER := 16;
		   k 		: integer := 4;   -- k=log2(n)
		   m 		: integer := 8; -- m=2^(k-1)
		   Reg_size :integer  := 8				
		   ); 
  PORT 
  (  
	CLK_IN,rst,enable :					in std_logic; --enable=SW8,rst=key3
	KEY0,KEY1,KEY2,SW9 :				in std_logic; 
	SW7to0: 							in std_logic_vector(7 downto 0); 
	PWMout:								out std_logic; 
	LEDS:								out std_logic_vector(9 downto 0);
	HEX0,HEX1,HEX2,HEX3,HEX4,HEX5:		out std_logic_vector(6 downto 0)
	
  );
end GPIOtop;
----------------------------------------------------------------
ARCHITECTURE struct OF GPIOtop IS 

signal Clk,Nflag,Cflag,Zflag,Vflag,not_rst:						std_logic;
signal Y,X:														std_logic_vector(n-1 downto 0);
signal ALUout:													std_logic_vector(Reg_size-1 downto 0);
signal Y_High,Y_Low,X_High,X_Low:								std_logic_vector(Reg_size-1 downto 0) := (others => '0');
signal Y_Low_En,Y_High_En,X_Low_En,X_High_En,ALUFN_EN:			std_logic;
signal ALUFN_Reg_size:													std_logic_vector(Reg_size-1 downto 0);
--signal ALUFN_TEMP:												std_logic_vector(Reg_size-1 downto 0);
signal X_notDecoded,y_notDecoded,ALUout_notDecoded:				std_logic_vector(Reg_size-1 downto 0);-- Decoded/not Decoded to HEX
--signal X_Decoded,y_Decoded:										std_logic_vector(n-1 downto 0);		--ALUout_Decoded,X_Decoded,y_Decoded not size 7 !!!!				
signal ALUout_Decoded,X_Decoded,y_Decoded:						std_logic_vector(13 downto 0);



begin

--PLL port(areset,inclk0,c0,locked);
PLL_Ports: PLL port map(inclk0 => CLK_IN,c0 => Clk);

--top GENERIC map(n,k,m) PORT map(rst,clk,enable,Y_i,X_i,ALUFN_i,ALUout_o,Nflag_o,Cflag_o,Zflag_o,Vflag_o,PWM_out);
top_Ports: top GENERIC map(n,k,m) PORT map(not_rst,clk,enable,Y,X,ALUFN_Reg_size(4 downto 0),ALUout,Nflag,Cflag,Zflag,Vflag,PWMout);
	  
--HexDecoder port map (Data_IN,Data_OUT);
-- X HEX
Hex0_Ports: HexDecoder port map (X_notDecoded(3 downto 0),X_Decoded(6 downto 0));
Hex1_Ports: HexDecoder port map (X_notDecoded(Reg_size-1 downto 4),X_Decoded(13 downto 7));
 
-- Y HEX
Hex2_Ports: HexDecoder port map (Y_notDecoded(3 downto 0),Y_Decoded(6 downto 0));
Hex3_Ports: HexDecoder port map (Y_notDecoded(Reg_size-1 downto 4),Y_Decoded(13 downto 7));

--ALUout
Hex4_Ports: HexDecoder port map (ALUout_notDecoded(3 downto 0),ALUout_Decoded(6 downto 0)); 	--- Decoded HEX is from size 7 
Hex5_Ports: HexDecoder port map (ALUout_notDecoded(Reg_size-1 downto 4),ALUout_Decoded(13 downto 7));
-------------  Registers ~--------------------------
-- Reg generic map ( Dwidth ) port map (clk,en,rst,D,Q);
Y_Low_Reg		:Reg generic map ( Reg_size ) port map (clk,Y_Low_En,SW7to0,Y_Low);
Y_High_Reg		:Reg generic map ( Reg_size ) port map (clk,Y_High_En,SW7to0,Y_High);
X_Low_Reg		:Reg generic map ( Reg_size ) port map (clk,X_Low_En,SW7to0,X_Low);
X_High_Reg		:Reg generic map ( Reg_size ) port map (clk,X_High_En,SW7to0,X_High);
ALUFN_Reg		:Reg generic map ( Reg_size ) port map (clk,ALUFN_EN,SW7to0,ALUFN_Reg_size);
----------------------------------------------------------------------------------------
---------------------- X and Y assigning ----------------------------
Y <= Y_High & Y_Low;

X <= X_High & X_Low;
-------------------------- Enables  ---------------------
Y_Low_En	<= not(KEY0) and not(SW9);

Y_High_En	<= not(KEY0) and SW9;

X_Low_En	<= not(KEY1) and not(SW9);

X_High_En	<= not(KEY1) and SW9;

ALUFN_EN	<= not(KEY2);

not_rst		<= not(rst);
-------------------------- HEX assigning ---------------------
X_notDecoded <= X_High when SW9 = '1' else X_Low;

Y_notDecoded <= Y_High when SW9 = '1' else Y_Low;

ALUout_notDecoded <= ALUout;

HEX0		<=	X_Decoded(6 downto 0);
HEX1		<=	X_Decoded(13 downto 7);
HEX2		<= 	Y_Decoded(6 downto 0);
HEX3		<=	Y_Decoded(13 downto 7);
HEX4		<=	ALUout_Decoded(6 downto 0);
HEX5		<=	ALUout_Decoded(13 downto 7);

-------------------------- LEDs assigning ---------------------
LEDS(9 downto 5) <= ALUFN_Reg_size(4 downto 0);

LEDS(3 downto 0) <= Nflag&Cflag&Zflag&Vflag;


	  
	  
END struct;