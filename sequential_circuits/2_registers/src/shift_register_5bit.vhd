library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity shift_register_5bit is

    port(D_in : in std_logic;
         clk : in std_logic;
         rst : in std_logic;
         D_out : out std_logic);

end shift_register_5bit;

architecture Structural of shift_register_5bit is

    component D_FF is

        port(D : in STD_LOGIC;
             clk : in STD_LOGIC;
             rst : in STD_LOGIC;
             Q : out STD_LOGIC;
             Q_bar : out STD_LOGIC);
           
    end component;

    signal Q_signal : std_logic_vector(3 downto 0); 

    begin

        d_ff0:D_FF port map(D => D_in, clk => clk, rst => rst, Q => Q_signal(0), Q_bar => open);
        d_ff1:D_FF port map(D => Q_signal(0), clk => clk, rst => rst, Q => Q_signal(1), Q_bar => open);
        d_ff2:D_FF port map(D => Q_signal(1), clk => clk, rst => rst, Q => Q_signal(2), Q_bar => open);
        d_ff3:D_FF port map(D => Q_signal(2), clk => clk, rst => rst, Q => Q_signal(3), Q_bar => open);
        d_ff4:D_FF port map(D => Q_signal(3), clk => clk, rst => rst, Q => D_out, Q_bar => open);

end Structural;