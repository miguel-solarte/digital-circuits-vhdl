library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity demux1_4_bh is

    port(x : in std_logic;
         s0 : in std_logic;
         s1 : in std_logic;
         a : out std_logic;
         b : out std_logic;
         c : out std_logic;
         d : out std_logic);
         
end demux1_4_bh;

architecture Behavioral of demux1_4_bh is
begin

    process(x, s0, s1)
    begin

        if (s1 = '0' and s0 = '0') then
            a <= x;
            b <= '0';
            c <= '0';
            d <= '0';

        elsif (s1 = '0' and s0 = '1') then
            a <= '0';
            b <= x;
            c <= '0';
            d <= '0';

        elsif (s1 = '1' and s0 = '0') then
            a <= '0';
            b <= '0';
            c <= x;
            d <= '0';

        else
            a <= '0';
            b <= '0';
            c <= '0';
            d <= x;
        end if;

    end process;

end Behavioral;