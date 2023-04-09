library ieee;
use ieee.std_logic_1164.all;

entity my1bit_NOT is
    port
    (
        A   :   in  std_logic;
        F   :   out std_logic
    );
end entity my1bit_NOT;

architecture rtl_my1bit_NOT of my1bit_NOT is
    begin
        -- 1-bit NOT gate
        F   <=  not(A);
end architecture rtl_my1bit_NOT;