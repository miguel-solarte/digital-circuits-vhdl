library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BintoBCD_4bit_tb is
end BintoBCD_4bit_tb;

architecture Behavioral of BintoBCD_4bit_tb is

    signal B_in : std_logic_vector(3 downto 0) := (others => '0');
    signal Y_bcd : std_logic_vector(4 downto 0);

begin

    uut:entity work.BintoBCD_4bit
        port map(
            B_in => B_in,
            Y_bcd => Y_bcd
        );
            
    tb_bs:process

        begin

            B_in <= "0000";

            wait for 100ns;

            B_in <= "0001";

            wait for 100ns;

            B_in <= "0010";

            wait for 100ns;

            B_in <= "0011";

            wait for 100ns;

            B_in <= "0100";

            wait for 100ns;

            B_in <= "0101";

            wait for 100ns;

            B_in <= "0110";

            wait for 100ns;

            B_in <= "0111";

            wait for 100ns;

            B_in <= "1000";

            wait for 100ns;

            B_in <= "1001";

            wait for 100ns;

            B_in <= "1010";

            wait for 100ns;

            B_in <= "1011";

            wait for 100ns;

            B_in <= "1100";

            wait for 100ns;

            B_in <= "1101";

            wait for 100ns;

            B_in <= "1111";
           
            wait;

    end process;

end Behavioral;