LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.all;


ENTITY aaa IS
  PORT( 
    --------------------------------------> Inputs:
    inSet:        IN  std_logic;
    inReset:      IN  std_logic;
    --------------------------------------> Outputs:
    oQA:          OUT std_logic;
    oQB:          OUT std_logic 
    ------------------------------------------------------
    );
END aaa;


ARCHITECTURE structural OF aaa IS 

  ----------------------------------------> Components:
  COMPONENT NAND2_gate IS
    PORT( I0,I1: IN std_logic;
          O: OUT std_logic );
  END COMPONENT;

  ----------------------------------------> Signals:
  SIGNAL S001: std_logic;
  SIGNAL S002: std_logic;
  SIGNAL S003: std_logic;
  SIGNAL S004: std_logic;


BEGIN -- structural

  ----------------------------------------> Input:
  S003 <= inSet;
  S004 <= inReset;

  ----------------------------------------> Output:
  oQA <= S002;
  oQB <= S001;

  ----------------------------------------> Component Mapping:
  C026: NAND2_gate PORT MAP ( S003, S001, S002 );
  C027: NAND2_gate PORT MAP ( S002, S004, S001 );

END structural;
library ieee;
use ieee.std_logic_1164.all;

ENTITY NAND2_gate IS
  PORT( I0,I1: IN std_logic;
        O: OUT std_logic );
END NAND2_gate;

--------------------------------------------------------------------
ARCHITECTURE behavioral OF NAND2_gate IS
BEGIN
  O <= (not (I0 and I1));
END behavioral;
