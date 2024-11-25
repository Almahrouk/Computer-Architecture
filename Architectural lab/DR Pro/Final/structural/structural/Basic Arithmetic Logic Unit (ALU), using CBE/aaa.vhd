LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.all;


ENTITY aaa IS
  PORT( 
    --------------------------------------> Inputs:
    iB:           IN  std_logic_vector( 7 downto 0 );
    iA:           IN  std_logic_vector( 7 downto 0 );
    iS2:          IN  std_logic;
    iS1:          IN  std_logic;
    iS0:          IN  std_logic;
    --------------------------------------> Outputs:
    ooF:          OUT std_logic_vector( 7 downto 0 );
    oCO:          OUT std_logic;
    oZF:          OUT std_logic 
    ------------------------------------------------------
    );
END aaa;


ARCHITECTURE structural OF aaa IS 

  ----------------------------------------> Components:
  COMPONENT NOR8_gate IS
    PORT( I0,I1,I2,I3,I4,I5,I6,I7: IN std_logic;
          O: OUT std_logic );
  END COMPONENT;
  --
  COMPONENT BusNOT_gate_8 IS
    PORT( I07: IN std_logic;
          I06: IN std_logic;
          I05: IN std_logic;
          I04: IN std_logic;
          I03: IN std_logic;
          I02: IN std_logic;
          I01: IN std_logic;
          I00: IN std_logic;
          O07: OUT std_logic;
          O06: OUT std_logic;
          O05: OUT std_logic;
          O04: OUT std_logic;
          O03: OUT std_logic;
          O02: OUT std_logic;
          O01: OUT std_logic;
          O00: OUT std_logic );
  END COMPONENT;
  --
  COMPONENT BusAND2_gate_8 IS
    PORT( A07: IN std_logic;
          A06: IN std_logic;
          A05: IN std_logic;
          A04: IN std_logic;
          A03: IN std_logic;
          A02: IN std_logic;
          A01: IN std_logic;
          A00: IN std_logic;
          B07: IN std_logic;
          B06: IN std_logic;
          B05: IN std_logic;
          B04: IN std_logic;
          B03: IN std_logic;
          B02: IN std_logic;
          B01: IN std_logic;
          B00: IN std_logic;
          O07: OUT std_logic;
          O06: OUT std_logic;
          O05: OUT std_logic;
          O04: OUT std_logic;
          O03: OUT std_logic;
          O02: OUT std_logic;
          O01: OUT std_logic;
          O00: OUT std_logic );		  
  END COMPONENT;
  --
  COMPONENT BusOR2_gate_8 IS
    PORT( A07: IN std_logic;
          A06: IN std_logic;
          A05: IN std_logic;
          A04: IN std_logic;
          A03: IN std_logic;
          A02: IN std_logic;
          A01: IN std_logic;
          A00: IN std_logic;
          B07: IN std_logic;
          B06: IN std_logic;
          B05: IN std_logic;
          B04: IN std_logic;
          B03: IN std_logic;
          B02: IN std_logic;
          B01: IN std_logic;
          B00: IN std_logic;
          O07: OUT std_logic;
          O06: OUT std_logic;
          O05: OUT std_logic;
          O04: OUT std_logic;
          O03: OUT std_logic;
          O02: OUT std_logic;
          O01: OUT std_logic;
          O00: OUT std_logic );		  
  END COMPONENT;
  --
  COMPONENT Multiplexer_8_1 IS
          
    PORT( I0: IN  std_logic;
          I1: IN  std_logic;
          I2: IN  std_logic;
          I3: IN  std_logic;
          I4: IN  std_logic;
          I5: IN  std_logic;
          I6: IN  std_logic;
          I7: IN  std_logic;
          S2: IN  std_logic;
          S1: IN  std_logic;
          S0: IN  std_logic;
          Q: OUT std_logic );
  END COMPONENT;
  --
  COMPONENT BusMultiplexer81_8 IS
          
    PORT( Q_07: OUT std_logic;
          Q_06: OUT std_logic;
          Q_05: OUT std_logic;
          Q_04: OUT std_logic;
          Q_03: OUT std_logic;
          Q_02: OUT std_logic;
          Q_01: OUT std_logic;
          Q_00: OUT std_logic;
          I0_07: IN  std_logic;
          I0_06: IN  std_logic;
          I0_05: IN  std_logic;
          I0_04: IN  std_logic;
          I0_03: IN  std_logic;
          I0_02: IN  std_logic;
          I0_01: IN  std_logic;
          I0_00: IN  std_logic;
          I1_07: IN  std_logic;
          I1_06: IN  std_logic;
          I1_05: IN  std_logic;
          I1_04: IN  std_logic;
          I1_03: IN  std_logic;
          I1_02: IN  std_logic;
          I1_01: IN  std_logic;
          I1_00: IN  std_logic;
          I2_07: IN  std_logic;
          I2_06: IN  std_logic;
          I2_05: IN  std_logic;
          I2_04: IN  std_logic;
          I2_03: IN  std_logic;
          I2_02: IN  std_logic;
          I2_01: IN  std_logic;
          I2_00: IN  std_logic;
          I3_07: IN  std_logic;
          I3_06: IN  std_logic;
          I3_05: IN  std_logic;
          I3_04: IN  std_logic;
          I3_03: IN  std_logic;
          I3_02: IN  std_logic;
          I3_01: IN  std_logic;
          I3_00: IN  std_logic;
          I4_07: IN  std_logic;
          I4_06: IN  std_logic;
          I4_05: IN  std_logic;
          I4_04: IN  std_logic;
          I4_03: IN  std_logic;
          I4_02: IN  std_logic;
          I4_01: IN  std_logic;
          I4_00: IN  std_logic;
          I5_07: IN  std_logic;
          I5_06: IN  std_logic;
          I5_05: IN  std_logic;
          I5_04: IN  std_logic;
          I5_03: IN  std_logic;
          I5_02: IN  std_logic;
          I5_01: IN  std_logic;
          I5_00: IN  std_logic;
          I6_07: IN  std_logic;
          I6_06: IN  std_logic;
          I6_05: IN  std_logic;
          I6_04: IN  std_logic;
          I6_03: IN  std_logic;
          I6_02: IN  std_logic;
          I6_01: IN  std_logic;
          I6_00: IN  std_logic;
          I7_07: IN  std_logic;
          I7_06: IN  std_logic;
          I7_05: IN  std_logic;
          I7_04: IN  std_logic;
          I7_03: IN  std_logic;
          I7_02: IN  std_logic;
          I7_01: IN  std_logic;
          I7_00: IN  std_logic;
          S2  :  IN  std_logic;
          S1  :  IN  std_logic;
          S0  :  IN  std_logic );
  END COMPONENT;
  --
  COMPONENT Adder_8 IS
          
    PORT( CIN: IN  std_logic;
          COUT:OUT std_logic;
          OVF: OUT std_logic;
          A7:  IN  std_logic;
          A6:  IN  std_logic;
          A5:  IN  std_logic;
          A4:  IN  std_logic;
          A3:  IN  std_logic;
          A2:  IN  std_logic;
          A1:  IN  std_logic;
          A0:  IN  std_logic;
          B7:  IN  std_logic;
          B6:  IN  std_logic;
          B5:  IN  std_logic;
          B4:  IN  std_logic;
          B3:  IN  std_logic;
          B2:  IN  std_logic;
          B1:  IN  std_logic;
          B0:  IN  std_logic;
          F7:  OUT std_logic;
          F6:  OUT std_logic;
          F5:  OUT std_logic;
          F4:  OUT std_logic;
          F3:  OUT std_logic;
          F2:  OUT std_logic;
          F1:  OUT std_logic;
          F0:  OUT std_logic );
  END COMPONENT;
  --
  COMPONENT Complem_8 IS
    PORT( TWO: IN  std_logic;
          CPL: IN  std_logic;
          A7:  IN  std_logic;
          A6:  IN  std_logic;
          A5:  IN  std_logic;
          A4:  IN  std_logic;
          A3:  IN  std_logic;
          A2:  IN  std_logic;
          A1:  IN  std_logic;
          A0:  IN  std_logic;
          C7:  OUT std_logic;
          C6:  OUT std_logic;
          C5:  OUT std_logic;
          C4:  OUT std_logic;
          C3:  OUT std_logic;
          C2:  OUT std_logic;
          C1:  OUT std_logic;
          C0:  OUT std_logic );
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
  SIGNAL S021: std_logic;
  SIGNAL S022: std_logic;
  SIGNAL S023: std_logic;
  SIGNAL S024: std_logic;
  SIGNAL S025: std_logic;
  SIGNAL S026: std_logic;
  SIGNAL S027: std_logic;
  SIGNAL S028: std_logic;
  SIGNAL S029: std_logic;
  SIGNAL S030: std_logic;
  SIGNAL S031: std_logic;
  SIGNAL S032: std_logic;
  SIGNAL S033: std_logic;
  SIGNAL S034: std_logic;
  SIGNAL S035: std_logic;
  SIGNAL S036: std_logic;
  SIGNAL S037: std_logic;
  SIGNAL S038: std_logic;
  SIGNAL S039: std_logic;
  SIGNAL S040: std_logic;
  SIGNAL S041: std_logic;
  SIGNAL S042: std_logic;
  SIGNAL S043: std_logic;
  SIGNAL S044: std_logic;
  SIGNAL S045: std_logic;
  SIGNAL S046: std_logic;
  SIGNAL S047: std_logic;
  SIGNAL S048: std_logic;
  SIGNAL S049: std_logic;
  SIGNAL S050: std_logic;
  SIGNAL S051: std_logic;
  SIGNAL S052: std_logic;
  SIGNAL S053: std_logic;
  SIGNAL S054: std_logic;
  SIGNAL S055: std_logic;
  SIGNAL S056: std_logic;
  SIGNAL S057: std_logic;
  SIGNAL S058: std_logic;
  SIGNAL S059: std_logic;
  SIGNAL S060: std_logic;
  SIGNAL S061: std_logic;
  SIGNAL S062: std_logic;
  SIGNAL S063: std_logic;
  SIGNAL S064: std_logic;
  SIGNAL S065: std_logic;
  SIGNAL S066: std_logic;
  SIGNAL S067: std_logic;
  SIGNAL S068: std_logic;
  SIGNAL S069: std_logic;
  SIGNAL S070: std_logic;
  SIGNAL S071: std_logic;
  SIGNAL S072: std_logic;
  SIGNAL S073: std_logic;
  SIGNAL S074: std_logic;
  SIGNAL S075: std_logic;
  SIGNAL S076: std_logic;
  SIGNAL S077: std_logic;
  SIGNAL S078: std_logic;
  SIGNAL S079: std_logic;
  SIGNAL S080: std_logic;
  SIGNAL S081: std_logic;

  ----------------------------------------> Not Connected Pins:
  SIGNAL ncp3_B1_C046: std_logic;


