library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity example22_3bitcomp is
    port
    (
        A_IN, B_IN      :       std_logic_vector(2 downto 0);
        EQ_OUT          :       std_logic
    );
end entity example22_3bitcomp;

architecture arch_3bitcomp of example22_3bitcomp is
    begin
        -- testing
end architecture arch_3bitcomp;