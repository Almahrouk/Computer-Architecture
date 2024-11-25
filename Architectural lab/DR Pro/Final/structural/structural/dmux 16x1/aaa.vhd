
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.all;


ENTITY aaa IS
  PORT( 
    --------------------------------------> Inputs:
    iIN:          IN  std_logic;
    iS4:          IN  std_logic;
    iS3:          IN  std_logic;
    iS2:          IN  std_logic;
    iS1:          IN  std_logic;
    iS0:          IN  std_logic;
    iS5:          IN  std_logic;
    --------------------------------------> Outputs:
    oL7_L0:       OUT std_logic_vector( 7 downto 0 );
    oL15_L8:      OUT std_logic_vector( 7 downto 0 );
    oL23_L16:     OUT std_logic_vector( 7 downto 0 );
    oL31_L24:     OUT std_logic_vector( 7 downto 0 );
    oL39_L32:     OUT std_logic_vector( 7 downto 0 );
    oL47_L40:     OUT std_logic_vector( 7 downto 0 );
    oL53_L48:     OUT std_logic_vector( 7 downto 0 );
    oL63_L56:     OUT std_logic_vector( 7 downto 0 );
    oS5_S0:       OUT std_logic_vector( 7 downto 0 ) 
    ------------------------------------------------------
    );
END aaa;


ARCHITECTURE structural OF aaa IS 

  ----------------------------------------> Components:
  COMPONENT Demultiplexer_1_4 IS
          
    PORT( I: IN  std_logic;
          S1: IN  std_logic;
          S0: IN  std_logic;
          Q0: OUT std_logic;
          Q1: OUT std_logic;
          Q2: OUT std_logic;
          Q3: OUT std_logic );
  END COMPONENT;
  --
  COMPONENT Demultiplexer_1_16 IS
          
    PORT( I:  IN  std_logic;
          S3:  IN  std_logic;
          S2:  IN  std_logic;
          S1:  IN  std_logic;
          S0:  IN  std_logic;
          Q0:  OUT std_logic;
          Q1:  OUT std_logic;
          Q2:  OUT std_logic;
          Q3:  OUT std_logic;
          Q4:  OUT std_logic;
          Q5:  OUT std_logic;
          Q6:  OUT std_logic;
          Q7:  OUT std_logic;
          Q8:  OUT std_logic;
          Q9:  OUT std_logic;
          Q10: OUT std_logic;
          Q11: OUT std_logic;
          Q12: OUT std_logic;
          Q13: OUT std_logic;
          Q14: OUT std_logic;
          Q15:  OUT std_logic );
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


