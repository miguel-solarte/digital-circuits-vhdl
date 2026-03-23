library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decoder_2to4_df_tb is
end decoder_2to4_df_tb;

architecture Behavioral of decoder_2to4_df_tb is

    signal I : std_logic_vector(1 downto 0) := "00";
    signal O : std_logic_vector(3 downto 0);


begin

    uut:entity work.decoder_2to4_df
        port map(I => I,
                 O => O);
            
    tb_encoder:process

        begin

            I <= "00";

            wait for 100ns;

            I <= "01";

            wait for 100ns;

            I <= "10";

            wait for 100ns;

            I <= "11";
           
            wait;

    end process;

end Behavioral;