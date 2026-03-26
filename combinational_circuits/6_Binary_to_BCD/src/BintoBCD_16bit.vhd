library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity BintoBCD_16bit is

    port(B_in   : in  std_logic_vector(15 downto 0);
         Y_bcd3 : out std_logic_vector(3 downto 0);
         Y_bcd2 : out std_logic_vector(3 downto 0);
         Y_bcd1 : out std_logic_vector(3 downto 0);
         Y_bcd0 : out std_logic_vector(3 downto 0));
         
end BintoBCD_16bit;

architecture Behavioral of BintoBCD_16bit is
    
begin

    process(B_in)
        variable shift_reg : std_logic_vector(31 downto 0);
        variable i : integer;
    begin

        shift_reg := (others => '0');
        shift_reg(15 downto 0) := B_in;

        for i in 0 to 15 loop

    
            if shift_reg(19 downto 16) > "0100" then
            
                shift_reg(19 downto 16) := std_logic_vector(unsigned(shift_reg(19 downto 16)) + 3);
                
            end if;

            if shift_reg(23 downto 20) > "0100" then
            
                shift_reg(23 downto 20) := std_logic_vector(unsigned(shift_reg(23 downto 20)) + 3);
                
            end if;

            if shift_reg(27 downto 24) > "0100" then
            
                shift_reg(27 downto 24) := std_logic_vector(unsigned(shift_reg(27 downto 24)) + 3);
                
            end if;

            if shift_reg(31 downto 28) > "0100" then
            
                shift_reg(31 downto 28) := std_logic_vector(unsigned(shift_reg(31 downto 28)) + 3);
                
            end if;

    
            shift_reg := shift_reg(30 downto 0) & '0';

        end loop;

        Y_bcd3 <= shift_reg(31 downto 28);
        Y_bcd2 <= shift_reg(27 downto 24);
        Y_bcd1 <= shift_reg(23 downto 20);
        Y_bcd0 <= shift_reg(19 downto 16);

    end process;

end Behavioral;