BEGIN -- structural

  ----------------------------------------> Input:
  S018 <= iB(0);
  S019 <= iB(1);
  S020 <= iB(2);
  S021 <= iB(3);
  S022 <= iB(4);
  S023 <= iB(5);
  S024 <= iB(6);
  S025 <= iB(7);
  S026 <= iA(0);
  S027 <= iA(1);
  S028 <= iA(2);
  S029 <= iA(3);
  S030 <= iA(4);
  S031 <= iA(5);
  S032 <= iA(6);
  S033 <= iA(7);
  S003 <= iS2;
  S002 <= iS1;
  S001 <= iS0;

  ----------------------------------------> Output:
  ooF(0) <= S010;
  ooF(1) <= S011;
  ooF(2) <= S012;
  ooF(3) <= S013;
  ooF(4) <= S014;
  ooF(5) <= S015;
  ooF(6) <= S016;
  ooF(7) <= S017;
  oCO <= S005;
  oZF <= S004;

  ----------------------------------------> Constants:
  S007 <= '0';
  S006 <= '1';
  S008 <= '0';

  ----------------------------------------> Component Mapping:
  B1_C046: Adder_8 PORT MAP ( S007, S009, ncp3_B1_C046, S033, 
                              S032, S031, S030, S029, S028, S027, 
                              S026, S041, S040, S039, S038, S037, 
                              S036, S035, S034, S049, S048, S047, 
                              S046, S045, S044, S043, S042 );
  B1_C049: Complem_8 PORT MAP ( S006, S001, S025, S024, S023, 
                                S022, S021, S020, S019, S018, 
                                S041, S040, S039, S038, S037, 
                                S036, S035, S034 );
  B1_C886: NOR8_gate PORT MAP ( S014, S013, S015, S012, S016, 
                                S011, S017, S010, S004 );
  B1_C943: Multiplexer_8_1 PORT MAP ( S009, S009, S008, S008, 
                                      S008, S008, S008, S008, 
                                      S003, S002, S001, S005 );
  B1_C1125: BusMultiplexer81_8 PORT MAP ( S017, S016, S015, S014, 
                                          S013, S012, S011, S010, 
                                          S049, S048, S047, S046, 
                                          S045, S044, S043, S042, 
                                          S049, S048, S047, S046, 
                                          S045, S044, S043, S042, 
                                          S073, S072, S071, S070, 
                                          S069, S068, S067, S066, 
                                          S081, S080, S079, S078, 
                                          S077, S076, S075, S074, 
                                          S057, S056, S055, S054, 
                                          S053, S052, S051, S050, 
                                          S065, S064, S063, S062, 
                                          S061, S060, S059, S058, 
                                          S033, S032, S031, S030, 
                                          S029, S028, S027, S026, 
                                          S025, S024, S023, S022, 
                                          S021, S020, S019, S018, 
                                          S003, S002, S001 );
  B1_C1376: BusAND2_gate_8 PORT MAP ( S025, S024, S023, S022, 
                                      S021, S020, S019, S018, 
                                      S033, S032, S031, S030, 
                                      S029, S028, S027, S026, 
                                      S073, S072, S071, S070, 
                                      S069, S068, S067, S066 );
  B1_C1377: BusOR2_gate_8 PORT MAP ( S025, S024, S023, S022, 
                                     S021, S020, S019, S018, 
                                     S033, S032, S031, S030, 
                                     S029, S028, S027, S026, 
                                     S081, S080, S079, S078, 
                                     S077, S076, S075, S074 );
  B1_C1502: BusNOT_gate_8 PORT MAP ( S025, S024, S023, S022, 
                                     S021, S020, S019, S018, 
                                     S065, S064, S063, S062, 
                                     S061, S060, S059, S058 );
  B1_C1503: BusNOT_gate_8 PORT MAP ( S033, S032, S031, S030, 
                                     S029, S028, S027, S026, 
                                     S057, S056, S055, S054, 
                                     S053, S052, S051, S050 );

