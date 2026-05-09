library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity LCD_16x2_v0 is

    generic(
        t0 : integer := 4000000 
    );

    port (
        clk   : in std_logic;
        sett   : in std_logic;
        E     : out std_logic;
        DB7_0 : out std_logic_vector(7 downto 0);
        RS_RW : out std_logic_vector(1 downto 0)
    );
end LCD_16x2_v0;

architecture Behavioral of LCD_16x2_v0 is
    signal count : integer range 0 to t0 := 0;
    signal busy : std_logic := '0';
begin
    process(clk)
    begin
        if rising_edge(clk) then
          
            if (sett = '1' and busy = '0') then
                busy <= '1';
                count <= 0; 
            end if;

            if busy = '1' then
                
                if count = t0 - 1 then
                    busy <= '0';
                    count <= 0;
                else
                    count <= count + 1;
                end if;

              
                RS_RW <= "00";
                DB7_0 <= "00001111"; 

                
                if count > 20 and count < 100 then
                    E <= '1';
                else
                    E <= '0';
                end if;
            else
                
                E <= '0';
                RS_RW <= "00";
                DB7_0 <= (others => '0');
                count <= 0;
            end if;
        end if;
    end process;
end architecture;