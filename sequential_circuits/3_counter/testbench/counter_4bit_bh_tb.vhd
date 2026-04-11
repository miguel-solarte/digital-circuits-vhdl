library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity counter_4bit_bh_tb is
end counter_4bit_bh_tb;

architecture Behavioral of counter_4bit_bh_tb is

    

    signal clr : std_logic := '0';
    signal clk : std_logic;
    signal Q : std_logic_vector(3 downto 0);

    begin

        uut:entity work.counter_4bit_bh
            port map(clr => clr,
                     clk => clk,
                     Q => Q);


        clock: process
        
            begin
            
                while true loop
                
                    clk <= '0';
                    
                    wait for 100 ns;
                    
                    clk <= '1';
                    
                    wait for 100 ns;
                    
                end loop;
                
            end process;
            
         stim_proc: process
        
             begin
            
                 clr <= '1';
                 wait for 300 ns;
            
                 clr <= '0';
            
                 wait;

         end process;
                     
        

end Behavioral;