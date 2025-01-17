library IEEE;
use IEEE.Std_logic_1164.ALL;

ENTITY cmpl_sig IS 
	PORT ( 
	A, B, sel : IN Std_logic;
	X, y, Z : OUT Std_logic
	);
END cmpl_sig;

ARCHITECTURE logic OF cmpl_sig IS Begin

	-- Simple signal assignment
	X <= (a AND NOT sel) OR (b AND sel);
	
	-- Conditional signal assignment
	Y <= a WHEN sel='0' ELSE B;
	
	-- Selected signal assignment
	WITH sel SELECT Z <= 
		a WHEN '0',
		B WHEN '1',
		'0' when others;
END logic;
