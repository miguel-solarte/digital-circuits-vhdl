library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity counter_4bit is

    port(clr : in std_logic;
         clk : in std_logic;
         Q : out std_logic_vector(3 downto 0));

end counter_4bit;

architecture Structural of counter_4bit is

    component JK_FF is
        port(
            J     : in STD_LOGIC;
            K     : in STD_LOGIC;
            clk   : in STD_LOGIC;
            rst   : in STD_LOGIC;
            Q     : out STD_LOGIC;
            Q_bar : out STD_LOGIC
        );
    end component;

    signal qbar_s0, qbar_s1, qbar_s2 : std_logic;
    signal clr_s : std_logic; 
    signal vdd : std_logic := '1'; 

begin

    clr_s <= clr;

    ff_jk0: JK_FF port map(J => vdd, K => vdd, clk => clk,      rst => clr_s, Q => Q(0), Q_bar => qbar_s0);
    ff_jk1: JK_FF port map(J => vdd, K => vdd, clk => qbar_s0,  rst => clr_s, Q => Q(1), Q_bar => qbar_s1);
    ff_jk2: JK_FF port map(J => vdd, K => vdd, clk => qbar_s1,  rst => clr_s, Q => Q(2), Q_bar => qbar_s2);
    ff_jk3: JK_FF port map(J => vdd, K => vdd, clk => qbar_s2,  rst => clr_s, Q => Q(3), Q_bar => open);

end Structural;