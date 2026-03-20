library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity rca_bh is

    port(a : in std_logic_vector(3 downto 0);
         b : in std_logic_vector(3 downto 0);
         c_in : in std_logic;
         sum : out std_logic_vector(3 downto 0);
         c_out : out std_logic);
         
end rca_bh;

architecture Behavioral of rca_bh is

begin

     process(a, b, c_in)
     
        variable c: std_logic_vector(3 downto 0);
     
        begin
     
            sum(0) <= a(0) xor b(0) xor c_in;
            c(0) := (a(0) and b(0)) or (a(0) and c_in) or (c_in and b(0));  
        
            sum(1) <= a(1) xor b(1) xor c(0);
            c(1) := (a(1) and b(1)) or (a(1) and c(0)) or (c(0) and b(1));
        
            sum(2) <= a(2) xor b(2) xor c(1);
            c(2) := (a(2) and b(2)) or (a(2) and c(1)) or (c(1) and b(2));
        
            sum(3) <= a(3) xor b(3) xor c(2);
            c(3) := (a(3) and b(3)) or (a(3) and c(2)) or (c(2) and b(3));
        
            c_out <= c(3);
            
     end process;

end Behavioral;