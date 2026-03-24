library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity comparator_4bit_st is

    port(A : in std_logic_vector(3 downto 0);
         B : in std_logic_vector(3 downto 0);
         Y : out std_logic_vector(2 downto 0));

end comparator_4bit_st;

architecture Structural of comparator_4bit_st is

    component not_gate is

        port(a: in std_logic;
             o: out std_logic);
    
    end component;

    component and_gate is

        port(a : in STD_LOGIC;
             b : in STD_LOGIC;
             o : out STD_LOGIC);
           
    end component;

    component nor_gate is

        port(a : in std_logic;
            b : in std_logic;
            o : out std_logic);
    
    end component;

    component or_gate is

        port(a : in std_logic;
             b : in std_logic;
             o : out std_logic);
    
    end component;

    signal not0_sig, not1_sig, not2_sig, not3_sig: std_logic; 
    signal not4_sig, not5_sig, not6_sig, not7_sig: std_logic; 

    signal and0_sig, and1_sig, and2_sig, and3_sig: std_logic; 
    signal and4_sig, and5_sig, and6_sig, and7_sig: std_logic; 
    signal and8_sig, and9_sig, and10_sig, and11_sig: std_logic;
    signal and13_sig, and14_sig, and15_sig, and16_sig: std_logic; 

    signal nor0_sig, nor1_sig, nor2_sig, nor3_sig : std_logic;  
    
    signal or0_sig, or1_sig, or4_sig, or5_sig : std_logic;


begin

    --NOT
    not0:not_gate port map(a => A(0), o => not0_sig); 
    not1:not_gate port map(a => A(1), o => not1_sig);
    not2:not_gate port map(a => A(2), o => not2_sig); 
    not3:not_gate port map(a => A(3), o => not3_sig); 
    not4:not_gate port map(a => B(0), o => not4_sig); 
    not5:not_gate port map(a => B(1), o => not5_sig); 
    not6:not_gate port map(a => B(2), o => not6_sig); 
    not7:not_gate port map(a => B(3), o => not7_sig);

    --AND
    and0:and_gate port map(a => A(0), b => not4_sig, o => and0_sig);
    and1:and_gate port map(a => B(0), b => not0_sig, o => and1_sig);
    and2:and_gate port map(a => A(1), b => not5_sig, o => and2_sig);
    and3:and_gate port map(a => B(1), b => not1_sig, o => and3_sig);
    and4:and_gate port map(a => A(2), b => not6_sig, o => and4_sig);
    and5:and_gate port map(a => B(2), b => not2_sig, o => and5_sig);
    and6:and_gate port map(a => A(3), b => not7_sig, o => and6_sig);
    and7:and_gate port map(a => B(3), b => not3_sig, o => and7_sig);

    --NOR
    nor0:nor_gate port map(a => and0_sig, b => and1_sig, o => nor0_sig);
    nor1:nor_gate port map(a => and2_sig, b => and3_sig, o => nor1_sig);
    nor2:nor_gate port map(a => and4_sig, b => and5_sig, o => nor2_sig);
    nor3:nor_gate port map(a => and6_sig, b => and7_sig, o => nor3_sig);

    --AND
    and8:and_gate port map(a => nor2_sig, b => nor3_sig, o => and8_sig);
    and9:and_gate port map(a => and8_sig, b => nor1_sig, o => and9_sig);
    and10:and_gate port map(a => and4_sig, b => nor3_sig, o => and10_sig);
    and11:and_gate port map(a => and5_sig, b => nor3_sig, o => and11_sig);
    and12:and_gate port map(a => nor0_sig, b => and9_sig, o => Y(0)); -- A = B
    and13:and_gate port map(a => and1_sig, b => and9_sig, o => and13_sig);
    and14:and_gate port map(a => and2_sig, b => and8_sig, o => and14_sig);
    and15:and_gate port map(a => and3_sig, b => and8_sig, o => and15_sig);
    and16:and_gate port map(a => and0_sig, b => and9_sig, o => and16_sig);

    --OR
    or0:or_gate port map(a => and16_sig, b => and14_sig, o => or0_sig);
    or1:or_gate port map(a => and10_sig, b => and6_sig, o => or1_sig);
    or3:or_gate port map(a => or0_sig, b => or1_sig, o => Y(1)); -- A > B
    or4:or_gate port map(a => and13_sig, b => and15_sig, o => or4_sig);
    or5:or_gate port map(a => and11_sig, b => and7_sig, o => or5_sig);
    or6:or_gate port map(a => or4_sig, b => or5_sig, o => Y(2)); -- A < B

end Structural;