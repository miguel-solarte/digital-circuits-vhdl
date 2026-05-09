library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity D_latch_st is

    port(data : in STD_LOGIC;
         enable : in STD_LOGIC;
         q : out STD_LOGIC;
         q_bar : out STD_LOGIC);
           
end D_latch_st;

architecture Structural of D_latch_st is

    component nand_gate is

        port(a : in STD_LOGIC;
             b : in STD_LOGIC;
             o : out STD_LOGIC);
           
    end component;


    signal nand0_sig, nand1_sig : std_logic;
    signal q_int, q_bar_int     : std_logic;

begin

    nand0: nand_gate port map(a => data,      b => enable, o => nand0_sig);
    nand1: nand_gate port map(a => nand0_sig, b => enable, o => nand1_sig);
    nand2: nand_gate port map(a => nand0_sig, b => q_bar_int, o => q_int);
    nand3: nand_gate port map(a => nand1_sig, b => q_int,     o => q_bar_int);

    q     <= q_int;
    q_bar <= q_bar_int;

end Structural;