library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

entity Anode_multiplexer is

    generic (
        
        div_value : integer := 100000
    );

    port (
        clk_100MHz     : in  std_logic;
        Digit_0 : in  std_logic_vector(3 downto 0);
        Digit_1 : in  std_logic_vector(3 downto 0);
        Digit_2 : in  std_logic_vector(3 downto 0);
        Digit_3 : in  std_logic_vector(3 downto 0);
        BIN_OUT : out std_logic_vector(3 downto 0);
        ANODE   : out std_logic_vector(3 downto 0)
    );
end Anode_multiplexer;

architecture Behavioral of Anode_multiplexer is

    signal sel : unsigned(1 downto 0) := "00";
    signal count : integer range 0 to div_value := 0;

begin

    process(clk_100MHz)
    begin
        if rising_edge(clk_100MHz) then
            if count = div_value - 1 then
                sel <= sel + 1; 
                count <= 0;
            else
                count <= count + 1;
            end if;
        end if;
    end process;

    
    process(sel, Digit_0, Digit_1, Digit_2, Digit_3)
    begin
        case sel is
            when "00" => BIN_OUT <= Digit_0;
            when "01" => BIN_OUT <= Digit_1;
            when "10" => BIN_OUT <= Digit_2;
            when "11" => BIN_OUT <= Digit_3;
            when others => BIN_OUT <= "0000";
        end case;
    end process;

   
    process(sel)
    begin
        case sel is
            when "00" => ANODE <= "1110";
            when "01" => ANODE <= "1101";
            when "10" => ANODE <= "1011";
            when "11" => ANODE <= "0111";
            when others => ANODE <= "1111";
        end case;
    end process;

end architecture;