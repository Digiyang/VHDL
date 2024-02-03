library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity m_mem is
    Port ( clk : in  STD_LOGIC;
			  clkenable: in boolean;
           reset : in  STD_LOGIC;
           ab : in  STD_LOGIC;
           ionm : in  STD_LOGIC;
           rnw : in  STD_LOGIC;
           db : inout  STD_LOGIC_VECTOR (1 downto 0);
           memled : out  STD_LOGIC_VECTOR (1 downto 0));
end m_mem;

architecture Behavioral of m_mem is
signal reg1: std_logic_vector(1 downto 0);
signal reg0: std_logic_vector(1 downto 0);
begin
process(clk, reset)
begin
	if reset = '1' then
		reg0 <= "01";
		reg1 <= "00";
		db <= "ZZ";
	elsif rising_edge(clk) then
	if clkenable then
	 if ionm = '0'  then
		if rnw = '0' then
			if ab = '0' then
			 reg0 <= db;
			else 
			 reg1 <= db;
			end if;
			db <= "ZZ";
		else
			if ab = '0' then
			 db <= reg0;
			else 
			 db <= reg1;
			end if;
		end if;
	 else
		db <= "ZZ";
	 end if;
	end if;
	end if;
end process;
memled <= reg0;
end Behavioral;

