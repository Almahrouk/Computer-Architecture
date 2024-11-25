
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY AAA IS
  PORT( ----------------------------------->Clock & Reset:
        Ck:    IN std_logic;
        Reset: IN std_logic;
        ----------------------------------->Inputs:
        i_DIR: IN std_logic;
        ----------------------------------->Outputs:
        o_A:   OUT std_logic;
        o_B:   OUT std_logic
        -------------------------------------------
        );
END AAA;

ARCHITECTURE behavioral OF AAA IS       -- (Behavioral Description)
  TYPE states is ( state_a,
                   state_b,
                   state_c,
                   state_d );
  SIGNAL State,
         Next_State: states;
BEGIN

  -- Next State Combinational Logic ----------------------------------
  FSM: process( State, i_DIR )
  begin
    CASE State IS
      when state_a =>
                 if (i_DIR = '1') then
                   Next_State <= state_b;
                 else
                   Next_State <= state_d;
                 end if;
      when state_b =>
                 if (i_DIR = '1') then
                   Next_State <= state_c;
                 else
                   Next_State <= state_a;
                 end if;
      when state_c =>
                 if (i_DIR = '1') then
                   Next_State <= state_d;
                 else
                   Next_State <= state_b;
                 end if;
      when state_d =>
                 if (i_DIR = '1') then
                   Next_State <= state_a;
                 else
                   Next_State <= state_c;
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
  OUTPUTS: process( State, i_DIR )
  begin
    -- Set output defaults:
    o_A <= '0';
    o_B <= '0';

    -- Set output as function of current state and input:
    CASE State IS
      when state_b =>
                 o_A <= '1';
      when state_c =>
                 o_B <= '1';
      when state_d =>
                 o_A <= '1';
                 o_B <= '1';
      when OTHERS =>
                 o_A <= '0';
                 o_B <= '0';
    END case;
  end process;

END behavioral;
