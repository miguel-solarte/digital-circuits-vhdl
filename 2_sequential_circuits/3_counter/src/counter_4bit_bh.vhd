library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity counter_4bit_bh is

    port(clr : in std_logic;
        clk : in std_logic;
        Q   : out std_logic_vector(3 downto 0));

end counter_4bit_bh;

architecture Behavioral of counter_4bit_bh is

    signal q_s : std_logic_vector(3 downto 0) := x"0";

begin

    process(clk, clr)
    begin

        if clr = '1' then
            q_s <= x"0";

        elsif rising_edge(clk) then

            if q_s = x"F" then
            
                q_s <= x"0";
                
            else
            
                q_s <= q_s + x"1";
                
            end if;

        end if;

    end process;

    Q <= q_s;

end Behavioral;