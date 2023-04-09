library ieee;
use ieee.std_logic_1164.all;

entity my4bit_OR is
    port
    (
        A, B, C, D  :   in  std_logic;
        F           :   out std_logic
    );
end entity my4bit_OR;

architecture rtl_my4bit_OR of my4bit_OR is
    begin
        -- 4-bit OR gate
        F   <=  A or B or C or D;        
end architecture rtl_my4bit_OR;