library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity debouncer is
    generic(
        num_pulses : integer := 50000 
    );
    port (
        clk    : in std_logic;
        input  : in std_logic;
        output : out std_logic
    );
end debouncer;

architecture Beahvioral of debouncer is

    type state is (s0, s1);
    signal prstate, nxtstate : state;

    signal count : integer range 0 to num_pulses := 0;

begin

    process(clk)
    begin
        if rising_edge(clk) then

            prstate <= nxtstate;

            if prstate = s1 then
                if count = num_pulses - 1 then
                    count <= 0;
                else
                    count <= count + 1;
                end if;     
            else
                count <= 0;
            end if;
        end if;
    end process;

    process(prstate, count, input)
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
                if count = num_pulses - 1 then
                    output <= '1';
                    nxtstate <= s0;
                else 
                    output <= '1';
                    nxtstate <= s1;
                end if;
        
        
        end case;
    end process;



end architecture;