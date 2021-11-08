-- Moez Rjiba
entity negation is
	port( n: in bit;
			r1: out bit);
end negation;

architecture arch of negation is
begin
	r1 <= not n;
end arch;