
-- Flip-flop is the basic component in 
-- sequential logic design
-- we assign input signal to the output 
-- at the clock rising edge 
---------------------------------------------

library ieee ;
use ieee.std_logic_1164.all;
use work.all;

---------------------------------------------

entity d_rising_edge is
	port(	
		data_in:	in std_logic;
		clock:		in std_logic;
		data_out:	out std_logic
	);
end d_rising_edge;

----------------------------------------------

architecture behv of d_rising_edge is begin
    process(clock) begin
        -- clock rising edge
		if rising_edge(clock)   then
			data_out <= data_in;
		end if;
    end process;	
end behv;

----------------------------------------------