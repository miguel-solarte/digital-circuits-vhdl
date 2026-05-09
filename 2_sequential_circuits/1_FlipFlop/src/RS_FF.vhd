library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RS_FF is

    port(S     : in STD_LOGIC;
         R     : in STD_LOGIC;
         clk   : in STD_LOGIC;
         rst   : in STD_LOGIC;
         Q     : out STD_LOGIC;
         Q_bar : out STD_LOGIC);
         
end RS_FF;

architecture Behavioral of RS_FF is

    signal q_int : std_logic;

begin

    process(clk, rst)

    begin

        if(rst = '1') then

            q_int <= '0';

        else

            if rising_edge(clk) then

                if (S = '0' and R = '0') then
                
                    q_int <= q_int;

                elsif (S = '1' and R = '0') then
                    
                    q_int <= '1';

                elsif (S = '0' and R = '1') then

                    q_int <= '0';

                else
            
                    q_int <= 'X';
                    
                end if;

            end if;

        end if;
        
    end process;

    Q     <= q_int;
    Q_bar <= not q_int;

end Behavioral;