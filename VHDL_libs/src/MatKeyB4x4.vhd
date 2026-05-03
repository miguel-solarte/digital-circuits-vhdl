library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MatKeyB4x4 is

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
end MatKeyB4x4;

architecture Behavioral of MatKeyB4x4 is

    signal sel : unsigned(1 downto 0) := "00";
    signal count, count1 : integer range 0 to div_value := 0;

begin

    process(clk)
    begin
        if rising_edge(clk) then
            if count = div_value - 1 then
                count <= 0;
                sel <= sel + 1;
            else
                count <= count + 1;
            end if;
        end if;
    end process;

    
    process(sel)
    begin
        case sel is
            when "00" => PULS_OUT <= "0001";
            when "01" => PULS_OUT <= "0010"; 
            when "10" => PULS_OUT <= "0100";
            when "11" => PULS_OUT <= "1000";
            when others => PULS_OUT <= "0000";
        end case;
    end process;

    
    process(clk)
    begin
    
        puls_data <= '0';
        if rising_edge(clk) then
            if count1 = div_value - 1 then
                count1 <= 0;
        
                if PULS_IN /= "0000" then 
                puls_data <= '1';
                    case sel is
                        when "00" =>
                            if    PULS_IN = "0001" then BIN_OUT <= x"0"; -- D
                            elsif PULS_IN = "0010" then BIN_OUT <= x"0"; -- #
                            elsif PULS_IN = "0100" then BIN_OUT <= x"0"; -- 0
                            elsif PULS_IN = "1000" then BIN_OUT <= x"0"; -- *
                            end if;
        
                        when "01" =>
                            if    PULS_IN = "0001" then BIN_OUT <= x"0"; -- C
                            elsif PULS_IN = "0010" then BIN_OUT <= x"9";
                            elsif PULS_IN = "0100" then BIN_OUT <= x"8";
                            elsif PULS_IN = "1000" then BIN_OUT <= x"7";
                            end if;
        
                        when "10" =>
                            if    PULS_IN = "0001" then BIN_OUT <= x"0"; -- B
                            elsif PULS_IN = "0010" then BIN_OUT <= x"6";
                            elsif PULS_IN = "0100" then BIN_OUT <= x"5";
                            elsif PULS_IN = "1000" then BIN_OUT <= x"4";
                            end if;
                        
                        when "11" =>
                            if    PULS_IN = "0001" then BIN_OUT <= x"0"; -- A
                            elsif PULS_IN = "0010" then BIN_OUT <= x"3";
                            elsif PULS_IN = "0100" then BIN_OUT <= x"2";
                            elsif PULS_IN = "1000" then BIN_OUT <= x"1";
                            end if;
                            
                        when others => null;
                    end case;
                end if;
            else
                count1 <= count1 + 1;
            end if;
        end if;
    end process;

end architecture;
