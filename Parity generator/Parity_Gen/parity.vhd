-- Moez Rjiba
library ieee;
use ieee.std_logic_1164.all;

entity parity is
	port( a:  in std_logic_vector (127 downto 0);
			even_odd: in std_logic;
			b: out std_logic_vector (127 downto 0);
			p: out std_logic
			);
end parity;

architecture arch of parity is
	 signal parity_calc: std_logic_vector(128 downto 0); -- Zwischenergebnisse
begin
	process(a, parity_calc)
	begin
	parity_calc(0) <= even_odd; 
	for i in 0 to 127 loop
		parity_calc(i+1) <= parity_calc(i) xor a(i);
	end loop;
	end process;
	b <= a;
	p <= parity_calc(128);
end arch;