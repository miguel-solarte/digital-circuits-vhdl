library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity universal_register_tb is
end universal_register_tb;

architecture Behavioral of universal_register_tb is

    signal I : std_logic_vector(3 downto 0) := "0000";
    signal S : std_logic_vector(1 downto 0);
    signal in_shft_l : std_logic := '1';
    signal in_shft_r : std_logic;
    signal clr : std_logic := '0';
    signal clk : std_logic;
    signal O : std_logic_vector(3 downto 0);

    signal data_input_serial : std_logic_vector(3 downto 0) := "0101";
    signal data_input_parallel : std_logic_vector(3 downto 0) := "0110";

    begin

        uut:entity work.universal_register
            port map(I => I,
                 S => S,
                 in_shft_l => in_shft_l,
                 in_shft_r => in_shft_r,
                 clr => clr,
                 clk => clk,
                 O => O);

        process 
        
            begin

                while true loop

                    clk <= '0';
                    wait for 10ns;
                    clk <= '1';
                    wait for 10ns;    

                end loop;

        end process;

        process 

            begin
            
--===================================================================================  
            
                clr <= '0';

                S <= "01"; --rigth

                for i in 0 to 3 loop

                    in_shft_r <= data_input_serial(i);
                    wait until rising_edge(clk);
                    

                end loop;
                
                S <= "00"; --no change
                
                wait for 60ns;

                clr <= '1';
                wait for 100ns;
--===================================================================================  

--===================================================================================  
                clr <= '0';

                S <= "10"; --left

                for i in 3 downto 0 loop
                    
                    wait until rising_edge(clk);
                    in_shft_l <= data_input_serial(i);
                    

                end loop;
                
                S <= "00"; --no change
                
                wait for 60ns;

                clr <= '1';
                wait for 100ns;
--===================================================================================     
           
--===================================================================================                 
                clr <= '0';

                S <= "11";

                I <= data_input_parallel;
                wait until rising_edge(clk);
                
                wait for 1 ns;
                
                S <= "00"; --no change
    
                wait for 100ns;


                clr <= '1';
                wait;

--=================================================================================== 

        end process;


end Behavioral;