END structural;
library ieee;
use ieee.std_logic_1164.all;

ENTITY NOR8_gate IS
  PORT( I0,I1,I2,I3,I4,I5,I6,I7: IN std_logic;
        O: OUT std_logic );
END NOR8_gate;

--------------------------------------------------------------------
ARCHITECTURE behavioral OF NOR8_gate IS
BEGIN
  O <= (not (I0 or I1 or I2 or I3 or I4 or I5 or I6 or I7));
END behavioral;


--------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

ENTITY BusNOT_gate_8 IS
  PORT(	I07: IN std_logic;
			I06: IN std_logic;
			I05: IN std_logic;
			I04: IN std_logic;
			I03: IN std_logic;
			I02: IN std_logic;
			I01: IN std_logic;
			I00: IN std_logic;
			O07: OUT std_logic;
			O06: OUT std_logic;
			O05: OUT std_logic;
			O04: OUT std_logic;
			O03: OUT std_logic;
			O02: OUT std_logic;
			O01: OUT std_logic;
			O00: OUT std_logic );
END BusNOT_gate_8;

--------------------------------------------------------------------
ARCHITECTURE behavioral OF BusNOT_gate_8 IS
BEGIN
	O07 <= (not I07);
	O06 <= (not I06);
	O05 <= (not I05);
	O04 <= (not I04);
	O03 <= (not I03);
	O02 <= (not I02);
	O01 <= (not I01);
	O00 <= (not I00);
