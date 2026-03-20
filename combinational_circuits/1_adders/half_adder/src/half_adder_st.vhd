library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity half_adder_st is
    
    port(a : in std_logic;
         b : in std_logic;
         sum : out std_logic;
         c_out: out std_logic   
    );

end half_adder_st;

architecture Structural of half_adder_st is

    component XOR_GATE is
    
        port(x : in std_logic;
             y : in std_logic;
             o : out std_logic);
             
    end component; 
    
    component AND_GATE is
    
        port(x : in std_logic;
             y : in std_logic;
             o : out std_logic);
             
    end component; 
    
begin

    u1: XOR_GATE 
        port map (
            x => a,
            y => b,
            o => sum
        );

    u2: AND_GATE 
        port map (
            x => a,
            y => b,
            o => c_out
        );
    
       


end Structural;