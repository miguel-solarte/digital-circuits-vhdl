library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Dual_Port_RAM is
    port (
        clk  : in std_logic;
        en_a, en_b     : in std_logic;
        wr_a, wr_b     : in std_logic;
        add_a, add_b   : in std_logic_vector(6 downto 0);
        din_a, din_b   : in std_logic_vector(7 downto 0);
        dout_a, dout_b : out std_logic_vector(7 downto 0);
        collision      : out std_logic
    );
end Dual_Port_RAM;

architecture Behavioral of Dual_Port_RAM is

    type RAM_ARRAY is array(0 to 127) of std_logic_vector(7 downto 0);
    signal ram_mem : RAM_ARRAY := (others => (others => '0'));

    signal dout_a_reg, dout_b_reg : std_logic_vector(7 downto 0);
    signal collision_s : std_logic;

begin

    
    collision_s <= '1' when 
        (add_a = add_b) and 
        (en_a = '1') and (en_b = '1') and
        (wr_a = '1') and (wr_b = '1')
    else '0';

    collision <= collision_s;

    
    process(clk)
    begin
        if rising_edge(clk) then

           
            if en_a = '1' then
                if wr_a = '1' then
                    ram_mem(to_integer(unsigned(add_a))) <= din_a;
                end if;
                dout_a_reg <= ram_mem(to_integer(unsigned(add_a)));
            end if;

            if en_b = '1' then
                if wr_b = '1' then
                    ram_mem(to_integer(unsigned(add_b))) <= din_b;
                end if;
                dout_b_reg <= ram_mem(to_integer(unsigned(add_b)));
            end if;

        end if;
    end process;

   
    dout_a <= dout_a_reg;
    dout_b <= dout_b_reg;

end Behavioral;