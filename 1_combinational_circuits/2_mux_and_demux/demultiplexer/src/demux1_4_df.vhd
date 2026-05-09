library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity demux1_4_df is

    port(x : in std_logic;
         s0 : in std_logic;
         s1 : in std_logic;
         a : out std_logic;
         b : out std_logic;
         c : out std_logic;
         d : out std_logic);

end demux1_4_df;


architecture Dataflow of demux1_4_df is

    begin

        a <= x and (not s1) and (not s0);
        b <= x and (not s1) and s0;
        c <= x and s1 and (not s0);
        d <= x and s1 and s0;  
        
end Dataflow;

