library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BintoBCD_4bit is

    port(B_in : in std_logic_vector(3 downto 0);
         Y_bcd : out std_logic_vector(4 downto 0));

end BintoBCD_4bit;

architecture Dataflow of BintoBCD_4bit is

    begin

        Y_bcd(0) <= B_in(0);
        Y_bcd(1) <= B_in(1) xor B_in(3);
        Y_bcd(2) <= B_in(2) and not B_in(3);
        Y_bcd(3) <= B_in(3) and not B_in(2) and not B_in(1);
        Y_bcd(4) <= B_in(3) and (B_in(2) or B_in(1));

end Dataflow;