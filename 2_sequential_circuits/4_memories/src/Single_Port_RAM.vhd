library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Single_Port_RAM is

    port(
        clk      : in std_logic;
        ene      : in std_logic;
        w_r      : in std_logic; 
        addrs    : in std_logic_vector(6 downto 0); 
        data_in  : in std_logic_vector(7 downto 0);
        data_out : out std_logic_vector(7 downto 0));
end Single_Port_RAM;

architecture Behavioral of Single_Port_RAM is

    type RAM_ARRAY is array (0 to 127) of std_logic_vector(7 downto 0);
    signal ram_mem : RAM_ARRAY := (others => (others => '0'));

begin

    process(clk) 
    begin
        if rising_edge(clk) then
            if ene = '1' then
                if w_r = '1' then
                    ram_mem(to_integer(unsigned(addrs))) <= data_in;
                else
                    data_out <= ram_mem(to_integer(unsigned(addrs)));
                end if;
            end if;
        end if;
    end process;

end architecture;