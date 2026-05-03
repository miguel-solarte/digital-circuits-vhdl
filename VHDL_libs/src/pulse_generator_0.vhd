library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pulse_generator_0 is

    port(
        clk : in std_logic;
        input :in std_logic;
        output : out std_logic
    );
    
end pulse_generator_0;

architecture Behavioral of pulse_generator_0 is

    type state is (s0, s1);
    signal prstate, nxtstate : state;

begin

    process(clk)
    begin
        if rising_edge(clk) then
            prstate <= nxtstate;
        end if;
    end process;

    process(prstate, input)
    begin

        case prstate is
            when s0 =>
                if input = '1' then
                    output <= '1';
                    nxtstate <= s1;
                else
                    output <= '0';
                    nxtstate <= s0;
                end if;

            when s1 =>
                if input = '1' then
                    output <= '0';
                    nxtstate <= s1;
                else
                    output <= '0';
                    nxtstate <= s0;
                end if;
                
        end case;
    end process;





end architecture;