-- Moez Rjiba
entity mux21_tb is
end mux21_tb;

architecture tb of mux21_tb is
	component mux21
	port(IA, IB, S, EN, Soll: in bit;
		  Y1, Y2, Y3, Y4: inout bit;
		  valid: out bit);
	end component;
	
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
	
	signal IA: bit :='0';
	signal IB: bit :='0';
	signal S: bit :='0';
	signal EN: bit :='0';
	signal Y1: bit;
	signal Y2: bit;
	signal Y3: bit;
	signal Y4: bit;
	signal Soll: bit;
	signal valid: bit;

	
	begin
		dut: mux21
		port map (  IA => IA,
						IB => IB,
						S => S,
						EN => EN,
						Y1 => Y1,
						Y2 => Y2,
						Y3 => Y3,
						Y4 => Y4,
						Soll => Soll,
						valid => valid
		);
	
IA <= '0' after 0ns, '1' after 40ns, '0' after 80ns, '1' after 120ns, '0' after 160ns, '1' after 200ns, '0' after 240ns, '1' after 280ns,
		'0' after 320ns, '1' after 360ns, '0' after 400ns, '1' after 440ns, '0' after 480ns, '1' after 520ns, '0' after 560ns, '1' after 600ns;
IB <= '0' after 0ns, '1' after 80ns, '0' after 160ns, '1' after 240ns, '0' after 320ns, '1' after 400ns, '0' after 480ns, '1' after 560ns;
S  <= '0' after 0ns, '1' after 160ns, '0' after 320ns, '1' after 480ns;
EN <= '0' after 0ns, '1' after 320ns;
Soll <= '0' after 0ns, '1' after 40ns, '0' after 80ns, '1' after 120ns, '0' after 160ns, '1' after 240ns, '0' after 320ns;

-- valid <= ((((Soll xor Y1) or (Soll xor Y2)) or (Soll xor Y3)) or (Soll xor Y4));

end tb;