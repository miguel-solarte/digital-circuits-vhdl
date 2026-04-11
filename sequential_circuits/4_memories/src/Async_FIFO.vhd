library IEEE;
library work;

use work.fifo_utils.all;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;



entity Async_FIFO is

    generic(addr_width     : natural := 3;
            data_width     : natural := 8;
            station_number : natural := 8);

    port(w_en, r_en     : in std_logic;
         wclk, rclk     : in std_logic;
         wrst_n, rrst_n : in std_logic;
         data_in        : in std_logic_vector(data_width - 1 downto 0);
         data_out       : out std_logic_vector(data_width - 1 downto 0);
         full, empty    : out std_logic);

end entity;

architecture Behavioral of Async_FIFO is

    type FIFO_ARRAY is array(station_number - 1 downto 0) of std_logic_vector(data_width - 1 downto 0);
    signal mem_fifo : FIFO_ARRAY;

    signal b_wptr, b_rptr : unsigned(addr_width downto 0) := (others => '0');

    signal g_wptr, g_rptr : unsigned(addr_width downto 0) := (others => '0');

    signal g_wptr_sync0, g_rptr_sync0 : unsigned(addr_width downto 0);
    signal g_wptr_sync1, g_rptr_sync1 : unsigned(addr_width downto 0);

    signal full_s, empty_s : std_logic;
    


    begin

    empty_s <= '1' when (g_rptr = g_wptr_sync1) else '0';
    

    full_s  <= '1' when (g_wptr(addr_width) /= g_rptr_sync1(addr_width)) and 
                        (g_wptr(addr_width - 1) /= g_rptr_sync1(addr_width - 1)) and 
                        (g_wptr(addr_width - 2 downto 0) = g_rptr_sync1(addr_width - 2 downto 0)) else '0';

    process(wclk, wrst_n)

        begin
            if wrst_n = '1' then
            
                b_wptr <= (others => '0');
                g_wptr <= (others => '0');
                g_rptr_sync0 <= (others => '0');
                g_rptr_sync1 <= (others => '0');
                
            elsif rising_edge(wclk) then
              
                if w_en = '1' and full_s = '0' then
                
                    mem_fifo(to_integer(b_wptr(addr_width - 1 downto 0))) <= data_in;
                    b_wptr <= b_wptr + 1;
                    g_wptr <= b2g(std_logic_vector(b_wptr + 1)); 
                    
                end if;
   
                g_rptr_sync0 <= g_rptr; 
                g_rptr_sync1 <= g_rptr_sync0;
                
            end if;

    end process;

    process(rclk, rrst_n)
    
        begin
        
            if rrst_n = '1' then
            
                b_rptr <= (others => '0');
                g_rptr <= (others => '0');
                g_wptr_sync0 <= (others => '0');
                g_wptr_sync1 <= (others => '0');
                
            elsif rising_edge(rclk) then
              
                if r_en = '1' and empty_s = '0' then
                
                    data_out <= mem_fifo(to_integer(b_rptr(addr_width - 1 downto 0)));
                    b_rptr <= b_rptr + 1;
                    g_rptr <= b2g(std_logic_vector(b_rptr + 1));
                    
                end if;
    
                g_wptr_sync0 <= g_wptr;
                g_wptr_sync1 <= g_wptr_sync0;
                
            end if;
            
    end process;

    empty <= empty_s;
    full  <= full_s;

end Behavioral;