END behavioral;



--------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

ENTITY BusAND2_gate_8 IS
   PORT(	A07: IN std_logic;
			A06: IN std_logic;
			A05: IN std_logic;
			A04: IN std_logic;
			A03: IN std_logic;
			A02: IN std_logic;
			A01: IN std_logic;
			A00: IN std_logic;
			B07: IN std_logic;
			B06: IN std_logic;
			B05: IN std_logic;
			B04: IN std_logic;
			B03: IN std_logic;
			B02: IN std_logic;
			B01: IN std_logic;
			B00: IN std_logic;
			O07: OUT std_logic;
			O06: OUT std_logic;
			O05: OUT std_logic;
			O04: OUT std_logic;
			O03: OUT std_logic;
			O02: OUT std_logic;
			O01: OUT std_logic;
			O00: OUT std_logic );		  
END BusAND2_gate_8;

--------------------------------------------------------------------
ARCHITECTURE behavioral OF BusAND2_gate_8 IS
BEGIN
	O07 <= (A07 and B07);
	O06 <= (A06 and B06);
	O05 <= (A05 and B05);
	O04 <= (A04 and B04);
	O03 <= (A03 and B03);
	O02 <= (A02 and B02);
	O01 <= (A01 and B01);
	O00 <= (A00 and B00);
