library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pulse_generator_1 is

    port(
        clk : in std_logic;
        input :in std_logic;
        output : out std_logic
    );
    
end pulse_generator_1;

architecture Behavioral of pulse_generator_1 is

begin

    process(clk)
        variable delay_reg : std_logic := '0';
    begin
        if rising_edge(clk) then
            output <= input and (not delay_reg); 
            delay_reg := input;
        end if;
    end process;

end architecture;