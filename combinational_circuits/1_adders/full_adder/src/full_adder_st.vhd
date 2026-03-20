library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder_st is

    port(a: in std_logic;
         b: in std_logic;
         c_in: in std_logic;
         sum: out std_logic;
         c_out: out std_logic);
    
end full_adder_st;

architecture Structural of full_adder_st is
    
    component and_gate is

        port(a : in STD_LOGIC;
             b : in STD_LOGIC;
             o : out STD_LOGIC);
           
    end component;
    
    
    component or_gate is

        port(a : in STD_LOGIC;
             b : in STD_LOGIC;
             o : out STD_LOGIC);
           
    end component;
    
    component xor_gate is

        port(a : in STD_LOGIC;
             b : in STD_LOGIC;
             o : out STD_LOGIC);
           
    end component;


    signal o1_sig, o2_sig, o3_sig : std_logic;

begin

    u1:xor_gate 
        port map(a => a, 
                 b => b,
                 o => o1_sig);
                 
    u2:xor_gate 
        port map(a => o1_sig, 
                 b => c_in,
                 o => sum);
    
    u3:and_gate 
        port map(a => a, 
                 b => b,
                 o => o2_sig);  
                 
    u4:and_gate 
        port map(a => o1_sig, 
                 b => c_in,
                 o => o3_sig);  
                 
    u5:or_gate 
        port map(a => o3_sig, 
                 b => o2_sig,
                 o => c_out);               
       

end Structural;