END behavioral;


--------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

ENTITY BusOR2_gate_8 IS
   PORT(	A07: IN std_logic;
			A06: IN std_logic;
			A05: IN std_logic;
			A04: IN std_logic;
			A03: IN std_logic;
			A02: IN std_logic;
			A01: IN std_logic;
			A00: IN std_logic;
			B07: IN std_logic;
			B06: IN std_logic;
			B05: IN std_logic;
			B04: IN std_logic;
			B03: IN std_logic;
			B02: IN std_logic;
			B01: IN std_logic;
			B00: IN std_logic;
			O07: OUT std_logic;
			O06: OUT std_logic;
			O05: OUT std_logic;
			O04: OUT std_logic;
			O03: OUT std_logic;
			O02: OUT std_logic;
			O01: OUT std_logic;
			O00: OUT std_logic );		  
END BusOR2_gate_8;

--------------------------------------------------------------------
ARCHITECTURE behavioral OF BusOR2_gate_8 IS
BEGIN
	O07 <= (A07 or B07);
	O06 <= (A06 or B06);
	O05 <= (A05 or B05);
	O04 <= (A04 or B04);
	O03 <= (A03 or B03);
	O02 <= (A02 or B02);
	O01 <= (A01 or B01);
	O00 <= (A00 or B00);
END behavioral;


--------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

ENTITY Multiplexer_8_1 IS

  PORT( I0: IN  std_logic;
        I1: IN  std_logic;
        I2: IN  std_logic;
        I3: IN  std_logic;
        I4: IN  std_logic;
        I5: IN  std_logic;
        I6: IN  std_logic;
        I7: IN  std_logic;
        S2: IN  std_logic;
        S1: IN  std_logic;
        S0: IN  std_logic;
         Q: OUT std_logic );
END Multiplexer_8_1;

--------------------------------------------------------------------
ARCHITECTURE behavioral OF Multiplexer_8_1 IS
BEGIN
  Q <= I0 when ((S2 = '0') and (S1 = '0') and (S0 = '0')) else
       I1 when ((S2 = '0') and (S1 = '0') and (S0 = '1')) else
       I2 when ((S2 = '0') and (S1 = '1') and (S0 = '0')) else
       I3 when ((S2 = '0') and (S1 = '1') and (S0 = '1')) else
       I4 when ((S2 = '1') and (S1 = '0') and (S0 = '0')) else
       I5 when ((S2 = '1') and (S1 = '0') and (S0 = '1')) else
       I6 when ((S2 = '1') and (S1 = '1') and (S0 = '0')) else
       I7 when ((S2 = '1') and (S1 = '1') and (S0 = '1')) else 'X';
END behavioral;

--------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

