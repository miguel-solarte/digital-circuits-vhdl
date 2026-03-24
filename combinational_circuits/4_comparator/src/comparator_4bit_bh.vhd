library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity comparator_4bit_bh is

    port(A : in std_logic_vector(3 downto 0);
         B : in std_logic_vector(3 downto 0);
         Y : out std_logic_vector(2 downto 0));

end comparator_4bit_bh;

architecture Behavioral of comparator_4bit_bh is

    begin

        process(A,B)

            begin

                if(A = B) then

                    Y <= "001";

                elsif(A > B) then

                    Y <= "010";

                else
                    
                    Y <= "100";
                    
                end if;

        end process;

end Behavioral;