library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity half_adder_tb is
end half_adder_tb;

architecture Behavioral of half_adder_tb is

    signal a : std_logic := '0';
    signal b : std_logic := '0';
    signal sum : std_logic;
    signal c_out : std_logic;
    
begin

    uut:entity work.half_adder_st
        port map(
            a => a,
            b => b,
            sum => sum,
            c_out => c_out
        );
        
    tb_half_adder: process
        begin
        
        a <= '0';
        b <= '0';
        
        wait for 100 ns;
        
        a <= '0';
        b <= '1';
        
        wait for 100 ns;
        
        a <= '1';
        b <= '0';
        
        wait for 100 ns;
        
        a <= '1';
        b <= '1';
        
        wait for 100 ns;
        
        wait;
        
            
    end process;


end Behavioral;