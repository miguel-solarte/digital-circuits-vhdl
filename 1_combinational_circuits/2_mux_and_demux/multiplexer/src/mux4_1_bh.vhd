library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux4_1_bh is

    port(a : in std_logic;
         b : in std_logic;
         c : in std_logic;
         d : in std_logic;
         s0 : in std_logic;
         s1 : in std_logic;
         y : out std_logic);
         
end mux4_1_bh;

architecture Behavioral of mux4_1_bh is
begin

    process(a,b,c,d,s0,s1)

        begin

            if(s1 = '0' and s0 = '0') then
                y <= a;
            elsif(s1 = '0' and s0 = '1') then
                y <= b;
            elsif(s1 = '1' and s0 = '0') then
                y <= c;
            else
                y <= d;
            end if;

    end process;


end Behavioral;