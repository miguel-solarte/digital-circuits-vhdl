library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL; 

package fifo_utils is
    function b2g (bin : in std_logic_vector) return unsigned;
end package;

package body fifo_utils is
    function b2g (bin : in std_logic_vector) return unsigned is
    begin
        return unsigned(bin xor ('0' & bin(bin'high downto 1)));
    end function;
end package body;