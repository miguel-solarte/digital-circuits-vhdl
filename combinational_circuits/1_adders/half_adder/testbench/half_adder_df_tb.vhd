library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity half_adder_df_tb is
end half_adder_df_tb;

architecture Behavioral of half_adder_df_tb is

    signal a: std_logic := '0';
    signal b: std_logic := '0';
    signal sum : std_logic;
    signal c_out : std_logic;

begin

    uut:entity work.half_adder_df
    port map(a => a,
             b => b,
             sum => sum,
             c_out =>c_out    
    );
    
    tb_half_adder_df: process
    
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