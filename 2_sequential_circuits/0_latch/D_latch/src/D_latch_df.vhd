library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity D_latch_df is

    port(d : in STD_LOGIC;
         en : in STD_LOGIC;
         q : out STD_LOGIC;
         q_bar : out STD_LOGIC);
           
end D_latch_df;

architecture Dataflow of D_latch_df is

    signal nand0_sig, nand1_sig : std_logic;
    signal q_int, q_bar_int     : std_logic;

begin

    nand0_sig <= d nand en;
    nand1_sig <= en nand nand0_sig;
    q_int <= nand0_sig nand q_bar_int;
    q_bar_int <= q_int nand nand1_sig;

    q     <= q_int;
    q_bar <= q_bar_int;

end Dataflow;