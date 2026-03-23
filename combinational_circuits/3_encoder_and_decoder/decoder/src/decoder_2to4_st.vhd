library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decoder_2to4_st is

    port(I : in std_logic_vector(1 downto 0);
         O : out std_logic_vector(3 downto 0));

end decoder_2to4_st;

architecture Behavioral of decoder_2to4_st is

    component and_gate is

        port(a : in STD_LOGIC;
             b : in STD_LOGIC;
             o : out STD_LOGIC);
           
    end component;

    component not_gate is

        port(a: in std_logic;
             o: out std_logic);
    
    end component;

    signal not0_sig, not1_sig : std_logic; 

begin

    not1:not_gate port map(a => I(0), o => not0_sig);
    not2:not_gate port map(a => I(1), o => not1_sig);

    gate0:and_gate port map(a => not0_sig, b => not1_sig, o => O(0));
    gate1:and_gate port map(a => I(0), b => not1_sig, o => O(1));
    gate2:and_gate port map(a => not0_sig, b => I(1), o => O(2));
    gate3:and_gate port map(a => I(0), b => I(1), o => O(3));

end Behavioral;