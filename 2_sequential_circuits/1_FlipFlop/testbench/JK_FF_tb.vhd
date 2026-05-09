library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity JK_FF_tb is
end JK_FF_tb;

architecture Behavioral of JK_FF_tb is

    signal J     : std_logic := '0';
    signal K     : std_logic := '0';
    signal clk   : std_logic := '0';
    signal rst   : std_logic := '0';
    signal Q     : std_logic;
    signal Q_bar : std_logic;

begin

    uut: entity work.JK_FF
        port map(
            J     => J,
            K     => K,
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

    
    tb_jk_ff: process
    begin

        J <= '0';
        K<= '0';
        wait for 40 ns;

        J <= '0';
        K <= '1';
        wait for 40 ns;

        J <= '1';
        K <= '0';
        wait for 40 ns;

        J <= '1';
        K <= '1';
        wait for 40 ns;
        
        J <= '1';
        K <= '0';
        rst <= '1';
        wait for 40 ns;

    end process;

end Behavioral;