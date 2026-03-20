library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity half_adder_df is

    port(a: in std_logic;
         b: in std_logic;
         sum : out std_logic;
         c_out: out std_logic   
    );

end half_adder_df;

architecture Dataflow of half_adder_df is

begin

    sum <= a xor b;
    c_out <= a and b;

end Dataflow;