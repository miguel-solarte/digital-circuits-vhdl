library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity not_gate_tb is
end not_gate_tb;

architecture Behavioral of not_gate_tb is

    signal a : std_logic := '0';
    signal o : std_logic;

begin

    uut:entity work.not_gate
        port map(a => a,
                 o => o);
                 
    tb_and:process
        
        begin
        
        a <= '0';
    
        wait for 100ns;
        
        a <= '1';
    
        wait for 100ns;
        
        wait;
        
    end process;


end Behavioral;