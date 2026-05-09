library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Single_Port_RAM_tb is
end Single_Port_RAM_tb;

architecture Behavioral of Single_Port_RAM_tb is

    constant clk_period : time := 20ns;

    signal clk      : std_logic;
    signal ene      : std_logic;
    signal w_r      : std_logic; 
    signal addrs    : std_logic_vector(6 downto 0); 
    signal data_in  : std_logic_vector(7 downto 0);
    signal data_out : std_logic_vector(7 downto 0);

begin



    uut:entity work.Single_Port_RAM
        port map(
            clk => clk,
            ene => ene,
            w_r => w_r,
            addrs => addrs,
            data_in => data_in,
            data_out => data_out
        );

    clk_20ns : process
        begin
            clk <= '0'; wait for clk_period / 2;
            clk <= '1'; wait for clk_period / 2;
    end process;


    process

    procedure write(constant add : in std_logic_vector(6 downto 0);
                    constant d_in : in std_logic_vector(7 downto 0)) is
    begin
        wait until falling_edge(clk);
        ene <= '1'; w_r <= '1';
        addrs <= add;
        data_in <= d_in;
        wait until rising_edge(clk);
        ene <= '0'; w_r <= '0';
    end procedure;

    procedure read(constant add : in std_logic_vector(6 downto 0)) is
    begin
        wait until falling_edge(clk);
        ene <= '1'; w_r <= '0';
        addrs <= add;
        wait until rising_edge(clk);
        ene <= '0'; w_r <= '0';
    end procedure;

    begin
    
        ene <= '0'; w_r <= '0';
        addrs <= (others => '0');
        data_in <= (others => '0');
        wait for clk_period * 2;

        -- Address 127: x"7F" -> "1111111" (7 bits)
        write("1111111", "00001010");

        -- Address 10:  x"0A" -> "0001010" (7 bits)
        write("0001010", "00000111");

        -- Address 50:  x"32" -> "0110010" (7 bits)
        write("0110010", "00110010");

        read("1111111");
        read("0001010");
        read("0110010");
        
        wait;
        
    end process;

end architecture;