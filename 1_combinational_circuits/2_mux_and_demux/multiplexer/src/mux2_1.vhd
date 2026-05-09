library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2_1 is

    port(a : in std_logic;
         b : in std_logic;
         s : in std_logic;
         o : out std_logic);

end mux2_1;

architecture Dataflow of mux2_1 is

    begin

        o <= a when s = '0' else b; 

end Dataflow;