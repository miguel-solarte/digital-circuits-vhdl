library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.utility_pkg.all;

entity MatKeyB4x4_disp is
    port (
        clk : in std_logic;
        rst : in std_logic;
        PULS_IN  : in std_logic_vector(3 downto 0);
        ANODE   : out std_logic_vector(3 downto 0);
        PULS_OUT : out std_logic_vector(3 downto 0);
        SEV_SEG : out std_logic_vector(7 downto 0)
    );
end MatKeyB4x4_disp;

architecture Structural of MatKeyB4x4_disp is


    signal s0, s4 : std_logic;
    signal s1, s3 : std_logic_vector(3 downto 0);
    signal s2 : std_logic_vector(15 downto 0);

begin

    keyboard:MatKeyB4x4 
        generic map(
                    div_value => 100000
                    )
        port map(clk => clk,
                 PULS_IN => PULS_IN,
                 puls_data => s0,
                 PULS_OUT => PULS_OUT,
                 BIN_OUT => s1);

    debouncer_0:debouncer 
        generic map(
            num_pulses => 100_000_000 
        )
        port map(clk => clk,    
                 input => s0,
                 output => s4); 

    mux_digict:MultDigicKeyDisp port map(clk => s4,
                                         rst => rst,
                                         BIT_IN => s1,
                                         BIT_out => s2);

    anode_multplx:Anode_multiplexer 
        generic map(
            div_value => 100000  
        )
        port map(clk_100MHz => clk,
                 Digit_0 => s2(3 downto 0),
                 Digit_1 => s2(7 downto 4),
                 Digit_2 => s2(11 downto 8),
                 Digit_3 => s2(15 downto 12),
                 BIN_OUT => s3,
                 ANODE => ANODE);

    decoder:BCDto7seg 
        port map(BCD => s3,
        SEV_SEG => SEV_SEG);
                               
end architecture;