library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity encoder_4to2_bh is

    port(a : in std_logic_vector(3 downto 0);
         y : out std_logic_vector(1 downto 0));

end encoder_4to2_bh;

architecture Behavioral of encoder_4to2_bh is

begin

    process(a)

    begin

        if (a(3) = '1') then

            y <= "11";

        elsif (a(2) = '1') then

            y <= "10";

        elsif (a(1) = '1') then

            y <= "01";
            
        elsif (a(0) = '1') then

            y <= "00";
            
        else

            y <= "00";

        end if;

    end process;

end Behavioral;