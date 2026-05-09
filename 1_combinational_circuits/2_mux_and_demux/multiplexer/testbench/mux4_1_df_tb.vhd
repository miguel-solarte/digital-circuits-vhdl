library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux4_1_df_tb is
end mux4_1_df_tb;

architecture Behavioral of mux4_1_df_tb is

    signal a : std_logic := '1';
    signal b : std_logic := '0';
    signal c : std_logic := '1';
    signal d : std_logic := '0';
    signal s0, s1, y : std_logic;


begin

    uut:entity work.mux4_1_df
        port map(a => a,
                 b => b,
                 c => c,
                 d => d,
                 s0 => s0,
                 s1 => s1,
                 y => y);
                
    

    tb_mux4_1:process

        begin

            s0 <= '0';
            s1 <= '0';

            wait for 100ns;

            s0 <= '1';
            s1 <= '0';

            wait for 100ns;

            s0 <= '0';
            s1 <= '1';

            wait for 100ns;

            s0 <= '1';
            s1 <= '1';

            wait for 100ns;

            wait;

    end process;

end Behavioral;