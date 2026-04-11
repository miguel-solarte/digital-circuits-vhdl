library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;



entity Async_FIFO_tb is
end entity;

architecture Behavioral of Async_FIFO_tb is

    constant clk_period_0 : time := 20 ns;
    constant clk_period_1 : time := 40 ns;
    constant data_width : natural := 8;
    constant addr_width : natural := 8;

    signal w_en, r_en     : std_logic;
    signal wclk, rclk     : std_logic;
    signal wrst_n, rrst_n : std_logic;
    signal data_in        : std_logic_vector(data_width - 1 downto 0);
    signal data_out       : std_logic_vector(data_width - 1 downto 0);
    signal full, empty    : std_logic;

    begin

        uut:entity work.Async_FIFO
            port map(w_en => w_en,
                     r_en => r_en,
                     wclk => wclk,
                     rclk => rclk,
                     wrst_n => wrst_n,
                     rrst_n => rrst_n,
                     data_in => data_in,
                     data_out => data_out,
                     full => full,
                     empty => empty
            );


        clk_process_0:process
            begin
                wclk <= '0'; wait for clk_period_0/2;
                wclk <= '1'; wait for clk_period_0/2;
        end process;

        clk_process_1:process
            begin
                rclk <= '0'; wait for clk_period_1/2;
                rclk <= '1'; wait for clk_period_1/2;
        end process;

        process

            procedure write_fifo(constant value : in integer) is
                begin

                    wait until falling_edge(wclk);
                    w_en <= '1'; r_en <= '0';
                    data_in <= std_logic_vector(to_unsigned(value, data_width));
                    wait until rising_edge(wclk);
                    w_en <= '0'; r_en <= '0';

            end procedure;

            procedure read_fifo is
                begin

                    wait until falling_edge(rclk);
                    w_en <= '0'; r_en <= '1';
                    wait until rising_edge(rclk);
                    w_en <= '0'; r_en <= '0';

            end procedure;

            begin

                wrst_n <= '1'; 
                wait for clk_period_0 * 2;
                rrst_n <= '1';
                wait for clk_period_1 * 2;

                wrst_n <= '0'; rrst_n <= '0';

            
                for i in 1 to addr_width loop
                    write_fifo(i);
                end loop;
                
                write_fifo(22);

                for i in 1 to addr_width loop
                    read_fifo;
                end loop;

                read_fifo;



        end process;



    

end Behavioral;