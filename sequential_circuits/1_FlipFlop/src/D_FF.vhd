library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity D_FF is

    port(D : in STD_LOGIC;
         clk : in STD_LOGIC;
         rst : in STD_LOGIC;
         Q : out STD_LOGIC;
         Q_bar : out STD_LOGIC);
           
end D_FF;

architecture Behavioral of D_FF is

    signal q_sig : std_logic;

begin

    process(clk, rst)
    
        begin

            if(rst = '1') then

                q_sig <= '0';

            else

                if(rising_edge(clk)) then
        
                    q_sig <= D;
                
                end if;

            end if;
        
    end process;

    Q     <= q_sig;
    Q_bar <= not q_sig;

end Behavioral;