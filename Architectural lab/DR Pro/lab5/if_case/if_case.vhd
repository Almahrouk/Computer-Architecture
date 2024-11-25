Library IEEE;
Use IEEE.Std_logic_1164.ALL;

Entity if_case is
	PORT ( 
		a, b, c, d : IN Std_logic;
		Sel        : IN Std_logic_VECTOR(1 DOWNTO 0);
		y, z       : OUT Std_logic);
END if_case;

Architecture logic of if_case is Begin
	process(a, b, c, d, sel) Begin
		IF sel="00" THEN
			Y <= a;
		ELSIF sel="01" THEN
			Y <= b;
		ELSIF sel="10" THEN
			Y <= c;
		Else
			Y <= d;
		End if;
	END PROCESS;
	
	process(a, b, c, d, sel) Begin
	   CASE sel IS
		When "00" => z <= a;
		When "01" => z <= b;
		When "10" => z <= c;
		When "11" => z <= d;
		When others => z <= '0';
	   End case;
	END PROCESS ;
	
END logic;
