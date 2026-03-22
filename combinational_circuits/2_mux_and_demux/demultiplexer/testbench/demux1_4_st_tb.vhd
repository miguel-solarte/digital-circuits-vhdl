library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity demux1_4_st_tb is
end demux1_4_st_tb;

architecture Behavioral of demux1_4_st_tb is

    signal x : std_logic;
    signal a : std_logic;
    signal b : std_logic;
    signal c : std_logic;
    signal d : std_logic;
    signal s0, s1 : std_logic;


begin

    uut:entity work.demux1_4_st
        port map(x => x,
                 s0 => s0,
                 s1 => s1,
                 a => a,
                 b => b,
                 c => c,
                 d => d);
                
    tb_demux4_1:process

        begin

            x <= '1';


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

            wait;

    end process;

end Behavioral;