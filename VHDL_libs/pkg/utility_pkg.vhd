library ieee;
use ieee.std_logic_1164.all;

package utility_pkg is

    
    component pulse_generator_0 is
        port(
            clk    : in std_logic;
            input  : in std_logic;
            output : out std_logic
        );
    end component;

    component pulse_generator_1 is
        port(
            clk    : in std_logic;
            input  : in std_logic;
            output : out std_logic
        );
    end component;
    
    component debouncer is

    generic(
        num_pulses : integer := 50000 
    );
    port (
        clk    : in std_logic;
        input  : in std_logic;
        output : out std_logic
    );
    end component;

    component BCDto7seg is
    port (
        BCD     : in std_logic_vector(3 downto 0);
        SEV_SEG : out std_logic_vector(7 downto 0)
    );
    end component;

    component Anode_multiplexer is

    generic (
        
        div_value : integer := 100000
    );

    port (
        clk_100MHz : in  std_logic;
        Digit_0 : in  std_logic_vector(3 downto 0);
        Digit_1 : in  std_logic_vector(3 downto 0);
        Digit_2 : in  std_logic_vector(3 downto 0);
        Digit_3 : in  std_logic_vector(3 downto 0);
        BIN_OUT : out std_logic_vector(3 downto 0);
        ANODE   : out std_logic_vector(3 downto 0)
    );

    end component;

    component MatKeyB4x4 is

    generic(
            div_value : integer := 100000
    );

    port(
        clk       : in std_logic;
        PULS_IN   : in std_logic_vector(3 downto 0);
        puls_data : out std_logic;
        PULS_OUT  : out std_logic_vector(3 downto 0);
        BIN_OUT   : out std_logic_vector(3 downto 0)
    );
    end component;

    component  MultDigicKeyDisp is
    port(
        clk     : in std_logic;
        rst     : in std_logic;
        BIT_IN  : in std_logic_vector(3 downto 0);
        BIT_out : out std_logic_vector(15 downto 0)
    );
    end component;

    
end package utility_pkg;