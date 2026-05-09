library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity comparator_4bit_df is

    port(A : in std_logic_vector(3 downto 0);
         B : in std_logic_vector(3 downto 0);
         Y : out std_logic_vector(2 downto 0));

end comparator_4bit_df;

architecture Dataflow of comparator_4bit_df is

    begin

        Y(0) <= '1' when(A = B) else '0';
        Y(1) <= '1' when(A > B) else '0';
        Y(2) <= '1' when(A < B) else '0';

end Dataflow;