library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity D_FF_tb is
end D_FF_tb;

architecture Behavioral of D_FF_tb is

    signal D     : std_logic := '0';
    signal clk   : std_logic := '0';
    signal rst   : std_logic := '0';
    signal Q     : std_logic;
    signal Q_bar : std_logic;

begin

    uut: entity work.D_FF
        port map(
            D     => D,
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

    
    tb_d_ff: process
    begin

        D <= '0';
        wait for 40 ns;

        D <= '1';
        wait for 40 ns;

        D <= '0';
        wait for 40 ns;

        D <= '1';
        wait for 40 ns;

        D <= '1';
        rst <= '1';
        wait for 40 ns;

        wait;

    end process;

end Behavioral;