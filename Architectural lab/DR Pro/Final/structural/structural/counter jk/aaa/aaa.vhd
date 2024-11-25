LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.all;


ENTITY aaa IS
  PORT( 
    --------------------------------------> Inputs:
    ia:           IN  std_logic;
    iclk:         IN  std_logic;
    inReset:      IN  std_logic;
    inReset_0:    IN  std_logic 
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
  COMPONENT NOR2_gate IS
    PORT( I0,I1: IN std_logic;
          O: OUT std_logic );
  END COMPONENT;
  --
  COMPONENT JKpetFF IS
    PORT( J, K, Ck: IN std_logic;
          nCL, nPR: IN std_logic;
          Q, nQ   : OUT std_logic );
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
  SIGNAL S009: std_logic;
  SIGNAL S010: std_logic;
  SIGNAL S011: std_logic;

  ----------------------------------------> Not Connected Pins:
  SIGNAL ncp7_C003: std_logic;


BEGIN -- structural

  ----------------------------------------> Input:
  S007 <= ia;
  S005 <= iclk;
  S010 <= inReset;
  S011 <= inReset_0;

  ----------------------------------------> Component Mapping:
  C002: JKpetFF PORT MAP ( S004, S009, S005, S010, S011, S001, 
                           S008 );
  C003: JKpetFF PORT MAP ( S007, S006, S005, S010, S011, S002, 
                           ncp7_C003 );
  C006: NOT_gate PORT MAP ( S007, S003 );
  C007: AND2_gate PORT MAP ( S003, S002, S004 );
  C008: AND2_gate PORT MAP ( S007, S002, S009 );
  C043: NOR2_gate PORT MAP ( S008, S007, S006 );

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

ENTITY NOR2_gate IS
  PORT( I0,I1: IN std_logic;
        O: OUT std_logic );
END NOR2_gate;

--------------------------------------------------------------------
ARCHITECTURE behavioral OF NOR2_gate IS
BEGIN
  O <= (not (I0 or I1));
END behavioral;


--------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

ENTITY JKpetFF IS
  PORT(  J, K, Ck: IN std_logic;
         nCL, nPR: IN std_logic;
         Q, nQ   : OUT std_logic );
END JKpetFF;

ARCHITECTURE behavioral OF JKpetFF IS 
BEGIN
  JKff: PROCESS( Ck, nCL, nPR )
    variable  OutQ: STD_LOGIC;
  BEGIN
    if    (nCL = '0') and (nPR = '1') then  OutQ := '0';  -- Do Clear
    elsif (nCL = '1') and (nPR = '0') then  OutQ := '1';  -- Do Set
    elsif (nCL = '1') and (nPR = '1') then -- A Prosses Do
      if (Ck'event) AND (Ck='1') THEN -- or rising edge 
        -- Positive Edge
        if    (J = '0') AND (K = '1') THEN  OutQ := '0';
        elsif (J = '1') AND (K = '0') THEN  OutQ := '1';
        elsif (J = '1') AND (K = '1') THEN  OutQ := not OutQ;
        elsif not((J='0')AND(K='0'))  THEN  OutQ := 'X';
        END IF;
      END IF;
    else                                    OutQ := 'X';
    END IF;
    --
    Q  <= (    OutQ);
    nQ <= (not OutQ);
    --
  END PROCESS;
END behavioral;