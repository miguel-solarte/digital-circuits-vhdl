library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MooreNo_overlapping_3bit is
    port (
        clk : in std_logic;
        rst : in std_logic;
        x   : in std_logic;
        z   : out std_logic
    );
end MooreNo_overlapping_3bit;

architecture Behavioral of MooreNo_overlapping_3bit is

    type state is (s0, s1, s2, s3);
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
                    nxtstate <= s3; 
                else 
                    nxtstate <= s0; 
                end if;

            when s3 => 
                if x = '1' then 
                    nxtstate <= s3; 
                else 
                    nxtstate <= s0; 
                end if;

        end case;
    end process;

    process(prstate)
    begin
        case prstate is
            when s3 => z <= '1'; 
            when others => z <= '0';
        end case;
    end process;

    -- process(prstate)
    -- begin
    --     case prstate is
    --         when s0 => z <= '0';
    --         when s1 => z <= '0'; 
    --         when s2 => z <= '0'; 
    --         when s3 => z <= '1'; 
    --     end case;
    -- end process;

end architecture;