library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BintoBCD_16bit_tb is
end BintoBCD_16bit_tb;

architecture Behavioral of BintoBCD_16bit_tb is

    signal B_in : std_logic_vector(15 downto 0) := (others => '0');
    signal Y_bcd0 : std_logic_vector(3 downto 0);
    signal Y_bcd1 : std_logic_vector(3 downto 0);
    signal Y_bcd2 : std_logic_vector(3 downto 0);
    signal Y_bcd3 : std_logic_vector(3 downto 0);

begin

    uut:entity work.BintoBCD_16bit
        port map(
            B_in => B_in,
            Y_bcd3 => Y_bcd3,
            Y_bcd2 => Y_bcd2,
            Y_bcd1 => Y_bcd1,
            Y_bcd0 => Y_bcd0
        );
            
    tb_bs:process

        begin

            B_in <= (others => '1');

            wait for 100ns;

            B_in <= "0000010011010010";

           
            wait;

    end process;

end Behavioral;