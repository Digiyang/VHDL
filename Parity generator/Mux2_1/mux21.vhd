-- Moez Rjiba
library ieee;
use ieee.std_logic_1164.all;

entity mux21 is
	port(IA, IB, S , EN, Soll: in bit;
			Y1, Y2, Y3, Y4: inout bit;
			valid: out bit
			);
end mux21;

architecture arch of mux21 is

	component negation
		port( n: in bit;
				r1: out bit);
	end component;
	
	component and_3
		port( a, b, c: in bit;
				r3: out bit);
	end component;
	
	component or_2
		port( d, e: in bit;
				r2: out bit);
	end component;
	
	signal s1, s2, s3, s4: bit;
	
begin
	Y1 <= (IA and not EN and not S) or (IB and not EN and S);
	--Process(Y1,valid)
	--begin
		--if (valid xor Y1) = '0'
			--then Soll <= '1';
		--else
		--Soll <= '0';
		--end if;
	--end process;
------------------------------------------------------------
	with S select
	Y2 <= (IA and not EN) when '0', (IB and not EN) when '1';
------------------------------------------------------------
	Y3 <= (IA and not EN) when S = '0' else (IB and not EN);
------------------------------------------------------------
	-- Structural Programming
	u1: negation port map(EN, s1);
	u2: negation port map(S, s2);
	u3: and_3 port map(IA, s1, s2, s3);
	u4: and_3 port map(IB, s1, S, s4);
	u5: or_2 port map(s3, s4, Y4);
	
	valid <= ((((Soll xor Y1) or (Soll xor Y2)) or (Soll xor Y3)) or (Soll xor Y4));
	
end arch;