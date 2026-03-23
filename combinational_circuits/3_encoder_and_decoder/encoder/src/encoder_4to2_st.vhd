library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity encoder_4to2_st is

    port(a : in std_logic_vector(3 downto 0);
         y : out std_logic_vector(1 downto 0));

end encoder_4to2_st;

architecture Structural of encoder_4to2_st is

    component or_gate is

        port(a : in std_logic;
             b : in std_logic;
             o : out std_logic);
        
    end component;

    begin

        or1:or_gate port map(a => a(1),
                             b => a(3),
                             o => y(0));

        or2:or_gate port map(a => a(2),
                             b => a(3),
                             o => y(1));       

end Structural;