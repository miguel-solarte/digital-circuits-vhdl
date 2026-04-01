library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity D_latch_df_tb is
end D_latch_df_tb;

architecture Behavioral of D_latch_df_tb is

    signal d : std_logic := '0';
    signal en : std_logic := '0';
    signal q : std_logic;
    signal q_bar : std_logic;

begin

    uut:entity work.D_latch_df
        port map(d => d,
                 en => en,
                 q => q,
                 q_bar => q_bar);
                 
    tb_d_latch:process
        
        begin
        
        en <= '0';
        d <= '0';
    
        wait for 100ns;
        
        en <= '0';
        d <= '1';
    
        wait for 100ns;
        
        en <= '1';
        d <= '0';
    
        wait for 100ns;
        
        en <= '1';
        d <= '1';
        
        wait for 100ns;
        
        en <= '0';
        d <= '0';
        
        wait for 100ns;
        
        en <= '1';
        d <= '0';

        wait;
        
    end process;
       


end Behavioral;