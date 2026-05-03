library ieee;
use ieee.std_logic_1164.all;

entity debouncer_tb is
end debouncer_tb;

architecture Behavioral of debouncer_tb is

   
    constant clk_period : time := 20 ns;

    signal clk : std_logic := '0';
    signal input : std_logic := '0';
    signal output : std_logic;

begin

    
    uut:entity work.debouncer
        generic map (
            num_pulses => 10
        )
        port map (
            clk    => clk,
            input  => input,
            output => output
        );

    clk_process:process
    begin
        clk <= '0'; wait for clk_period / 2; 
        clk <= '1'; wait for clk_period / 2; 
    end process;

    stim_proc:process
    begin
        
        wait for clk_period * 2;
    
        input <= '1'; wait for 40 ns;
        input <= '0'; wait for 80 ns;
        input <= '1'; wait for 50 ns;
        input <= '0'; wait for 100 ns;
        input <= '1'; wait for 20 ns;
        input <= '0'; wait for 50 ns;
        
        
        
        input <= '1';
        wait for 500 ns;
        input <= '0'; wait for 40 ns;
        input <= '1'; wait for 20 ns;
        input <= '0'; wait for 30 ns;
        input <= '1'; wait for 25 ns;
        input <= '0';
        wait;
        
    end process;

end architecture;