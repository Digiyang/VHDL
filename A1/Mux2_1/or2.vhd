-- Moez Rjiba
entity or_2 is
	port( d, e: in bit;
			r2: out bit);
end or_2;

architecture arch of or_2 is
begin
	r2 <= d or e;
end arch;