library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.utility_pkg.all;

entity LCD_KB is
    port (
        clk : in std_logic;
        rst : in std_logic;
        PULS_IN  : in std_logic_vector(3 downto 0);
        PULS_OUT : out std_logic_vector(3 downto 0);
        E        : out std_logic;
        RS_RW    : out std_logic_vector(1 downto 0);
        DB7_0    : out std_logic_vector(7 downto 0)
    );
end LCD_KB;

architecture Structural of LCD_KB is

    signal s0, s2 : std_logic;
    signal s1 : std_logic_vector(7 downto 0);

begin

    keyboard:MatKeyB4x4_hex 
        generic map(
                    div_value => 100000
                    )
        port map(clk => clk,
                 PULS_IN => PULS_IN,
                 puls_data => s0,
                 PULS_OUT => PULS_OUT,
                 HEX_OUT => s1);
                 
    debounc:debouncer
        generic map(
            num_pulses => 50_000_000 
        )
        port map(clk => clk,    
                 input => s0,
                 output => s2);

    LCD:LCD_16x2 
        generic map(t0 => 4000000, -- 40ms
                    t1 => 3900,    -- 39us
                    t2 => 3700,    -- 37us
                    t3 => 153000,  -- 1.53ms
                    t4 => 4700     -- 47us
        )
        port map(clk => clk,
                 rst => rst,
                 pulse_in => s2,
                 DATA_IN => s1,
                 E => E,
                 RS_RW => RS_RW, 
                 DB7_0 => DB7_0);



end architecture;