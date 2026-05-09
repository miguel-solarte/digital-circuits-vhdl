library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity rca_bh_tb is
end rca_bh_tb;

architecture Behavioral of rca_bh_tb is

signal a, b, sum : std_logic_vector(3 downto 0);
    signal c_in, c_out : std_logic;

begin
    
    uut:entity work.rca_bh
        port map(a => a,
                 b => b,
                 sum => sum,
                 c_in => c_in,
                 c_out => c_out);
                 
    sim_rca:process
        begin
        
            a <= "0000";
            b <= "1010";
            c_in <= '0';
             
            wait for 100ns;
            
            a <= "1010";
            b <= "1010";
            c_in <= '0';
             
            wait for 100ns;
            
            a <= "1100";
            b <= "0011";
            c_in <= '1';
             
            wait for 100ns;
            
            a <= "1001";
            b <= "0101";
            c_in <= '1';
             
            wait for 100ns;
            
            a <= "0000";
            b <= "0000";
            c_in <= '1';
             
            wait for 100ns;
            
            wait;
    end process;


end Behavioral;