ENTITY BusMultiplexer81_8 IS

  PORT( Q_07: OUT std_logic;
        Q_06: OUT std_logic;
        Q_05: OUT std_logic;
        Q_04: OUT std_logic;
        Q_03: OUT std_logic;
        Q_02: OUT std_logic;
        Q_01: OUT std_logic;
        Q_00: OUT std_logic;
        I0_07: IN  std_logic;
        I0_06: IN  std_logic;
        I0_05: IN  std_logic;
        I0_04: IN  std_logic;
        I0_03: IN  std_logic;
        I0_02: IN  std_logic;
        I0_01: IN  std_logic;
        I0_00: IN  std_logic;
        I1_07: IN  std_logic;
        I1_06: IN  std_logic;
        I1_05: IN  std_logic;
        I1_04: IN  std_logic;
        I1_03: IN  std_logic;
        I1_02: IN  std_logic;
        I1_01: IN  std_logic;
        I1_00: IN  std_logic;
        I2_07: IN  std_logic;
        I2_06: IN  std_logic;
        I2_05: IN  std_logic;
        I2_04: IN  std_logic;
        I2_03: IN  std_logic;
        I2_02: IN  std_logic;
        I2_01: IN  std_logic;
        I2_00: IN  std_logic;
        I3_07: IN  std_logic;
        I3_06: IN  std_logic;
        I3_05: IN  std_logic;
        I3_04: IN  std_logic;
        I3_03: IN  std_logic;
        I3_02: IN  std_logic;
        I3_01: IN  std_logic;
        I3_00: IN  std_logic;
        I4_07: IN  std_logic;
        I4_06: IN  std_logic;
        I4_05: IN  std_logic;
        I4_04: IN  std_logic;
        I4_03: IN  std_logic;
        I4_02: IN  std_logic;
        I4_01: IN  std_logic;
        I4_00: IN  std_logic;
        I5_07: IN  std_logic;
        I5_06: IN  std_logic;
        I5_05: IN  std_logic;
        I5_04: IN  std_logic;
        I5_03: IN  std_logic;
        I5_02: IN  std_logic;
        I5_01: IN  std_logic;
        I5_00: IN  std_logic;
        I6_07: IN  std_logic;
        I6_06: IN  std_logic;
        I6_05: IN  std_logic;
        I6_04: IN  std_logic;
        I6_03: IN  std_logic;
        I6_02: IN  std_logic;
        I6_01: IN  std_logic;
        I6_00: IN  std_logic;
        I7_07: IN  std_logic;
        I7_06: IN  std_logic;
        I7_05: IN  std_logic;
        I7_04: IN  std_logic;
        I7_03: IN  std_logic;
        I7_02: IN  std_logic;
        I7_01: IN  std_logic;
        I7_00: IN  std_logic;
        S2  :  IN  std_logic;
        S1  :  IN  std_logic;
        S0  :  IN  std_logic );
END BusMultiplexer81_8;

