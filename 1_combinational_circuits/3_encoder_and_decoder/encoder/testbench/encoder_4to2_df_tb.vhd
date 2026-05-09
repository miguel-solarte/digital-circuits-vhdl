library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity encoder_4to2_df_tb is
end encoder_4to2_df_tb;

architecture Behavioral of encoder_4to2_df_tb is

    signal a : std_logic_vector(3 downto 0) := "0000";
    signal y : std_logic_vector(1 downto 0);


begin

    uut:entity work.encoder_4to2_df
        port map(a => a,
                 y => y);
            
    tb_encoder:process

        begin

            a <= "0001";

            wait for 100ns;

            a <= "0010";

            wait for 100ns;

            a <= "0100";

            wait for 100ns;

            a <= "1000";
           
            wait;

    end process;

end Behavioral;