BEGIN -- structural

  ----------------------------------------> Input:
  S001 <= iIN;
  S074 <= iS4;
  S073 <= iS3;
  S072 <= iS2;
  S071 <= iS1;
  S070 <= iS0;
  S075 <= iS5;

  ----------------------------------------> Output:
  oL7_L0(0) <= S006;
  oL7_L0(1) <= S007;
  oL7_L0(2) <= S008;
  oL7_L0(3) <= S009;
  oL7_L0(4) <= S010;
  oL7_L0(5) <= S011;
  oL7_L0(6) <= S012;
  oL7_L0(7) <= S013;
  oL15_L8(0) <= S014;
  oL15_L8(1) <= S015;
  oL15_L8(2) <= S016;
  oL15_L8(3) <= S017;
  oL15_L8(4) <= S018;
  oL15_L8(5) <= S019;
  oL15_L8(6) <= S020;
  oL15_L8(7) <= S021;
  oL23_L16(0) <= S022;
  oL23_L16(1) <= S023;
  oL23_L16(2) <= S024;
  oL23_L16(3) <= S025;
  oL23_L16(4) <= S026;
  oL23_L16(5) <= S027;
  oL23_L16(6) <= S028;
  oL23_L16(7) <= S029;
  oL31_L24(0) <= S030;
  oL31_L24(1) <= S031;
  oL31_L24(2) <= S032;
  oL31_L24(3) <= S033;
  oL31_L24(4) <= S034;
  oL31_L24(5) <= S035;
  oL31_L24(6) <= S036;
  oL31_L24(7) <= S037;
  oL39_L32(0) <= S038;
  oL39_L32(1) <= S039;
  oL39_L32(2) <= S040;
  oL39_L32(3) <= S041;
  oL39_L32(4) <= S042;
  oL39_L32(5) <= S043;
  oL39_L32(6) <= S044;
  oL39_L32(7) <= S045;
  oL47_L40(0) <= S046;
  oL47_L40(1) <= S047;
  oL47_L40(2) <= S048;
  oL47_L40(3) <= S049;
  oL47_L40(4) <= S050;
  oL47_L40(5) <= S051;
  oL47_L40(6) <= S052;
  oL47_L40(7) <= S053;
  oL53_L48(0) <= S054;
  oL53_L48(1) <= S055;
  oL53_L48(2) <= S056;
  oL53_L48(3) <= S057;
  oL53_L48(4) <= S058;
  oL53_L48(5) <= S059;
  oL53_L48(6) <= S060;
  oL53_L48(7) <= S061;
  oL63_L56(0) <= S062;
  oL63_L56(1) <= S063;
  oL63_L56(2) <= S064;
  oL63_L56(3) <= S065;
  oL63_L56(4) <= S066;
  oL63_L56(5) <= S067;
  oL63_L56(6) <= S068;
  oL63_L56(7) <= S069;
  oS5_S0(0) <= S070;
  oS5_S0(1) <= S071;
  oS5_S0(2) <= S072;
  oS5_S0(3) <= S073;
  oS5_S0(4) <= S074;
  oS5_S0(5) <= S075;
  oS5_S0(6) <= S076;
  oS5_S0(7) <= S076;

  ----------------------------------------> Constants:
  S076 <= '0';

  ----------------------------------------> Component Mapping:
  C012: Demultiplexer_1_4 PORT MAP ( S001, S075, S074, S005, 
                                     S004, S003, S002 );
  C017: Demultiplexer_1_16 PORT MAP ( S003, S073, S072, S071, 
                                      S070, S038, S039, S040, 
                                      S041, S042, S043, S044, 
                                      S045, S046, S047, S048, 
                                      S049, S050, S051, S052, 
                                      S053 );
  C018: Demultiplexer_1_16 PORT MAP ( S002, S073, S072, S071, 
                                      S070, S054, S055, S056, 
                                      S057, S058, S059, S060, 
                                      S061, S062, S063, S064, 
                                      S065, S066, S067, S068, 
                                      S069 );
  C044: Demultiplexer_1_16 PORT MAP ( S004, S073, S072, S071, 
                                      S070, S022, S023, S024, 
                                      S025, S026, S027, S028, 
                                      S029, S030, S031, S032, 
                                      S033, S034, S035, S036, 
                                      S037 );
  C045: Demultiplexer_1_16 PORT MAP ( S005, S073, S072, S071, 
                                      S070, S006, S007, S008, 
                                      S009, S010, S011, S012, 
                                      S013, S014, S015, S016, 
                                      S017, S018, S019, S020, 
                                      S021 );

END structural;
library ieee;
use ieee.std_logic_1164.all;

ENTITY Demultiplexer_1_4 IS

  PORT(  I: IN  std_logic;
        S1: IN  std_logic;
        S0: IN  std_logic;
        Q0: OUT std_logic;
        Q1: OUT std_logic;
        Q2: OUT std_logic;
        Q3: OUT std_logic );
END Demultiplexer_1_4;

--------------------------------------------------------------------
ARCHITECTURE behavioral OF Demultiplexer_1_4 IS
  SIGNAL aNumber: std_logic_vector( 2 downto 0 );
BEGIN
  aNumber <= I & S1 & S0;
  with aNumber select
    Q0 <= '0' when "000", '0' when "001", '0' when "010", '0' when "011",
          '1' when "100", '0' when "101", '0' when "110", '0' when "111",
          'X' when others;
  with aNumber select
    Q1 <= '0' when "000", '0' when "001", '0' when "010", '0' when "011",
          '0' when "100", '1' when "101", '0' when "110", '0' when "111",
          'X' when others;
  with aNumber select
    Q2 <= '0' when "000", '0' when "001", '0' when "010", '0' when "011",
          '0' when "100", '0' when "101", '1' when "110", '0' when "111",
          'X' when others;
  with aNumber select
    Q3 <= '0' when "000", '0' when "001", '0' when "010", '0' when "011",
          '0' when "100", '0' when "101", '0' when "110", '1' when "111",
          'X' when others;
END behavioral;

--------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

