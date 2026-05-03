library ieee;
use ieee.std_logic_1164.all;

entity seven_seg_disp is
    port (
        clk    : in  std_logic;
        Digit_0 : in  std_logic_vector(3 downto 0);
        Digit_1 : in  std_logic_vector(3 downto 0);
        Digit_2 : in  std_logic_vector(3 downto 0);
        Digit_3 : in  std_logic_vector(3 downto 0);
        ANODE   : out std_logic_vector(3 downto 0);
        SEV_SEG : out std_logic_vector(7 downto 0)
    );
end seven_seg_disp;

architecture Structural of seven_seg_disp is

    component BCDto7seg is
        port (
            BCD     : in std_logic_vector(3 downto 0);
            SEV_SEG : out std_logic_vector(7 downto 0)
        );

    end component;

    component Anode_multiplexer is

        port (
        clk_100MHz : in  std_logic;
        Digit_0    : in  std_logic_vector(3 downto 0);
        Digit_1    : in  std_logic_vector(3 downto 0);
        Digit_2    : in  std_logic_vector(3 downto 0);
        Digit_3    : in  std_logic_vector(3 downto 0);
        BIN_OUT    : out std_logic_vector(3 downto 0);
        ANODE      : out std_logic_vector(3 downto 0)
    );

    end component;


    signal s0 : std_logic_vector(3 downto 0);

begin

    Anode_mltpx:Anode_multiplexer port map(clk_100MHz => clk, 
                                           Digit_0 => Digit_0,
                                           Digit_1 => Digit_1,
                                           Digit_2 => Digit_2,
                                           Digit_3 => Digit_3,
                                           BIN_OUT => s0,
                                           ANODE => ANODE);

    Decoder:BCDto7seg port map(BCD => s0,
                               SEV_SEG => SEV_SEG);

end architecture;