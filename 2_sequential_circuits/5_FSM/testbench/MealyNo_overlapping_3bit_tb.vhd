library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MealyNo_overlapping_3bit_tb is
end MealyNo_overlapping_3bit_tb;

architecture sim of MealyNo_overlapping_3bit_tb is

    constant clk_period : time := 20 ns;

    signal clk : std_logic := '0';
    signal rst : std_logic := '0';
    signal x   : std_logic := '0';
    signal z   : std_logic;


    signal data_input : std_logic_vector(7 downto 0) := "11101110"; 

begin

  
    uut: entity work.MealyNo_overlapping_3bit
        port map (
            clk => clk,
            rst => rst,
            x   => x,
            z   => z
        );

  
    clk_pr: process
    begin
        clk <= '0'; wait for clk_period / 2;
        clk <= '1'; wait for clk_period / 2;
    end process;

  
    seq: process
    begin
        
        rst <= '1';
        wait for clk_period * 2;
        rst <= '0';
        wait until falling_edge(clk);

        for i in 0 to 7 loop
            wait until falling_edge(clk);
            x <= data_input(i);
            wait until rising_edge(clk);
            x <= '0';
        end loop;

        x <= '0';
        wait;
    end process;

end architecture;