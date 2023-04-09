library ieee;
use ieee.std_logic_1164.all;

entity my2bit_OR is
    port
    (
        A, B    :   in  std_logic;
        F       :   out std_logic
    );
end entity my2bit_OR;

architecture rtl_my2bit_OR of my2bit_OR is
    begin
        -- 2-bit OR gate
        F   <=  A or B;        
end architecture rtl_my2bit_OR;