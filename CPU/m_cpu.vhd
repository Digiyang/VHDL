
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity m_cpu is
    Port ( clk : in  STD_LOGIC;
			  clkenable: in boolean;
           reset : in  STD_LOGIC;
           rnwin : in  STD_LOGIC;
           ionmin : in  STD_LOGIC;
           abin : in  STD_LOGIC;
           ab : out  STD_LOGIC;
           db : inout  STD_LOGIC_VECTOR (1 downto 0);
           rnw : out  STD_LOGIC;
           ionm : out  STD_LOGIC;
           cpuled : out  STD_LOGIC_VECTOR (1 downto 0));
end m_cpu;

architecture Behavioral of m_cpu is
signal reg: std_logic_vector(1 downto 0);
begin
process(clk, reset)
begin
	if reset = '1' then
		reg <= "00";
		db <= "ZZ";
	elsif rising_edge(clk) then
	 if clkenable then
		if rnwin = '1' then
			reg <= db;
			db <= "ZZ";
		else
			db <= reg;
		end if;
	 end if;
	end if;
end process;
cpuled <= reg;
ab <= abin;
ionm <= ionmin;
rnw <= rnwin;
end Behavioral;

