library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity universal_register is

    port(I : in std_logic_vector(3 downto 0);
         S : in std_logic_vector(1 downto 0);
         in_shft_l: in std_logic;
         in_shft_r: in std_logic;
         clr : in std_logic;
         clk : in std_logic;
         O : out std_logic_vector(3 downto 0));

end universal_register;

architecture Structural of universal_register is

    component D_FF is

        port(D : in STD_LOGIC;
             clk : in STD_LOGIC;
             rst : in STD_LOGIC;
             Q : out STD_LOGIC;
             Q_bar : out STD_LOGIC);
           
    end component;

    component mux4_1_df is

        port(a : in std_logic;
             b : in std_logic;
             c : in std_logic;
             d : in std_logic;
             s0 : in std_logic;
             s1 : in std_logic;
             y : out std_logic);
            
    end component;

    signal a_s0, b_s0, b_s1, b_s2 : std_logic;
    signal y_s, q_s : std_logic_vector(3 downto 0);
    
    begin

        mux0:mux4_1_df port map(a => a_s0, b => b_s0, c => in_shft_l, d => I(0), s0 => S(0), s1 => S(1), y => y_s(0));
        mux1:mux4_1_df port map(a => b_s0, b => b_s1, c => a_s0, d => I(1), s0 => S(0), s1 => S(1), y => y_s(1));
        mux2:mux4_1_df port map(a => b_s1, b => b_s2, c => b_s0, d => I(2), s0 => S(0), s1 => S(1), y => y_s(2));
        mux3:mux4_1_df port map(a => b_s2, b => in_shft_r, c => b_s1, d => I(3), s0 => S(0), s1 => S(1), y => y_s(3));

        dff0:D_FF port map(D => y_s(0), clk => clk, rst => clr, Q => a_s0, Q_bar => open);
        dff1:D_FF port map(D => y_s(1), clk => clk, rst => clr, Q => b_s0, Q_bar => open);
        dff2:D_FF port map(D => y_s(2), clk => clk, rst => clr, Q => b_s1, Q_bar => open);
        dff3:D_FF port map(D => y_s(3), clk => clk, rst => clr, Q => b_s2, Q_bar => open);

        O(0) <= a_s0;
        O(1) <= b_s0;
        O(2) <= b_s1;
        O(3) <= b_s2;
        
end Structural;