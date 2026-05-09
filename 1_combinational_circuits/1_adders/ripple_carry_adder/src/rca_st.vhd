library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity rca_st is

    port(a : in std_logic_vector(3 downto 0);
         b : in std_logic_vector(3 downto 0);
         c_in : in std_logic;
         sum : out std_logic_vector(3 downto 0);
         c_out : out std_logic);
    
end rca_st;

architecture Structural of rca_st is

    component full_adder_st is

        port(a: in std_logic;
             b: in std_logic;
             c_in: in std_logic;
             sum: out std_logic;
             c_out: out std_logic);
    
    end component;
    
    component full_adder_bh is

        port(a : in std_logic;
             b : in std_logic;
             c_in : in std_logic;
             sum : out std_logic;
             c_out : out std_logic);
           
    end component;
    
    component full_adder_df is

        port(a : in std_logic;
             b : in std_logic;
             c_in : in std_logic;
             sum : out std_logic;
             c_out : out std_logic);
         
    end component;
    
    signal s1, s2, s3 : std_logic;

begin


    u1:full_adder_st port map(a => a(0),
                              b => b(0),
                              sum => sum(0),
                              c_in => c_in,
                              c_out => s1
                              );
                              
     u2:full_adder_df port map(a => a(1),
                               b => b(1),
                               sum => sum(1),
                               c_in => s1,
                               c_out => s2
                               );  
                               
     u3:full_adder_bh port map(a => a(2),
                               b => b(2),
                               sum => sum(2),
                               c_in => s2,
                               c_out => s3
                               );    
                               
     u4:full_adder_df port map(a => a(3),
                               b => b(3),
                               sum => sum(3),
                               c_in => s3,
                               c_out => c_out
                               );                                               


end Structural;