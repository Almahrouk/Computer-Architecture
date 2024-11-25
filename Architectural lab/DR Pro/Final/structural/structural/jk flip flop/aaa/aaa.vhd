LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.all;


ENTITY aaa IS
  PORT( 
    --------------------------------------> Inputs:
    iJ:           IN  std_logic;
    iK:           IN  std_logic;
    inClear:      IN  std_logic;
    inPreset:     IN  std_logic;
    --------------------------------------> Outputs:
    oQ:           OUT std_logic;
    onQ:          OUT std_logic 
    ------------------------------------------------------
    );
END aaa;


ARCHITECTURE structural OF aaa IS 

  ----------------------------------------> Components:
  COMPONENT NAND3_gate IS
    PORT( I0,I1,I2: IN std_logic;
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
  S005 <= iJ;
  S006 <= iK;
  S003 <= inClear;
  S004 <= inPreset;

  ----------------------------------------> Output:
  oQ <= S002;
  onQ <= S001;

  ----------------------------------------> Component Mapping:
  C216: NAND3_gate PORT MAP ( S003, S001, S005, S007 );
  C217: NAND3_gate PORT MAP ( S004, S006, S002, S008 );
  C218: NAND3_gate PORT MAP ( S004, S007, S001, S002 );
  C219: NAND3_gate PORT MAP ( S003, S002, S008, S001 );

END structural;

library ieee;
use ieee.std_logic_1164.all;

ENTITY NAND3_gate IS
  PORT( I0,I1,I2: IN std_logic;
        O: OUT std_logic );
END NAND3_gate;

--------------------------------------------------------------------
ARCHITECTURE behavioral OF NAND3_gate IS
BEGIN
  O <= (not (I0 and I1 and I2));
END behavioral;




