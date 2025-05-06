library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use work.aux_package.all;
--------------------------------------------------------------
entity ALU is
generic( Dwidth: integer:=16;
		 Awidth: integer:=6);
port(	A, B:					in std_logic_vector(Dwidth-1 downto 0);
		ALUFN:					in std_logic_vector(3 downto 0);
		C:						out std_logic_vector(Dwidth-1 downto 0);
		Cflag, Zflag, Nflag:	out std_logic
);
end ALU;
--------------------------------------------------------------
architecture behav of ALU is

signal ALUout:					std_logic_vector(Dwidth-1 downto 0);
signal cin:						std_logic_vector(Dwidth   downto 0);
signal AdderSubOut:				std_logic_vector(Dwidth-1 downto 0);
signal B_temp:					std_logic_vector(Dwidth-1 downto 0);
signal A_temp:					std_logic_vector(Dwidth-1 downto 0);
signal Zvector:					std_logic_vector(Dwidth-1 downto 0);
signal XOR_with:				std_logic_vector(Dwidth-1 downto 0);
signal ZERO_VEC:				std_logic_vector(Dwidth-1 downto 0);


begin
Zvector <= (others => 'Z');  

	-- Full Adder instantiation
	ZERO_VEC <= (others => '0');
	XOR_with <=(others => '1') when ALUFN = "0001" else (others => '0'); -- sub when 0001 (xor with 1's) else remain unchanged
	cin(0) <= '1' when ALUFN = "0001" else '0';
	B_temp <= ZERO_VEC when (B = Zvector) else B xor XOR_with; -- to cancel high Z input
	A_temp <= A ;
	first : FA port map (A_temp(0), B_temp(0),cin(0),AdderSubOut(0),cin(1));
	rest : for i in 1 to Dwidth-1 generate
		chain : FA port map (A_temp(i), B_temp(i),cin(i),AdderSubOut(i),cin(i +1));
	end generate rest;
	
		
	with ALUFN select
		ALUout <= (A and B) 	when "0010",
		          (A or B)  	when "0011",
			      (A xor B) 	when "0100",
			       AdderSubOut  when "0000",
			       AdderSubOut  when "0001",
				   B_temp		when "1111", -- C=B
			       unaffected 	when others;
	
	
	C <= ALUout ;
	Cflag <=  cin(Dwidth)when ALUFN = "0000" or ALUFN = "0001" else '0' ;
	Zflag <= '1' when ALUout = ZERO_VEC else '0' ;
	Nflag <= ALUout(Dwidth-1);

end behav;

