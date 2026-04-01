library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity D_latch_st_tb is
end D_latch_st_tb;

architecture Behavioral of D_latch_st_tb is

    signal data : std_logic := '0';
    signal enable : std_logic := '0';
    signal q : std_logic;
    signal q_bar : std_logic;

begin

    uut:entity work.D_latch_st
        port map(data => data,
                 enable => enable,
                 q => q,
                 q_bar => q_bar);
                 
    tb_d_latch:process
        
        begin
        
        enable <= '0';
        data <= '0';
    
        wait for 100ns;
        
        enable <= '0';
        data <= '1';
    
        wait for 100ns;
        
        enable <= '1';
        data <= '0';
    
        wait for 100ns;
        
        enable <= '1';
        data <= '1';
        
        wait for 100ns;
        
        enable <= '0';
        data <= '0';
        
        wait for 100ns;
        
        enable <= '1';
        data <= '0';

        wait;
        
    end process;
       


end Behavioral;