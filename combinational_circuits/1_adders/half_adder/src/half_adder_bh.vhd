library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity half_adder_bh is

    port(a : in std_logic;
         b : in std_logic;
         sum : out std_logic;
         c_out : out std_logic
    );
    
end half_adder_bh;

architecture Behavioral of half_adder_bh is

begin

    HA_B:process(a,b)
    
    begin
    
        if a = '1' then
            
            sum <= not b;
            c_out <= b;
            
        else
            
            sum <= b;
            c_out <= '0';
            
        end if;
    
    end process;


end Behavioral;