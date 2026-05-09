library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity comparator_4bit_bh_tb is
end comparator_4bit_bh_tb;

architecture Behavioral of comparator_4bit_bh_tb is

    signal A : std_logic_vector(3 downto 0) := "0000";
    signal B : std_logic_vector(3 downto 0) := "0000";
    signal Y : std_logic_vector(2 downto 0);


begin

    uut:entity work.comparator_4bit_bh
        port map(A => A,
                 B => B,
                 Y => Y);
            
    tb_comparator:process

        begin

            A <= "1101";
            B <= "1101";

            wait for 100ns;

            A <= "1000";
            B <= "0000";

            wait for 100ns;

            A <= "1000";
            B <= "1010";
           
            wait;

    end process;

end Behavioral;