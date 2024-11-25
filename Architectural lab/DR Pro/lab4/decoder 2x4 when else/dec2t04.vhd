library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity dec2t04 is
     port(
         din : in STD_LOGIC_VECTOR(1 downto 0);
         dout : out STD_LOGIC_VECTOR(3 downto 0)
         );
end dec2t04;


architecture dec2t04 of dec2t04 is
begin

    dout <= ("1000") when (din="00") else
            ("0100") when (din="01") else
            ("0010") when (din="10") else
            ("0001") when (din="11") else
           
            ("0000") ;

end dec2t04;