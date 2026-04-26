library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MealyNo_overlapping_3bit is
    port (
        clk : in std_logic;
        rst : in std_logic;
        x   : in std_logic;
        z   : out std_logic
    );
end MealyNo_overlapping_3bit;

architecture Behavioral of MealyNo_overlapping_3bit is

    type state is (s0, s1, s2);
    signal prstate, nxtstate : state;

begin

    process(clk, rst)
    begin
        if rst = '1' then
            prstate <= s0;
        elsif rising_edge(clk) then
            prstate <= nxtstate;
        end if;
    end process;

   
    process(prstate, x)
    begin
        
        nxtstate <= s0;
        z <= '0';

        case prstate is
            when s0 =>
                if x = '1' then
                    nxtstate <= s1;
                else
                    nxtstate <= s0;
                end if;

            when s1 =>
                if x = '1' then
                    nxtstate <= s2;
                else
                    nxtstate <= s0;
                end if;

            when s2 =>
                if x = '1' then
                    z <= '1';        
                    nxtstate <= s0;  
                else
                    nxtstate <= s0;
                end if;
        end case;
    end process;

end architecture;