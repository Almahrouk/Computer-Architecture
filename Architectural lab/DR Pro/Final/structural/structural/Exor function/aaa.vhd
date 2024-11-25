

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.all;


ENTITY aaa IS
  PORT( 
    --------------------------------------> Inputs:
    iA:           IN  std_logic;
    iB:           IN  std_logic;
    --------------------------------------> Outputs:
    ooF:          OUT std_logic 
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
  --
  COMPONENT OR2_gate IS
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
  S003 <= iA;
  S002 <= iB;

  ----------------------------------------> Output:
  ooF <= S007;

  ----------------------------------------> Component Mapping:
  C004: AND2_gate PORT MAP ( S003, S001, S005 );
  C005: AND2_gate PORT MAP ( S004, S002, S006 );
  C006: OR2_gate PORT MAP ( S005, S006, S007 );
  C007: NOT_gate PORT MAP ( S003, S004 );
  C012: NOT_gate PORT MAP ( S002, S001 );

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


--------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

ENTITY OR2_gate IS
  PORT( I0,I1: IN std_logic;
        O: OUT std_logic );
END OR2_gate;

--------------------------------------------------------------------
ARCHITECTURE behavioral OF OR2_gate IS
BEGIN
  O <= (I0 or I1);
END behavioral;

