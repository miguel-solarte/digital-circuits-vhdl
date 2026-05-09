library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Sync_FIFO is 
    port(
        data_in  : in std_logic_vector(7 downto 0);
        wrt      : in std_logic;
        en       : in std_logic;
        rst      : in std_logic;
        clk      : in std_logic;
        data_out : out std_logic_vector(7 downto 0);
        full     : out std_logic;
        empty    : out std_logic
    );
end entity;

architecture Behavioral of Sync_FIFO is
 
    signal wptr, rptr: unsigned(3 downto 0) := (others => '0');
    
    type FIFO_ARRAY is array(7 downto 0) of std_logic_vector(7 downto 0);
    signal mem: FIFO_ARRAY;
    

    signal is_full, is_empty : std_logic;

begin

    
    is_empty <= '1' when wptr = rptr else '0';
    is_full  <= '1' when (wptr(2 downto 0) = rptr(2 downto 0)) and (wptr(3) /= rptr(3)) else '0';

    process(clk, rst)
    
        begin
        
            if rst = '1' then
            
                wptr <= (others => '0');
                rptr <= (others => '0');
                data_out <= (others => '0');
                
            elsif rising_edge(clk) then
            
                if en = '1' then
                   
                    if wrt = '1' then
                    
                        if is_full = '0' then
                        
                            mem(to_integer(wptr(2 downto 0))) <= data_in;
                            wptr <= wptr + 1;
                            
                        end if;
              
                    else
                    
                        if is_empty = '0' then
                        
                            data_out <= mem(to_integer(rptr(2 downto 0)));
                            rptr <= rptr + 1;
                            
                        end if;
                        
                    end if;
                    
                end if;
                
            end if;
            
    end process;

    full  <= is_full;
    empty <= is_empty;

end Behavioral;