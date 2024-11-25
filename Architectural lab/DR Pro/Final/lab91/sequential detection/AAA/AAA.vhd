
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY aaa IS
  PORT( ----------------------------------->Clock & Reset:
        Ck:    IN std_logic;
        Reset: IN std_logic;
        ----------------------------------->Inputs:
        i_IN:  IN std_logic;
        ----------------------------------->Outputs:
        o_OUT: OUT std_logic
        -------------------------------------------
        );
END aaa;

ARCHITECTURE behavioral OF aaa IS       -- (Behavioral Description)
  TYPE states is ( state_a,
                   state_c );
  SIGNAL State,
         Next_State: states;
BEGIN

  -- Next State Combinational Logic ----------------------------------
  FSM: process( State, i_IN )
  begin
    CASE State IS
      when state_a =>
                 if (i_IN = '1') then
                   Next_State <= state_c;
                 else
                   Next_State <= state_a;
                 end if;
      when state_c =>
                 if (i_IN = '1') then
                   Next_State <= state_c;
                 else
                   Next_State <= state_a;
                 end if;
    END case;
  end process;

  -- State Register --------------------------------------------------
  REG: process( Ck, Reset )
  begin
    if (Reset = '0') then
              State <= state_a;
    elsif rising_edge(Ck) then
              State <= Next_State;
       end if;
  end process;

  -- Outputs Combinational Logic -----------------------------------
  OUTPUTS: process( State, i_IN )
  begin
    -- Set output defaults:
    o_OUT <= '0';

    -- Set output as function of current state and input:
    CASE State IS
      when state_a =>
                 if (i_IN = '1') then
                   o_OUT <= '1';
                 end if;
      when state_c =>
                 if (i_IN = '0') then
                   o_OUT <= '1';
                 end if;
    END case;
  end process;

END behavioral;
