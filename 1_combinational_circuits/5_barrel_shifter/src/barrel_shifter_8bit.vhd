library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity barrel_shifter_8bit is

    port(A : in std_logic_vector(7 downto 0);
         S : in std_logic_vector(2 downto 0);
         Y : out std_logic_vector(7 downto 0));

end barrel_shifter_8bit;

architecture Structural of barrel_shifter_8bit is

    component mux8_1 is

        port(A : in std_logic_vector(7 downto 0);
             S : in std_logic_vector(2 downto 0);
             y : out std_logic);
         
    end component;

    

begin

    mux0:mux8_1 port map(S => S, A(0) => A(0), A(1) => A(1), A(2) => A(2), A(3) => A(3), A(4) => A(4), A(5) => A(5), A(6) => A(6), A(7) => A(7), y => Y(0));
    mux1:mux8_1 port map(S => S, A(0) => A(1), A(1) => A(2), A(2) => A(3), A(3) => A(4), A(4) => A(5), A(5) => A(6), A(6) => A(7), A(7) => A(0), y => Y(1));
    mux2:mux8_1 port map(S => S, A(0) => A(2), A(1) => A(3), A(2) => A(4), A(3) => A(5), A(4) => A(6), A(5) => A(7), A(6) => A(0), A(7) => A(1), y => Y(2));
    mux3:mux8_1 port map(S => S, A(0) => A(3), A(1) => A(4), A(2) => A(5), A(3) => A(6), A(4) => A(7), A(5) => A(0), A(6) => A(1), A(7) => A(2), y => Y(3));
    mux4:mux8_1 port map(S => S, A(0) => A(4), A(1) => A(5), A(2) => A(6), A(3) => A(7), A(4) => A(0), A(5) => A(1), A(6) => A(2), A(7) => A(3), y => Y(4));
    mux5:mux8_1 port map(S => S, A(0) => A(5), A(1) => A(6), A(2) => A(7), A(3) => A(0), A(4) => A(1), A(5) => A(2), A(6) => A(3), A(7) => A(4), y => Y(5));
    mux6:mux8_1 port map(S => S, A(0) => A(6), A(1) => A(7), A(2) => A(0), A(3) => A(1), A(4) => A(2), A(5) => A(3), A(6) => A(4), A(7) => A(5), y => Y(6));
    mux7:mux8_1 port map(S => S, A(0) => A(7), A(1) => A(0), A(2) => A(1), A(3) => A(2), A(4) => A(3), A(5) => A(4), A(6) => A(5), A(7) => A(6), y => Y(7));

end Structural;