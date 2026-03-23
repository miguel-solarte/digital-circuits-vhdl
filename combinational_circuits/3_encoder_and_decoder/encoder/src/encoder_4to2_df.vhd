library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity encoder_4to2_df is

    port(a : in std_logic_vector(3 downto 0);
         y : out std_logic_vector(1 downto 0));

end encoder_4to2_df;

architecture Dataflow of encoder_4to2_df is

    begin

        y(0) <= a(1) or a(3);
        y(1) <= a(2) or a(3);

end Dataflow;