--------------------------------------------------------------------
ARCHITECTURE behavioral OF BusMultiplexer81_8 IS
BEGIN
  Q_07 <= I0_07 when ((S2 = '0') and (S1 = '0') and (S0 = '0')) else
          I1_07 when ((S2 = '0') and (S1 = '0') and (S0 = '1')) else
          I2_07 when ((S2 = '0') and (S1 = '1') and (S0 = '0')) else
          I3_07 when ((S2 = '0') and (S1 = '1') and (S0 = '1')) else
          I4_07 when ((S2 = '1') and (S1 = '0') and (S0 = '0')) else
          I5_07 when ((S2 = '1') and (S1 = '0') and (S0 = '1')) else
          I6_07 when ((S2 = '1') and (S1 = '1') and (S0 = '0')) else
          I7_07 when ((S2 = '1') and (S1 = '1') and (S0 = '1')) else 'X';
  Q_06 <= I0_06 when ((S2 = '0') and (S1 = '0') and (S0 = '0')) else
          I1_06 when ((S2 = '0') and (S1 = '0') and (S0 = '1')) else
          I2_06 when ((S2 = '0') and (S1 = '1') and (S0 = '0')) else
          I3_06 when ((S2 = '0') and (S1 = '1') and (S0 = '1')) else
          I4_06 when ((S2 = '1') and (S1 = '0') and (S0 = '0')) else
          I5_06 when ((S2 = '1') and (S1 = '0') and (S0 = '1')) else
          I6_06 when ((S2 = '1') and (S1 = '1') and (S0 = '0')) else
          I7_06 when ((S2 = '1') and (S1 = '1') and (S0 = '1')) else 'X';
  Q_05 <= I0_05 when ((S2 = '0') and (S1 = '0') and (S0 = '0')) else
          I1_05 when ((S2 = '0') and (S1 = '0') and (S0 = '1')) else
          I2_05 when ((S2 = '0') and (S1 = '1') and (S0 = '0')) else
          I3_05 when ((S2 = '0') and (S1 = '1') and (S0 = '1')) else
          I4_05 when ((S2 = '1') and (S1 = '0') and (S0 = '0')) else
          I5_05 when ((S2 = '1') and (S1 = '0') and (S0 = '1')) else
          I6_05 when ((S2 = '1') and (S1 = '1') and (S0 = '0')) else
          I7_05 when ((S2 = '1') and (S1 = '1') and (S0 = '1')) else 'X';
  Q_04 <= I0_04 when ((S2 = '0') and (S1 = '0') and (S0 = '0')) else
          I1_04 when ((S2 = '0') and (S1 = '0') and (S0 = '1')) else
          I2_04 when ((S2 = '0') and (S1 = '1') and (S0 = '0')) else
          I3_04 when ((S2 = '0') and (S1 = '1') and (S0 = '1')) else
          I4_04 when ((S2 = '1') and (S1 = '0') and (S0 = '0')) else
          I5_04 when ((S2 = '1') and (S1 = '0') and (S0 = '1')) else
          I6_04 when ((S2 = '1') and (S1 = '1') and (S0 = '0')) else
          I7_04 when ((S2 = '1') and (S1 = '1') and (S0 = '1')) else 'X';
  Q_03 <= I0_03 when ((S2 = '0') and (S1 = '0') and (S0 = '0')) else
          I1_03 when ((S2 = '0') and (S1 = '0') and (S0 = '1')) else
          I2_03 when ((S2 = '0') and (S1 = '1') and (S0 = '0')) else
          I3_03 when ((S2 = '0') and (S1 = '1') and (S0 = '1')) else
          I4_03 when ((S2 = '1') and (S1 = '0') and (S0 = '0')) else
          I5_03 when ((S2 = '1') and (S1 = '0') and (S0 = '1')) else
          I6_03 when ((S2 = '1') and (S1 = '1') and (S0 = '0')) else
          I7_03 when ((S2 = '1') and (S1 = '1') and (S0 = '1')) else 'X';
  Q_02 <= I0_02 when ((S2 = '0') and (S1 = '0') and (S0 = '0')) else
          I1_02 when ((S2 = '0') and (S1 = '0') and (S0 = '1')) else
          I2_02 when ((S2 = '0') and (S1 = '1') and (S0 = '0')) else
          I3_02 when ((S2 = '0') and (S1 = '1') and (S0 = '1')) else
          I4_02 when ((S2 = '1') and (S1 = '0') and (S0 = '0')) else
          I5_02 when ((S2 = '1') and (S1 = '0') and (S0 = '1')) else
          I6_02 when ((S2 = '1') and (S1 = '1') and (S0 = '0')) else
          I7_02 when ((S2 = '1') and (S1 = '1') and (S0 = '1')) else 'X';
  Q_01 <= I0_01 when ((S2 = '0') and (S1 = '0') and (S0 = '0')) else
          I1_01 when ((S2 = '0') and (S1 = '0') and (S0 = '1')) else
          I2_01 when ((S2 = '0') and (S1 = '1') and (S0 = '0')) else
          I3_01 when ((S2 = '0') and (S1 = '1') and (S0 = '1')) else
          I4_01 when ((S2 = '1') and (S1 = '0') and (S0 = '0')) else
          I5_01 when ((S2 = '1') and (S1 = '0') and (S0 = '1')) else
          I6_01 when ((S2 = '1') and (S1 = '1') and (S0 = '0')) else
          I7_01 when ((S2 = '1') and (S1 = '1') and (S0 = '1')) else 'X';
  Q_00 <= I0_00 when ((S2 = '0') and (S1 = '0') and (S0 = '0')) else
          I1_00 when ((S2 = '0') and (S1 = '0') and (S0 = '1')) else
          I2_00 when ((S2 = '0') and (S1 = '1') and (S0 = '0')) else
          I3_00 when ((S2 = '0') and (S1 = '1') and (S0 = '1')) else
          I4_00 when ((S2 = '1') and (S1 = '0') and (S0 = '0')) else
          I5_00 when ((S2 = '1') and (S1 = '0') and (S0 = '1')) else
          I6_00 when ((S2 = '1') and (S1 = '1') and (S0 = '0')) else
          I7_00 when ((S2 = '1') and (S1 = '1') and (S0 = '1')) else 'X';
END behavioral;

