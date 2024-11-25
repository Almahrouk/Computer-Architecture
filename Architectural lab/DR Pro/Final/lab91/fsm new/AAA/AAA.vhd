
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY AAA IS
  PORT( ----------------------------------->Clock & Reset:
        Ck:    IN std_logic;
        Reset: IN std_logic;
        ----------------------------------->Inputs:
        i_IN:  IN std_logic;
        ----------------------------------->Outputs:
        o_OUT: OUT std_logic
        -------------------------------------------
        );
END AAA;

ARCHITECTURE behavioral OF AAA IS       -- (Behavioral Description)
  TYPE states is ( state_a,
                   state_b,
                   state_c,
                   state_d
               );
  SIGNAL State,  Next_State: states;
BEGIN

  -- Next State Combinational Logic ----------------------------------
  FSM: process( State, i_IN )
  begin
    CASE State IS
      when state_a =>
                 if (i_IN = '1') then
                   Next_State <= state_b;
                 else
                   Next_State <= state_a;
                 end if;
      when state_b =>
                 if (i_IN = '1') then
                   Next_State <= state_c;
                 else
                   Next_State <= state_b;
                 end if;
      when state_c =>
                 if (i_IN = '1') then
                   Next_State <= state_d;
                 else
                   Next_State <= state_c;
                 end if;
      when state_d =>
                 Next_State <= state_a;
      when OTHERS =>
                 Next_State <= state_d;
    END case;
  end process;

  -- State Register --------------------------------------------------
  REG: process( Ck, Reset )
  begin
    if (Reset = '0') then
              State <= state_d;
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
                 o_OUT <= '1';
      when state_b =>
                 o_OUT <= '1';
      when state_c =>
                 o_OUT <= '1';
      when OTHERS =>
                 o_OUT <= '0';
    END case;
  end process;

END behavioral;
