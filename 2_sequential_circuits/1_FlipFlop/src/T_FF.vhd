library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity T_FF is

    port(T     : in STD_LOGIC;
         clk   : in STD_LOGIC;
         rst   : in STD_LOGIC;
         Q     : out STD_LOGIC;
         Q_bar : out STD_LOGIC);

end T_FF;

architecture Behavioral of T_FF is

    signal q_sig : std_logic := '0';

begin

    process(clk, rst)

    begin

        if(rst = '1') then
            
            q_sig <= '0';

        else 
            
            if(rising_edge(clk)) then

                if (T = '0') then

                    q_sig <= q_sig;

                else

                    q_sig <= not q_sig;

                end if;

            end if;

        end if;

    end process;

    Q     <= q_sig;
    Q_bar <= not q_sig;

end Behavioral;