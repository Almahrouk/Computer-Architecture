LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.all;


ENTITY aaa IS
  PORT( 
    --------------------------------------> Inputs:
    iOp_A:        IN  std_logic_vector( 3 downto 0 );
    iOp_B:        IN  std_logic_vector( 3 downto 0 );
    iOp_C:        IN  std_logic_vector( 3 downto 0 );
    ici:          IN  std_logic;
    --------------------------------------> Outputs:
    oResult:      OUT std_logic_vector( 3 downto 0 );
    oEqual:       OUT std_logic;
    oCarry:       OUT std_logic;
    oOvF:         OUT std_logic 
    ------------------------------------------------------
    );
END aaa;


ARCHITECTURE structural OF aaa IS 

  ----------------------------------------> Components:
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
  --
  COMPONENT Compar_4 IS
    PORT( A3:  IN  std_logic;
          A2:  IN  std_logic;
          A1:  IN  std_logic;
          A0:  IN  std_logic;
          B3:  IN  std_logic;
          B2:  IN  std_logic;
          B1:  IN  std_logic;
          B0:  IN  std_logic;
          MIN: OUT std_logic;
          EQU: OUT std_logic;
          MAJ: OUT std_logic );
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
  SIGNAL S020: std_logic;

  ----------------------------------------> Not Connected Pins:
  SIGNAL ncp9_C001: std_logic;
  SIGNAL ncp11_C001: std_logic;


BEGIN -- structural

  ----------------------------------------> Input:
  S004 <= iOp_A(0);
  S003 <= iOp_A(1);
  S002 <= iOp_A(2);
  S001 <= iOp_A(3);
  S005 <= iOp_B(0);
  S006 <= iOp_B(1);
  S007 <= iOp_B(2);
  S008 <= iOp_B(3);
  S019 <= iOp_C(0);
  S018 <= iOp_C(1);
  S017 <= iOp_C(2);
  S016 <= iOp_C(3);
  S014 <= ici;

  ----------------------------------------> Output:
  oResult(0) <= S012;
  oResult(1) <= S011;
  oResult(2) <= S010;
  oResult(3) <= S009;
  oEqual <= S013;
  oCarry <= S015;
  oOvF <= S020;

  ----------------------------------------> Component Mapping:
  C001: Compar_4 PORT MAP ( S016, S017, S018, S019, S009, S010, 
                            S011, S012, ncp9_C001, S013, ncp11_C001 );
  C101: Adder_4 PORT MAP ( S014, S015, S020, S001, S002, S003, 
                           S004, S008, S007, S006, S005, S009, 
                           S010, S011, S012 );

END structural;
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


--------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY Compar_4 IS
  PORT( A3:  IN  std_logic;
        A2:  IN  std_logic;
        A1:  IN  std_logic;
        A0:  IN  std_logic;
        B3:  IN  std_logic;
        B2:  IN  std_logic;
        B1:  IN  std_logic;
        B0:  IN  std_logic;
        MIN: OUT std_logic;
        EQU: OUT std_logic;
        MAJ: OUT std_logic );
END Compar_4;

--------------------------------------------------------------------
ARCHITECTURE behavioral OF Compar_4 IS
BEGIN
  Cmp4: PROCESS( A3, A2, A1, A0,
                 B3, B2, B1, B0 )
  variable A: unsigned( 3 downto 0 );
  variable B: unsigned( 3 downto 0 );
  BEGIN
    A := (A3 & A2 & A1 & A0);
    B := (B3 & B2 & B1 & B0);
    --
    if    (A > B) then MIN <= '0'; EQU <= '0'; MAJ <= '1';
    elsif (A < B) then MIN <= '1'; EQU <= '0'; MAJ <= '0';
    elsif (A = B) then MIN <= '0'; EQU <= '1'; MAJ <= '0';
    else               MIN <= 'X'; EQU <= 'X'; MAJ <= 'X';
    END IF;
  END PROCESS;
END behavioral;



