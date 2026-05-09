library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decoder_2to4_bh is

    port(I : in std_logic_vector(1 downto 0);
         O : out std_logic_vector(3 downto 0));

end decoder_2to4_bh;

architecture Behavioral of decoder_2to4_bh is 

begin

    process(I)

    begin

        case I is

            when "00" => O <= "0001";
            when "01" => O <= "0010";
            when "10" => O <= "0100";
            when others => O <= "1000";
            
        end case;
        
    end process;
    

end Behavioral;