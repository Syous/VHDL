library ieee;
use ieee.std_logic_1164.all;

entity two_bit_xnor is
    port
    (
        A_IN, B_IN  :   in std_logic;
        F_OUT       :   out std_logic
    );
end entity two_bit_xnor;

architecture rtl of two_bit_xnor is
    begin
        F_OUT   <=  A_IN xnor B_IN;
end architecture rtl;