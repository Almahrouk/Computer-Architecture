LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.all;


ENTITY aaa IS
  PORT( 
    --------------------------------------> Inputs:
    ia:           IN  std_logic;
    ib:           IN  std_logic;
    ic:           IN  std_logic;
    --------------------------------------> Outputs:
    oled0:        OUT std_logic 
    ------------------------------------------------------
    );
END aaa;


ARCHITECTURE structural OF aaa IS 

  ----------------------------------------> Components:
  COMPONENT AND2_gate IS
    PORT( I0,I1: IN std_logic;
          O: OUT std_logic );
  END COMPONENT;
  --
  COMPONENT OR3_gate IS
    PORT( I0,I1,I2: IN std_logic;
          O: OUT std_logic );
  END COMPONENT;
  --
  COMPONENT EXOR2_gate IS
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


BEGIN -- structural

  ----------------------------------------> Input:
  S001 <= ia;
  S003 <= ib;
  S002 <= ic;

  ----------------------------------------> Output:
  oled0 <= S007;

  ----------------------------------------> Component Mapping:
  C001: AND2_gate PORT MAP ( S001, S002, S004 );
  C003: OR3_gate PORT MAP ( S005, S004, S006, S007 );
  C004: OR3_gate PORT MAP ( S003, S001, S002, S006 );
  C041: EXOR2_gate PORT MAP ( S001, S003, S005 );

END structural;
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


--------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

ENTITY OR3_gate IS
  PORT( I0,I1,I2: IN std_logic;
        O: OUT std_logic );
END OR3_gate;

--------------------------------------------------------------------
ARCHITECTURE behavioral OF OR3_gate IS
BEGIN
  O <= (I0 or I1 or I2);
END behavioral;


--------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

ENTITY EXOR2_gate IS
  PORT( I0,I1: IN std_logic;
        O: OUT std_logic );
END EXOR2_gate;

--------------------------------------------------------------------
ARCHITECTURE behavioral OF EXOR2_gate IS
BEGIN
  O <= (I0 xor I1);
END behavioral;



