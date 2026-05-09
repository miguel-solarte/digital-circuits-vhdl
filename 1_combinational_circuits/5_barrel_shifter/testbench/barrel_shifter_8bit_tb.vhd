library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity barrel_shifter_8bit_tb is
end barrel_shifter_8bit_tb;

architecture Behavioral of barrel_shifter_8bit_tb is

    signal A : std_logic_vector(7 downto 0) := "00000001";
    signal S : std_logic_vector(2 downto 0) := (others => '0');
    signal Y : std_logic_vector(7 downto 0);

begin

    uut:entity work.barrel_shifter_8bit
        port map(
            A => A,
            S => S,
            Y => Y
        );
            
    tb_bs:process

        begin

            S <= "000";

            wait for 100ns;

            S <= "001";

            wait for 100ns;

            S <= "010";

            wait for 100ns;

            S <= "011";

            wait for 100ns;

            S <= "100";

            wait for 100ns;

            S <= "101";

            wait for 100ns;

            S <= "110";

            wait for 100ns;

            S <= "111";

            wait for 100ns;
           
            wait;

    end process;

end Behavioral;