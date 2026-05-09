library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity and_gate_tb is
end and_gate_tb;

architecture Behavioral of and_gate_tb is

    signal a : std_logic := '0';
    signal b : std_logic := '0';
    signal o : std_logic;

begin

    uut:entity work.and_gate
        port map(a => a,
                 b => b,
                 o => o);
                 
    tb_and:process
        
        begin
        
        a <= '0';
        b <= '0';
    
        wait for 100ns;
        
        a <= '0';
        b <= '1';
    
        wait for 100ns;
        
        a <= '1';
        b <= '0';
    
        wait for 100ns;
        
        a <= '1';
        b <= '1';
    
        wait for 100ns;
        
        wait;
        
    end process;
       


end Behavioral;