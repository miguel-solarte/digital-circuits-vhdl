library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity LCD_16x2_v2 is
    generic(
        t0 : integer := 4000000; -- 40ms
        t1 : integer := 3900;    -- 39us
        t2 : integer := 3700;    -- 37us
        t3 : integer := 153000;  -- 1.53ms
        t4 : integer := 4700     -- 47us
    );
    port (
        clk      : in std_logic;
        rst      : in std_logic;
        pulse_in : in std_logic;
        DATA_IN  : in std_logic_vector(7 downto 0);
        E        : out std_logic;
        RS_RW    : out std_logic_vector(1 downto 0); 
        DB7_0    : out std_logic_vector(7 downto 0)
    );
end LCD_16x2_v2;

architecture Behavioral of LCD_16x2_v2 is

    type state is (s0, s1, s2, s3, s4, s5, s6);
    signal prstate : state := s0;
    
    signal count : integer range 0 to t0 := 0;

begin

    process(clk)
    begin
        if rst = '1' then
            prstate <= s0;
            count <= 0;
            E <= '0';
            RS_RW <= "00";
            DB7_0 <= (others => '0');
        elsif rising_edge(clk) then
            case prstate is
            
                when s0 => 
                    RS_RW <= "00";
                    DB7_0 <= (others => '0');
                    E <= '0';
                    if count < t0 - 1 then
                        count <= count + 1;
                    else
                        count <= 0;
                        prstate <= s1;
                    end if;

                
                when s1 => 
                    
                    if count = t1 - 1 then
                        count <= 0;
                        prstate <= s2;
                    else
                        RS_RW <= "00";
                        DB7_0 <= "00111000"; 
                        
                        if count > 100 and count < 500 then 
                            E <= '1'; 
                        else 
                            E <= '0'; 
                        end if;
     
                        prstate <= s1;
                        count <= count + 1;
                        
                    end if;

               
                when s2 => 
                    
                    
                    if count = t2 - 1 then
                        count <= 0;
                        prstate <= s3;
                        
                    else
                        RS_RW <= "00";
                        DB7_0 <= "00111000"; 
                        if count > 100 and count < 500 then E <= '1'; else E <= '0'; end if;
                        prstate <= s2;
                        count <= count + 1;
                    end if;

                
                when s3 => 
                    
                    if count = t2 - 1 then
                        count <= 0;
                        prstate <= s4;
                        
                    else
                        RS_RW <= "00";
                        DB7_0 <= "00001111"; 
                        if count > 100 and count < 500 then E <= '1'; else E <= '0'; end if;
                        prstate <= s3;
                        count <= count + 1;
                        
                    end if;

             
                when s4 => 

                    if count = t3 - 1 then 
                        count <= 0;
                        prstate <= s5;
                    else
                        RS_RW <= "00";
                        DB7_0 <= "00000001";
                        if count > 100 and count < 500 then E <= '1'; else E <= '0'; end if;
                        prstate <= s4;
                        count <= count + 1;
                    end if;

                
                when s5 => 
                    
                    if count = t2 - 1 then
                        count <= 0;
                        prstate <= s6;
                        
                    else
                    
                        RS_RW <= "00";
                        DB7_0 <= "00000110";
                        if count > 100 and count < 500 then E <= '1'; else E <= '0'; end if;
                        prstate <= s5;
                        count <= count + 1;
                        
                    end if;

                when s6 => 

                    if pulse_in = '1' then
                        if count = t4 - 1 then
                            count <= 0;
                            
                        else
                            RS_RW <= "10"; 
                            DB7_0 <= DATA_IN;
                            
                            
                            if count > 100 and count < 500 then 
                                E <= '1'; 
                            else 
                                E <= '0'; 
                            end if;
                            
                            count <= count + 1;
                        end if;
                    else
                        E <= '0';
                    end if;
                    
            
            end case;
        end if;
    end process;
end architecture;