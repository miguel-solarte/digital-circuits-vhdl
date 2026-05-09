library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RS_FF_tb is
end RS_FF_tb;

architecture Behavioral of RS_FF_tb is

    signal S     : std_logic := '0';
    signal R     : std_logic := '0';
    signal clk   : std_logic := '0';
    signal rst   : std_logic := '0';
    signal Q     : std_logic;
    signal Q_bar : std_logic;

begin

    uut: entity work.RS_FF
        port map(
            S     => S,
            R     => R,
            clk   => clk,
            rst   => rst,
            Q     => Q,
            Q_bar => Q_bar
        );

    clk_proc: process
    begin
        while true loop
            clk <= '0';
            wait for 10 ns;
            clk <= '1';
            wait for 10 ns;
        end loop;
    end process;

    
    tb_rs_ff: process
    begin

        S <= '0';
        R <= '0';
        wait for 40 ns;

        S <= '0';
        R <= '1';
        wait for 40 ns;

        S <= '1';
        R <= '0';
        wait for 40 ns;

        S <= '1';
        R <= '1';
        wait for 40 ns;
        
        S <= '1';
        R <= '0';
        rst <= '1';
        wait for 40 ns;
        wait;

    end process;

end Behavioral;