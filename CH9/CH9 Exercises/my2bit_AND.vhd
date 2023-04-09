library ieee;
use ieee.std_logic_1164.all;

entity my2bit_AND is
    port
    (
        A, B    :   in  std_logic;
        F       :   out std_logic
    );
end entity my2bit_AND;

architecture rtl_my2bit_AND of my2bit_AND is
    begin
        -- 2-bit AND gate
        F   <=  A and B;
end architecture rtl_my2bit_AND;