library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux8_1 is

    port(A : in std_logic_vector(7 downto 0);
         S : in std_logic_vector(2 downto 0);
         y : out std_logic);
         
end mux8_1;

architecture Dataflow of mux8_1 is

    begin

        y <= A(0) when S = "000" else
             A(1) when S = "001" else
             A(2) when S = "010" else
             A(3) when S = "011" else
             A(4) when S = "100" else
             A(5) when S = "101" else
             A(6) when S = "110" else 
             A(7);

end Dataflow;