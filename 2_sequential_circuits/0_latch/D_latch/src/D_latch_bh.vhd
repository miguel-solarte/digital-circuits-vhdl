library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity D_latch_bh is

    port(d : in STD_LOGIC;
         en : in STD_LOGIC;
         q : out STD_LOGIC;
         q_bar : out STD_LOGIC);
           
end D_latch_bh;

architecture Behavioral of D_latch_bh is


begin

    process(d,en)
    
        begin

            if(en = '1') then
    
                q <= d;
                q_bar <= not d;
            
            end if;
        
    end process;

end Behavioral;