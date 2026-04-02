library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity JK_FF is

    port(J     : in STD_LOGIC;
         K     : in STD_LOGIC;
         clk   : in STD_LOGIC;
         rst   : in STD_LOGIC;
         Q     : out STD_LOGIC;
         Q_bar : out STD_LOGIC);

end JK_FF;

architecture Behavioral of JK_FF is

    signal q_sig : std_logic;

begin

    process(clk)

        begin

            if(rst = '1') then

                q_sig <= '0';
            
            else

                if(rising_edge(clk)) then

                    if(J = '0' and K = '0') then

                        q_sig <= q_sig;

                    elsif(J = '0' and K = '1') then
                        
                        q_sig <= '0';

                    elsif(J = '1' and K = '0') then
                        
                        q_sig <= '1';

                    else

                        q_sig <= not q_sig;

                    end if;

                end if;

            end if;

    end process;

    Q     <= q_sig;
    Q_bar <= not q_sig;

end Behavioral;