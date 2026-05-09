library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux4_1_df is

    port(a : in std_logic;
         b : in std_logic;
         c : in std_logic;
         d : in std_logic;
         s0 : in std_logic;
         s1 : in std_logic;
         y : out std_logic);
         
end mux4_1_df;

architecture Dataflow of mux4_1_df is
begin

    y <= (a and (not s1) and (not s0)) or
         (b and (not s1) and s0) or
         (c and s1 and (not s0)) or
         (d and s1 and s0);

end Dataflow;