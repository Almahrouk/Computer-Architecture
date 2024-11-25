LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY AAA IS
  PORT( I, Ck, Reset: IN std_logic;
        O:            OUT std_logic );
END AAA;

ARCHITECTURE behavioral OF AAA IS 
  TYPE states is ( A, B, C, D, E);
  SIGNAL State, Next_State: states;
BEGIN
  FSM: process( State, I ) begin
    CASE State IS
      when A =>
         if (i_IN = '1') then Next_State <= B;
         else Next_State <= A;
         end if;
      when B =>
         if (i_IN = '1') then Next_State <= C;
         else Next_State <= B;
         end if;
      when C =>
         if (i_IN = '1') then Next_State <= E;
         else Next_State <= D;
         end if;
      when D => Next_State <= B;
      when E => Next_State <= A;
      when OTHERS => Next_State <= A;
    END case;
  end process;
  REG: process( Ck, Reset ) begin
    if (Reset = '0') then State <= A;
    elsif rising_edge(Ck) then State <= Next_State;
    end if;
  end process;
  OUTPUTS: process( State, I ) begin
    o_OUT <= '0';
    CASE State IS
      when A => O <= '1';
      when C => O <= '1';
      when D => O <= '1';
      when E => O <= '1';
      when OTHERS => O <= '0';
    END case;
  end process;
END behavioral;