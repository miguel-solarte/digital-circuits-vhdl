library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decoder_2to4_df is

    port(I : in std_logic_vector(1 downto 0);
         O : out std_logic_vector(3 downto 0));

end decoder_2to4_df;

architecture Dataflow of decoder_2to4_df is 

begin

    O(0) <= (not I(0)) and (not I(1));
    O(1) <= I(0) and (not I(1));
    O(2) <= (not I(0)) and I(1);
    O(3) <= I(0) and I(1);
    

end Dataflow;