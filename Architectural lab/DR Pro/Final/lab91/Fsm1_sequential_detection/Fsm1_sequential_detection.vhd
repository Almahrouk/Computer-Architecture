

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Fsm1_sequential_detection IS
  PORT( ----------------------------------->Clock & Reset:
        Ck:    IN std_logic;
        Reset: IN std_logic;
        ----------------------------------->Inputs:
        i_X:   IN std_logic;
        ----------------------------------->Outputs:
        o_Y:   OUT std_logic
        -------------------------------------------
        );
END Fsm1_sequential_detection;

ARCHITECTURE behavioral OF Fsm1_sequential_detection IS       -- (Behavioral Description)
  TYPE states is ( state_a,
                   state_b,
                   state_c,
                   state_d
                  );
  SIGNAL State,
         Next_State: states;
BEGIN

  -- Next State Combinational Logic ----------------------------------
  FSM: process( State, i_X )
  begin
    CASE State IS
      when state_a =>
                 if (i_X = '1') then
                   Next_State <= state_b;
                 else
                   Next_State <= state_a;
                 end if;
      when state_b =>
                 if (i_X = '1') then
                   Next_State <= state_c;
                 else
                   Next_State <= state_a;
                 end if;
      when state_c =>
                 if (i_X = '1') then
                   Next_State <= state_c;
                 else
                   Next_State <= state_d;
                 end if;
      when state_d =>
                 if (i_X = '1') then
                   Next_State <= state_b;
                 else
                   Next_State <= state_a;
                 end if;
      when OTHERS =>
                 Next_State <= state_a;
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
  OUTPUTS: process( State, i_X )
  begin
    -- Set output defaults:
    o_Y <= '0';

    -- Set output as function of current state and input:
    CASE State IS
      when state_d =>
                 if (i_X = '0') then
                   o_Y <= '1';
                 end if;
      when OTHERS =>
                 o_Y <= '0';
    END case;
  end process;

END behavioral;
