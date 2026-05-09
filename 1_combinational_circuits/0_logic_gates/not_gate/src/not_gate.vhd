library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity not_gate is

    port(a: in std_logic;
         o: out std_logic);
    
end not_gate;

architecture Dataflow of not_gate is

begin

o <= not a;

end Dataflow;