library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity BCDto7seg is
    port (
        BCD     : in std_logic_vector(3 downto 0);
        SEV_SEG : out std_logic_vector(7 downto 0)
    );
end BCDto7seg;

architecture Behavioral of BCDto7seg is

begin

    process(BCD)
    begin

        case BCD is
        
            when "0000" => SEV_SEG <= "00000011"; -- 0
            when "0001" => SEV_SEG <= "10011111"; -- 1
            when "0010" => SEV_SEG <= "00100101"; -- 2
            when "0011" => SEV_SEG <= "00001101"; -- 3
            when "0100" => SEV_SEG <= "10011001"; -- 4
            when "0101" => SEV_SEG <= "01001001"; -- 5
            when "0110" => SEV_SEG <= "01000001"; -- 6
            when "0111" => SEV_SEG <= "00011111"; -- 7 
            when "1000" => SEV_SEG <= "00000001"; -- 8
            when "1001" => SEV_SEG <= "00001001"; -- 9
            when others => SEV_SEG <= "11111111";
        
        end case;
    
    end process;

end architecture;