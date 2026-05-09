library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.utility_pkg.all;

entity MatKeyB4x4_disp_0 is
    port (
        clk       : in std_logic;
        PULS_IN   : in std_logic_vector(3 downto 0);
        puls_data : out std_logic;
        ANODE     : out std_logic_vector(3 downto 0);
        PULS_OUT  : out std_logic_vector(3 downto 0);
        SEV_SEG   : out std_logic_vector(7 downto 0)
    );
end MatKeyB4x4_disp_0;

architecture Structural of MatKeyB4x4_disp_0 is

    signal s0, s1 : std_logic_vector(3 downto 0);

begin

    keyboard: MatKeyB4x4 
        generic map(
            div_value => 100_000_000  
        )
        port map(
            clk       => clk,
            PULS_IN   => PULS_IN,
            puls_data => puls_data,
            PULS_OUT  => PULS_OUT,
            BIN_OUT   => s0
        );

    anode_multplx: Anode_multiplexer 
        generic map(
            div_value => 100000  
        )
        port map(
            clk_100MHz => clk,
            Digit_0    => s0,
            Digit_1    => "0000",
            Digit_2    => "0000",
            Digit_3    => "0000",
            BIN_OUT    => s1,
            ANODE      => ANODE
        );

    decoder: BCDto7seg 
        port map(
            BCD     => s1,
            SEV_SEG => SEV_SEG
        );
                               
end architecture;