library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity shift_register_5bit_tb is
end shift_register_5bit_tb;

architecture Behavioral of shift_register_5bit_tb is

    signal D_in : std_logic;
    signal clk : std_logic;
    signal rst : std_logic := '0';
    signal D_out : std_logic;
    
    signal data_input : std_logic_vector(4 downto 0) := "10011";

    begin
    
        uut:entity work.shift_register_5bit
        port map(
                 D_in => D_in,
                 clk => clk,
                 rst => rst,
                 D_out => D_out
        );


        process
        
            begin

                while true loop
        
                    clk <= '0';
                    wait for 10 ns;
        
                    clk <= '1';
                    wait for 10 ns;
        
                end loop;

        end process;
        
        process
        
            begin

                for i in 4 downto 0 loop
    
                    D_in <= data_input(i);
                    wait until rising_edge(clk);
    
                end loop;
                

        end process;
        
        process
            
            begin
            
                rst <= '0';
    
                wait for 400 ns;
                
                rst <= '1';
                
                wait;
        
        end process;



        
end Behavioral;