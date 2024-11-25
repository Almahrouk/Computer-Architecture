
-- Flip-flop is the basic component in 
-- sequential logic design
-- we assign input signal to the output 
-- at the clock rising edge 
---------------------------------------------

library ieee ;
use ieee.std_logic_1164.all;
use work.all;

---------------------------------------------

entity D2FF is
	port(	
		data_in:	in std_logic;
		clock:		in std_logic;
		data_out:	out std_logic
	);
end D2FF;

----------------------------------------------

architecture behv of D2FF is begin
    process(data_in, clock) begin
        -- clock rising edge
		if (clock='1' and clock'event) then
			data_out <= data_in;
		end if;
    end process;	
end behv;

----------------------------------------------