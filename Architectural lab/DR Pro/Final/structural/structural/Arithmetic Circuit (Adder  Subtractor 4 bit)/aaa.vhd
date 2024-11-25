LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.all;


ENTITY aaa IS
  PORT( 
    --------------------------------------> Inputs:
    iOp_A:        IN  std_logic_vector( 3 downto 0 );
    iOp_B:        IN  std_logic_vector( 3 downto 0 );
    iSb_nAd:      IN  std_logic;
    --------------------------------------> Outputs:
    oResult:      OUT std_logic_vector( 3 downto 0 );
    oCarry:       OUT std_logic;
    oOvf:         OUT std_logic 
    ------------------------------------------------------
    );
END aaa;


ARCHITECTURE structural OF aaa IS 

  ----------------------------------------> Components:
  COMPONENT EXOR2_gate IS
    PORT( I0,I1: IN std_logic;
          O: OUT std_logic );
  END COMPONENT;
  --
  COMPONENT Adder_4 IS
    PORT( CIN: IN  std_logic;
          COUT:OUT std_logic;
          OVF: OUT std_logic;
          A3:  IN  std_logic;
          A2:  IN  std_logic;
          A1:  IN  std_logic;
          A0:  IN  std_logic;
          B3:  IN  std_logic;
          B2:  IN  std_logic;
          B1:  IN  std_logic;
          B0:  IN  std_logic;
          F3:  OUT std_logic;
          F2:  OUT std_logic;
          F1:  OUT std_logic;
          F0:  OUT std_logic );
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
  SIGNAL S012: std_logic;
  SIGNAL S013: std_logic;
  SIGNAL S014: std_logic;
  SIGNAL S015: std_logic;
  SIGNAL S016: std_logic;
  SIGNAL S017: std_logic;
  SIGNAL S018: std_logic;
  SIGNAL S019: std_logic;


BEGIN -- structural

  ----------------------------------------> Input:
  S009 <= iOp_A(0);
  S010 <= iOp_A(1);
  S011 <= iOp_A(2);
  S012 <= iOp_A(3);
  S003 <= iOp_B(0);
  S002 <= iOp_B(1);
  S001 <= iOp_B(2);
  S004 <= iOp_B(3);
  S018 <= iSb_nAd;

  ----------------------------------------> Output:
  oResult(0) <= S016;
  oResult(1) <= S015;
  oResult(2) <= S014;
  oResult(3) <= S013;
  oCarry <= S017;
  oOvf <= S019;

  ----------------------------------------> Component Mapping:
  C085: EXOR2_gate PORT MAP ( S018, S004, S008 );
  C086: EXOR2_gate PORT MAP ( S018, S001, S005 );
  C088: EXOR2_gate PORT MAP ( S018, S002, S006 );
  C089: EXOR2_gate PORT MAP ( S018, S003, S007 );
  C193: Adder_4 PORT MAP ( S018, S017, S019, S012, S011, S010, 
                           S009, S008, S005, S006, S007, S013, 
                           S014, S015, S016 );

END structural;


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


--------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY Adder_4 IS
  PORT( CIN: IN  std_logic;
        COUT:OUT std_logic;
        OVF: OUT std_logic;
        A3:  IN  std_logic;
        A2:  IN  std_logic;
        A1:  IN  std_logic;
        A0:  IN  std_logic;
        B3:  IN  std_logic;
        B2:  IN  std_logic;
        B1:  IN  std_logic;
        B0:  IN  std_logic;
        F3:  OUT std_logic;
        F2:  OUT std_logic;
        F1:  OUT std_logic;
        F0:  OUT std_logic );
END Adder_4;

--------------------------------------------------------------------
ARCHITECTURE behavioral OF Adder_4 IS
BEGIN
  Add4: PROCESS( A3, A2, A1, A0,
                 B3, B2, B1, B0,
                 CIN )
  variable A : unsigned( 4 downto 0 );
  variable B : unsigned( 4 downto 0 );
  variable Ar: unsigned( 4 downto 0 ); --(without the sign bit)
  variable Br: unsigned( 4 downto 0 );
  variable F : unsigned( 4 downto 0 );
  BEGIN
    A := ('0'& A3 & A2 & A1 & A0);
    B := ('0'& B3 & B2 & B1 & B0);
    --
    Ar:= ('0'& '0'& A2 & A1 & A0); --(without the sign bit)
    Br:= ('0'& '0'& B2 & B1 & B0);
    --
    if    (CIN = '0') then  F := Ar + Br;
    elsif (CIN = '1') then  F := Ar + Br + 1;
    else                    F := (others =>'X');  -- (CIN: Unknown)
    END IF;
    --
    OVF  <= ((not F(3)) and (    A(3)) and (    B(3))) or
            ((    F(3)) and (not A(3)) and (not B(3)));
    COUT <= (A(3) and B(3)) or
            (A(3) and F(3)) or
            (B(3) and F(3));
    F3   <= (A(3) xor B(3)) xor F(3);
    F2   <=  F(2);
    F1   <=  F(1);
    F0   <=  F(0);
  END PROCESS;
END behavioral;



