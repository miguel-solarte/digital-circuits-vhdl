library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity nand_gate is

    port(a : in STD_LOGIC;
         b : in STD_LOGIC;
         o : out STD_LOGIC);
           
end nand_gate;

architecture Dataflow of nand_gate is

begin

o <= a nand b;

end Dataflow;