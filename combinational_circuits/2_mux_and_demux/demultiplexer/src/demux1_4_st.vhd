library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity demux1_4_st is

    port(x : in std_logic;
         s0 : in std_logic;
         s1 : in std_logic;
         a : out std_logic;
         b : out std_logic;
         c : out std_logic;
         d : out std_logic);

end demux1_4_st;


architecture Structural of demux1_4_st is

    component and_gate is

        port(a : in STD_LOGIC;
             b : in STD_LOGIC;
             o : out STD_LOGIC);
           
    end component;

    component not_gate is

        port(a: in std_logic;
             o: out std_logic);
    
    end component;

    signal n0_sig, n1_sig : std_logic;
    signal and0_sig, and1_sig, and2_sig, and3_sig : std_logic;

    begin

        --not
        u1:not_gate port map(a => s0, o => n0_sig);
        u2:not_gate port map(a => s1, o => n1_sig);
        --and D
        u3:and_gate port map(a => x, b => s0, o => and0_sig);
        u4:and_gate port map(a => and0_sig, b => s1, o => d);
        --and C
        u5:and_gate port map(a => x, b => n0_sig, o => and1_sig);
        u6:and_gate port map(a => and1_sig, b => s1, o => c);
        --and B
        u7:and_gate port map(a => x, b => s0, o => and2_sig);
        u8:and_gate port map(a => and2_sig, b => n1_sig, o => b);
        --and A 
        u9:and_gate port map(a => x, b => n0_sig, o => and3_sig);
        u10:and_gate port map(a => and3_sig, b => n1_sig, o => a);

end Structural;