--------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY Adder_8 IS

  PORT( CIN: IN  std_logic;
        COUT:OUT std_logic;
        OVF: OUT std_logic;
        A7:  IN  std_logic;
        A6:  IN  std_logic;
        A5:  IN  std_logic;
        A4:  IN  std_logic;
        A3:  IN  std_logic;
        A2:  IN  std_logic;
        A1:  IN  std_logic;
        A0:  IN  std_logic;
        B7:  IN  std_logic;
        B6:  IN  std_logic;
        B5:  IN  std_logic;
        B4:  IN  std_logic;
        B3:  IN  std_logic;
        B2:  IN  std_logic;
        B1:  IN  std_logic;
        B0:  IN  std_logic;
        F7:  OUT std_logic;
        F6:  OUT std_logic;
        F5:  OUT std_logic;
        F4:  OUT std_logic;
        F3:  OUT std_logic;
        F2:  OUT std_logic;
        F1:  OUT std_logic;
        F0:  OUT std_logic );
END Adder_8;

--------------------------------------------------------------------
ARCHITECTURE behavioral OF Adder_8 IS
BEGIN
  Add8: PROCESS( A7, A6, A5, A4, A3, A2, A1, A0,
                 B7, B6, B5, B4, B3, B2, B1, B0,
                 CIN )
  variable A : unsigned( 8 downto 0 );
  variable B : unsigned( 8 downto 0 );
  variable Ar: unsigned( 8 downto 0 ); --(without the sign bit)
  variable Br: unsigned( 8 downto 0 );
  variable F : unsigned( 8 downto 0 );
  BEGIN
    A := ('0'& A7 & A6 & A5 & A4 & A3 & A2 & A1 & A0);
    B := ('0'& B7 & B6 & B5 & B4 & B3 & B2 & B1 & B0);
    --
    Ar:= ('0'& '0'& A6 & A5 & A4 & A3 & A2 & A1 & A0); --(without the sign bit)
    Br:= ('0'& '0'& B6 & B5 & B4 & B3 & B2 & B1 & B0);
    --
    --
    if    (CIN = '0') then  F := Ar + Br;
    elsif (CIN = '1') then  F := Ar + Br + 1;
    else                    F := (others =>'X');  -- (CIN: Unknown)
    END IF;
    --
    OVF  <= ((not F(7)) and (    A(7)) and (    B(7))) or
            ((    F(7)) and (not A(7)) and (not B(7)));
    COUT <= (A(7) and B(7)) or
            (A(7) and F(7)) or
            (B(7) and F(7));
    F7   <= (A(7) xor B(7)) xor F(7);
    F6   <=  F(6);
    F5   <=  F(5);
    F4   <=  F(4);
    F3   <=  F(3);
    F2   <=  F(2);
    F1   <=  F(1);
    F0   <=  F(0);
  END PROCESS;
END behavioral;

--------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY Complem_8 IS
  PORT( TWO: IN  std_logic;
        CPL: IN  std_logic;
        A7:  IN  std_logic;
        A6:  IN  std_logic;
        A5:  IN  std_logic;
        A4:  IN  std_logic;
        A3:  IN  std_logic;
        A2:  IN  std_logic;
        A1:  IN  std_logic;
        A0:  IN  std_logic;
        C7:  OUT std_logic;
        C6:  OUT std_logic;
        C5:  OUT std_logic;
        C4:  OUT std_logic;
        C3:  OUT std_logic;
        C2:  OUT std_logic;
        C1:  OUT std_logic;
        C0:  OUT std_logic );
END Complem_8;

--------------------------------------------------------------------
ARCHITECTURE behavioral OF Complem_8 IS
BEGIN
  Cpl8: PROCESS( TWO, CPL,
                 A7, A6, A5, A4, A3, A2, A1, A0 )
  variable A: unsigned( 7 downto 0 );
  variable C: unsigned( 7 downto 0 );
  BEGIN
    A := (A7 & A6 & A5 & A4 & A3 & A2 & A1 & A0);
    --
    if    (CPL = '0') then     C := A;               -- Identity
    elsif (CPL = '1') then
        if    (TWO = '0') then C := (not A);         -- Ones' Complement
        elsif (TWO = '1') then C := (not A)+1;       -- Two's Complement
        else                   C := (others =>'X');  -- (TWO: Unknown)
        END IF;
    else                       C := (others =>'X');  -- (CPL: Unknown)
    END IF;
    --
    C7   <=  C(7);
    C6   <=  C(6);
    C5   <=  C(5);
    C4   <=  C(4);
    C3   <=  C(3);
    C2   <=  C(2);
    C1   <=  C(1);
    C0   <=  C(0);
  END PROCESS;
END behavioral;



