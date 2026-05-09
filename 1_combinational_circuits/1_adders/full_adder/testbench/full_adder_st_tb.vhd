library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder_st_tb is
end full_adder_st_tb;

architecture Behavioral of full_adder_st_tb is

    signal a : std_logic := '0';
    signal b : std_logic := '0';
    signal c_in : std_logic := '0';
    signal sum : std_logic;
    signal c_out : std_logic;
    
begin

    uut:entity work.full_adder_st
        port map(a => a,
                 b => b,
                 c_in => c_in,
                 sum => sum,
                 c_out => c_out);
                 
    tb_full_adder: process
    
        begin   
            
            a <= '0';
            b <= '0';
            c_in <= '0';
            
            wait for 100ns;
            
            a <= '1';
            b <= '0';
            c_in <= '0';
            
            wait for 100ns;
            
            a <= '0';
            b <= '1';
            c_in <= '0';
            
            wait for 100ns;
            
            a <= '1';
            b <= '1';
            c_in <= '0';
            
            wait for 100ns;
            
            a <= '0';
            b <= '0';
            c_in <= '1';
            
            wait for 100ns;
            
            a <= '1';
            b <= '0';
            c_in <= '1';
            
            wait for 100ns;
            
            a <= '0';
            b <= '1';
            c_in <= '1';
            
            wait for 100ns;
            
            a <= '1';
            b <= '1';
            c_in <= '1';
            
            wait for 100ns;
            
            wait;
            
    end process;      

end Behavioral;