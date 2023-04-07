library ieee;
use ieee.std_logic_1164.all;

entity two_bit_and is
    port
    (
        A_IN, B_IN  :   in std_logic;
        F_OUT       :   out std_logic
    );
end entity two_bit_and;

architecture rtl of two_bit_and is
    F_OUT   <=  A_IN and B_IN;
end architecture rtl;