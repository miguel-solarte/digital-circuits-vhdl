library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MultDigicKeyDisp is
    port(
        clk     : in std_logic;
        rst     : in std_logic;
        BIT_IN  : in std_logic_vector(3 downto 0);
        BIT_out : out std_logic_vector(15 downto 0)
    );
end MultDigicKeyDisp;

architecture Behavioral of MultDigicKeyDisp is

    type state is (s0, s1, s2, s3);
    signal prstate : state := s0;
    
    signal reg_internal : std_logic_vector(15 downto 0) := (others => '0');

begin

    
    process(clk, rst)
    begin
        if rst = '1' then
            prstate <= s0;
            reg_internal <= (others => '0');
            
        elsif rising_edge(clk) then
           
            case prstate is
                when s0 => 
                    reg_internal <= reg_internal(11 downto 0) & BIT_IN;
                    prstate <= s1;
                    
                when s1 => 
                    reg_internal <= reg_internal(11 downto 0) & BIT_IN;
                    prstate <= s2;
                    
                when s2 => 
                    reg_internal <= reg_internal(11 downto 0) & BIT_IN;
                    prstate <= s3;
                    
                when s3 => 
                    reg_internal <= reg_internal(11 downto 0) & BIT_IN; 
                    prstate <= s0;
            end case;
        end if;
    end process;
    
    BIT_out <= reg_internal;

end architecture;