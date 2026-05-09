library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Dual_Port_RAM_tb is
end Dual_Port_RAM_tb;

architecture Behavioral of Dual_Port_RAM_tb is

    constant clk_period : time := 20ns;

    signal clk  : std_logic;
    signal en_a, en_b     : std_logic;
    signal wr_a, wr_b     : std_logic;
    signal add_a, add_b   : std_logic_vector(6 downto 0);
    signal din_a, din_b   : std_logic_vector(7 downto 0);
    signal dout_a, dout_b : std_logic_vector(7 downto 0);
    signal collision      : std_logic;

begin

    uut:entity work.Dual_Port_RAM
        port map(
            clk => clk,
            en_a => en_a,
            en_b => en_b,
            wr_a => wr_a,
            wr_b => wr_b,
            add_a => add_a,
            add_b => add_b,
            din_a => din_a,
            din_b => din_b,
            dout_a => dout_a,
            dout_b => dout_b,
            collision => collision
        );

    clk0:process
    begin

        clk <= '0'; wait for clk_period / 2;
        clk <= '1'; wait for clk_period / 2;
        
    end process;


    Dual_RAM_test_a:process

        procedure write_a(constant add  : in std_logic_vector(6 downto 0);
                        constant d_in : in std_logic_vector(7 downto 0)) is
        begin
            wait until falling_edge(clk);
            en_a <= '1'; wr_a <= '1';
            add_a <= add;
            din_a <= d_in;
            wait until rising_edge(clk);
            en_a <= '0'; wr_a <= '0';
        end procedure;

        procedure read_a(constant add : in std_logic_vector(6 downto 0)) is
        begin
            wait until falling_edge(clk);
            en_a <= '1'; wr_a <= '0';
            add_a <= add;
            wait until rising_edge(clk);
            en_a <= '0'; wr_a <= '0';
        end procedure;

        

    begin
    
        en_a <= '0'; wr_a <= '0';
        add_a <= (others => '0');
        din_a <= (others => '0');
        wait for clk_period * 2;

        write_a("1111111", "00001010");
        write_a("1000000", "00001000");

        read_a("1111111");
        read_a("1000000");
        
        write_a("0000111", x"AA");

        
        wait;
        
    end process;
    
    Dual_RAM_test_b:process


        procedure write_b(constant add  : in std_logic_vector(6 downto 0);
                        constant d_in : in std_logic_vector(7 downto 0)) is
        begin
            wait until falling_edge(clk);
            en_b <= '1'; wr_b <= '1';
            add_b <= add;
            din_b <= d_in;
            wait until rising_edge(clk);
            en_b <= '0'; wr_b <= '0';
        end procedure;

        procedure read_b(constant add : in std_logic_vector(6 downto 0)) is
        begin
            wait until falling_edge(clk);
            en_b <= '1'; wr_b <= '0';
            add_b <= add;
            wait until rising_edge(clk);
            en_b <= '0'; wr_b <= '0';
        end procedure;

    begin
    
        en_b <= '0'; wr_b <= '0';
        add_b <= (others => '0');
        din_b <= (others => '0');
        wait for clk_period * 2;


--        write_b("0001010", "00000111");
--        write_b("0000001", "00000011");

     
--        read_b("0001010");
--        read_b("0000001");
        
--        write_b("0000111", x"BB");
        
        wait;





        
    end process;

end architecture;