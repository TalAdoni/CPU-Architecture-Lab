library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
--------------------------------------------------------------
entity DataPath is
generic( Dwidth: integer:=16;
		 Awidth: integer:=6;
		 dept:   integer:=64);
port(	clk,:  in std_logic;	
		--ProgMemSignals
		WrEnProgMem:    	in std_logic;
		dataInProgMem:		in std_logic_vector(Dwidth-1 downto 0);
		WriteAddrProgMem:   in std_logic_vector(Awidth-1 downto 0);
		
);
end DataPath;
--------------------------------------------------------------
architecture behav of DataPath is

-- Program Memory --
signal dataOutProgMem  : std_logic_vector(Dwidth-1 downto 0);
signal readAddrProgMem : std_logic_vector(Awidth-1 downto 0) := "000000";










----------------------------------------- PORT MAPS --------------------------------------------
-- ProgMem port(clk,memEn, WmemData, WmemAddr,RmemAddr, RmemData):
ProgMemPorts:ProgMem generic map(Dwidth, Awidth, dept) port map(clk,WrEnProgMem, dataInProgMem, WriteAddrProgMem,readAddrProgMem, dataOutProgMem);
