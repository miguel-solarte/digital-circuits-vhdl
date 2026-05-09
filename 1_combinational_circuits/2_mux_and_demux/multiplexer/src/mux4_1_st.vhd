library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux4_1_st is

    port(a : in std_logic;
         b : in std_logic;
         c : in std_logic;
         d : in std_logic;
         s0 : in std_logic;
         s1 : in std_logic;
         o : out std_logic);

end mux4_1_st;

architecture Structural of mux4_1_st is

    component mux2_1 is

        port(a : in std_logic;
             b : in std_logic;
             s : in std_logic;
             o : out std_logic);

    end component;


    signal o_s0, o_s1 : std_logic;

    begin

        u1:mux2_1 port map(a => a,
                           b => b,
                           s => s0,
                           o => o_s0);
        
        u2:mux2_1 port map(a => c,
                           b => d,
                           s => s0,
                           o => o_s1);
                           
        u3:mux2_1 port map(a => o_s0,
                           b => o_s1,
                           s => s1,
                           o => o);                   
        

end Structural;