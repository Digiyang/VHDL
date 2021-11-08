-- Moez Rjiba
entity and_3 is 
	port( a, b, c: in bit;
			r3: out bit
			);
end and_3;

architecture arch of and_3 is
begin
	r3 <= a and b and c;
end arch;