ENTITY Demultiplexer_1_16 IS

  PORT(  I:  IN  std_logic;
        S3:  IN  std_logic;
        S2:  IN  std_logic;
        S1:  IN  std_logic;
        S0:  IN  std_logic;
        Q0:  OUT std_logic;
        Q1:  OUT std_logic;
        Q2:  OUT std_logic;
        Q3:  OUT std_logic;
        Q4:  OUT std_logic;
        Q5:  OUT std_logic;
        Q6:  OUT std_logic;
        Q7:  OUT std_logic;
        Q8:  OUT std_logic;
        Q9:  OUT std_logic;
        Q10: OUT std_logic;
        Q11: OUT std_logic;
        Q12: OUT std_logic;
        Q13: OUT std_logic;
        Q14: OUT std_logic;
        Q15:  OUT std_logic );
END Demultiplexer_1_16;

--------------------------------------------------------------------
ARCHITECTURE behavioral OF Demultiplexer_1_16 IS
  SIGNAL aNumber: std_logic_vector( 4 downto 0 );

BEGIN
  aNumber <= I & S3 & S2 & S1 & S0;
  with aNumber select
    Q0 <= '0' when "00000", '0' when "00001", '0' when "00010", '0' when "00011",
          '0' when "00100", '0' when "00101", '0' when "00110", '0' when "00111",
          '0' when "01000", '0' when "01001", '0' when "01010", '0' when "01011",
          '0' when "01100", '0' when "01101", '0' when "01110", '0' when "01111",
          '1' when "10000", '0' when "10001", '0' when "10010", '0' when "10011",
          '0' when "10100", '0' when "10101", '0' when "10110", '0' when "10111",
          '0' when "11000", '0' when "11001", '0' when "11010", '0' when "11011",
          '0' when "11100", '0' when "11101", '0' when "11110", '0' when "11111",
          'X' when others;
  with aNumber select
    Q1 <= '0' when "00000", '0' when "00001", '0' when "00010", '0' when "00011",
          '0' when "00100", '0' when "00101", '0' when "00110", '0' when "00111",
          '0' when "01000", '0' when "01001", '0' when "01010", '0' when "01011",
          '0' when "01100", '0' when "01101", '0' when "01110", '0' when "01111",
          '0' when "10000", '1' when "10001", '0' when "10010", '0' when "10011",
          '0' when "10100", '0' when "10101", '0' when "10110", '0' when "10111",
          '0' when "11000", '0' when "11001", '0' when "11010", '0' when "11011",
          '0' when "11100", '0' when "11101", '0' when "11110", '0' when "11111",
          'X' when others;
  with aNumber select
    Q2 <= '0' when "00000", '0' when "00001", '0' when "00010", '0' when "00011",
          '0' when "00100", '0' when "00101", '0' when "00110", '0' when "00111",
          '0' when "01000", '0' when "01001", '0' when "01010", '0' when "01011",
          '0' when "01100", '0' when "01101", '0' when "01110", '0' when "01111",
          '0' when "10000", '0' when "10001", '1' when "10010", '0' when "10011",
          '0' when "10100", '0' when "10101", '0' when "10110", '0' when "10111",
          '0' when "11000", '0' when "11001", '0' when "11010", '0' when "11011",
          '0' when "11100", '0' when "11101", '0' when "11110", '0' when "11111",
          'X' when others;
  with aNumber select
    Q3 <= '0' when "00000", '0' when "00001", '0' when "00010", '0' when "00011",
          '0' when "00100", '0' when "00101", '0' when "00110", '0' when "00111",
          '0' when "01000", '0' when "01001", '0' when "01010", '0' when "01011",
          '0' when "01100", '0' when "01101", '0' when "01110", '0' when "01111",
          '0' when "10000", '0' when "10001", '0' when "10010", '1' when "10011",
          '0' when "10100", '0' when "10101", '0' when "10110", '0' when "10111",
          '0' when "11000", '0' when "11001", '0' when "11010", '0' when "11011",
          '0' when "11100", '0' when "11101", '0' when "11110", '0' when "11111",
          'X' when others;
  with aNumber select
    Q4 <= '0' when "00000", '0' when "00001", '0' when "00010", '0' when "00011",
          '0' when "00100", '0' when "00101", '0' when "00110", '0' when "00111",
          '0' when "01000", '0' when "01001", '0' when "01010", '0' when "01011",
          '0' when "01100", '0' when "01101", '0' when "01110", '0' when "01111",
          '0' when "10000", '0' when "10001", '0' when "10010", '0' when "10011",
          '1' when "10100", '0' when "10101", '0' when "10110", '0' when "10111",
          '0' when "11000", '0' when "11001", '0' when "11010", '0' when "11011",
          '0' when "11100", '0' when "11101", '0' when "11110", '0' when "11111",
          'X' when others;
  with aNumber select
    Q5 <= '0' when "00000", '0' when "00001", '0' when "00010", '0' when "00011",
          '0' when "00100", '0' when "00101", '0' when "00110", '0' when "00111",
          '0' when "01000", '0' when "01001", '0' when "01010", '0' when "01011",
          '0' when "01100", '0' when "01101", '0' when "01110", '0' when "01111",
          '0' when "10000", '0' when "10001", '0' when "10010", '0' when "10011",
          '0' when "10100", '1' when "10101", '0' when "10110", '0' when "10111",
          '0' when "11000", '0' when "11001", '0' when "11010", '0' when "11011",
          '0' when "11100", '0' when "11101", '0' when "11110", '0' when "11111",
          'X' when others;
  with aNumber select
    Q6 <= '0' when "00000", '0' when "00001", '0' when "00010", '0' when "00011",
          '0' when "00100", '0' when "00101", '0' when "00110", '0' when "00111",
          '0' when "01000", '0' when "01001", '0' when "01010", '0' when "01011",
          '0' when "01100", '0' when "01101", '0' when "01110", '0' when "01111",
          '0' when "10000", '0' when "10001", '0' when "10010", '0' when "10011",
          '0' when "10100", '0' when "10101", '1' when "10110", '0' when "10111",
          '0' when "11000", '0' when "11001", '0' when "11010", '0' when "11011",
          '0' when "11100", '0' when "11101", '0' when "11110", '0' when "11111",
          'X' when others;
  with aNumber select
    Q7 <= '0' when "00000", '0' when "00001", '0' when "00010", '0' when "00011",
          '0' when "00100", '0' when "00101", '0' when "00110", '0' when "00111",
          '0' when "01000", '0' when "01001", '0' when "01010", '0' when "01011",
          '0' when "01100", '0' when "01101", '0' when "01110", '0' when "01111",
          '0' when "10000", '0' when "10001", '0' when "10010", '0' when "10011",
          '0' when "10100", '0' when "10101", '0' when "10110", '1' when "10111",
          '0' when "11000", '0' when "11001", '0' when "11010", '0' when "11011",
          '0' when "11100", '0' when "11101", '0' when "11110", '0' when "11111",
          'X' when others;
  with aNumber select
    Q8 <= '0' when "00000", '0' when "00001", '0' when "00010", '0' when "00011",
          '0' when "00100", '0' when "00101", '0' when "00110", '0' when "00111",
          '0' when "01000", '0' when "01001", '0' when "01010", '0' when "01011",
          '0' when "01100", '0' when "01101", '0' when "01110", '0' when "01111",
          '0' when "10000", '0' when "10001", '0' when "10010", '0' when "10011",
          '0' when "10100", '0' when "10101", '0' when "10110", '0' when "10111",
          '1' when "11000", '0' when "11001", '0' when "11010", '0' when "11011",
          '0' when "11100", '0' when "11101", '0' when "11110", '0' when "11111",
          'X' when others;
  with aNumber select
    Q9 <= '0' when "00000", '0' when "00001", '0' when "00010", '0' when "00011",
          '0' when "00100", '0' when "00101", '0' when "00110", '0' when "00111",
          '0' when "01000", '0' when "01001", '0' when "01010", '0' when "01011",
          '0' when "01100", '0' when "01101", '0' when "01110", '0' when "01111",
          '0' when "10000", '0' when "10001", '0' when "10010", '0' when "10011",
          '0' when "10100", '0' when "10101", '0' when "10110", '0' when "10111",
          '0' when "11000", '1' when "11001", '0' when "11010", '0' when "11011",
          '0' when "11100", '0' when "11101", '0' when "11110", '0' when "11111",
          'X' when others;
  with aNumber select
    Q10<= '0' when "00000", '0' when "00001", '0' when "00010", '0' when "00011",
          '0' when "00100", '0' when "00101", '0' when "00110", '0' when "00111",
          '0' when "01000", '0' when "01001", '0' when "01010", '0' when "01011",
          '0' when "01100", '0' when "01101", '0' when "01110", '0' when "01111",
          '0' when "10000", '0' when "10001", '0' when "10010", '0' when "10011",
          '0' when "10100", '0' when "10101", '0' when "10110", '0' when "10111",
          '0' when "11000", '0' when "11001", '1' when "11010", '0' when "11011",
          '0' when "11100", '0' when "11101", '0' when "11110", '0' when "11111",
          'X' when others;
  with aNumber select
    Q11<= '0' when "00000", '0' when "00001", '0' when "00010", '0' when "00011",
          '0' when "00100", '0' when "00101", '0' when "00110", '0' when "00111",
          '0' when "01000", '0' when "01001", '0' when "01010", '0' when "01011",
          '0' when "01100", '0' when "01101", '0' when "01110", '0' when "01111",
          '0' when "10000", '0' when "10001", '0' when "10010", '0' when "10011",
          '0' when "10100", '0' when "10101", '0' when "10110", '0' when "10111",
          '0' when "11000", '0' when "11001", '0' when "11010", '1' when "11011",
          '0' when "11100", '0' when "11101", '0' when "11110", '0' when "11111",
          'X' when others;
  with aNumber select
    Q12<= '0' when "00000", '0' when "00001", '0' when "00010", '0' when "00011",
          '0' when "00100", '0' when "00101", '0' when "00110", '0' when "00111",
          '0' when "01000", '0' when "01001", '0' when "01010", '0' when "01011",
          '0' when "01100", '0' when "01101", '0' when "01110", '0' when "01111",
          '0' when "10000", '0' when "10001", '0' when "10010", '0' when "10011",
          '0' when "10100", '0' when "10101", '0' when "10110", '0' when "10111",
          '0' when "11000", '0' when "11001", '0' when "11010", '0' when "11011",
          '1' when "11100", '0' when "11101", '0' when "11110", '0' when "11111",
          'X' when others;
  with aNumber select
    Q13<= '0' when "00000", '0' when "00001", '0' when "00010", '0' when "00011",
          '0' when "00100", '0' when "00101", '0' when "00110", '0' when "00111",
          '0' when "01000", '0' when "01001", '0' when "01010", '0' when "01011",
          '0' when "01100", '0' when "01101", '0' when "01110", '0' when "01111",
          '0' when "10000", '0' when "10001", '0' when "10010", '0' when "10011",
          '0' when "10100", '0' when "10101", '0' when "10110", '0' when "10111",
          '0' when "11000", '0' when "11001", '0' when "11010", '0' when "11011",
          '0' when "11100", '1' when "11101", '0' when "11110", '0' when "11111",
          'X' when others;
  with aNumber select
    Q14<= '0' when "00000", '0' when "00001", '0' when "00010", '0' when "00011",
          '0' when "00100", '0' when "00101", '0' when "00110", '0' when "00111",
          '0' when "01000", '0' when "01001", '0' when "01010", '0' when "01011",
          '0' when "01100", '0' when "01101", '0' when "01110", '0' when "01111",
          '0' when "10000", '0' when "10001", '0' when "10010", '0' when "10011",
          '0' when "10100", '0' when "10101", '0' when "10110", '0' when "10111",
          '0' when "11000", '0' when "11001", '0' when "11010", '0' when "11011",
          '0' when "11100", '0' when "11101", '1' when "11110", '0' when "11111",
          'X' when others;
  with aNumber select
    Q14<= '0' when "00000", '0' when "00001", '0' when "00010", '0' when "00011",
          '0' when "00100", '0' when "00101", '0' when "00110", '0' when "00111",
          '0' when "01000", '0' when "01001", '0' when "01010", '0' when "01011",
          '0' when "01100", '0' when "01101", '0' when "01110", '0' when "01111",
          '0' when "10000", '0' when "10001", '0' when "10010", '0' when "10011",
          '0' when "10100", '0' when "10101", '0' when "10110", '0' when "10111",
          '0' when "11000", '0' when "11001", '0' when "11010", '0' when "11011",
          '0' when "11100", '0' when "11101", '1' when "11110", '0' when "11111",
          'X' when others;
  with aNumber select
    Q15<= '0' when "00000", '0' when "00001", '0' when "00010", '0' when "00011",
          '0' when "00100", '0' when "00101", '0' when "00110", '0' when "00111",
          '0' when "01000", '0' when "01001", '0' when "01010", '0' when "01011",
          '0' when "01100", '0' when "01101", '0' when "01110", '0' when "01111",
          '0' when "10000", '0' when "10001", '0' when "10010", '0' when "10011",
          '0' when "10100", '0' when "10101", '0' when "10110", '0' when "10111",
          '0' when "11000", '0' when "11001", '0' when "11010", '0' when "11011",
          '0' when "11100", '0' when "11101", '0' when "11110", '1' when "11111",
          'X' when others;
END behavioral;



