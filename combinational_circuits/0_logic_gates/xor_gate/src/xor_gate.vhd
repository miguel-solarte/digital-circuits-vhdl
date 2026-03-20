library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity xor_gate is

    port(a : in std_logic;
         b : in std_logic;
         o : out std_logic);
         
end xor_gate;

architecture Dataflow of xor_gate is

begin

o <= a xor b;

end Dataflow;