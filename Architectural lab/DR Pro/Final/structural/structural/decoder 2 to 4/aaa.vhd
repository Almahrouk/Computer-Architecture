LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.all;


ENTITY aaa IS
  PORT( 
    --------------------------------------> Inputs:
    iS1:          IN  std_logic;
    iS0:          IN  std_logic;
    --------------------------------------> Outputs:
    oL0:          OUT std_logic;
    oL1:          OUT std_logic;
    oL2:          OUT std_logic;
    oL3:          OUT std_logic 
    ------------------------------------------------------
    );
END aaa;


ARCHITECTURE structural OF aaa IS 

  ----------------------------------------> Components:
  COMPONENT NOT_gate IS
    PORT( I: IN std_logic;
          O: OUT std_logic );
  END COMPONENT;
  --
  COMPONENT AND2_gate IS
    PORT( I0,I1: IN std_logic;
          O: OUT std_logic );
  END COMPONENT;

  ----------------------------------------> Signals:
  SIGNAL S001: std_logic;
  SIGNAL S002: std_logic;
  SIGNAL S003: std_logic;
  SIGNAL S004: std_logic;
  SIGNAL S005: std_logic;
  SIGNAL S006: std_logic;
  SIGNAL S007: std_logic;
  SIGNAL S008: std_logic;


BEGIN -- structural

  ----------------------------------------> Input:
  S004 <= iS1;
  S001 <= iS0;

  ----------------------------------------> Output:
  oL0 <= S005;
  oL1 <= S006;
  oL2 <= S007;
  oL3 <= S008;

  ----------------------------------------> Component Mapping:
  C072: NOT_gate PORT MAP ( S004, S003 );
  C073: NOT_gate PORT MAP ( S001, S002 );
  C141: AND2_gate PORT MAP ( S003, S002, S005 );
  C142: AND2_gate PORT MAP ( S001, S003, S006 );
  C143: AND2_gate PORT MAP ( S002, S004, S007 );
  C144: AND2_gate PORT MAP ( S004, S001, S008 );

END structural;



library ieee;
use ieee.std_logic_1164.all;

ENTITY NOT_gate IS
  PORT( I: IN std_logic;
  	O: OUT std_logic );
END NOT_gate;

--------------------------------------------------------------------
ARCHITECTURE behavioral OF NOT_gate IS
BEGIN
  O <= (not I);
END behavioral;



--------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

ENTITY AND2_gate IS
  PORT( I0,I1: IN std_logic;
        O: OUT std_logic );
END AND2_gate;

--------------------------------------------------------------------
ARCHITECTURE behavioral OF AND2_gate IS
BEGIN
  O <= (I0 and I1);
END behavioral;

