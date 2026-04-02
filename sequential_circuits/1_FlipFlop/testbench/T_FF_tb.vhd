library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity T_FF_tb is
end T_FF_tb;

architecture Behavioral of T_FF_tb is

    signal T     : std_logic := '0';
    signal clk     : std_logic := '0';
    signal rst   : std_logic := '0';
    signal Q     : std_logic;
    signal Q_bar : std_logic;

begin

    uut: entity work.T_FF
        port map(
            T     => T,
            clk   => clk,
            rst   => rst,
            Q     => Q,
            Q_bar => Q_bar
        );

    clk_proc: process
    begin
        while true loop
            clk <= '0';
            wait for 5 ns;
            clk <= '1';
            wait for 5 ns;
        end loop;
    end process;

    
    tb_t_ff: process
    begin

        T <= '0';
        
        wait for 40 ns;

        T <= '1';
        
        wait for 40 ns;
        
        T <= '1';
        rst <= '1';
        wait; 

    end process;

end Behavioral;