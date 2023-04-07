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
    
    --XNOR component    
    component example22_xnor is
        port
        (
            A_IN, B_IN  :   in std_logic;
            F_OUT       :   out std_logic
        );

    end component example22_xnor;
    
    -- AND component
    component example22_and is
        port
        (
            A_IN, B_IN, C_IN    :   in std_logic;
            F_OUT               :   out std_logic 
        );
    end component example22_and;
    
    signal xnor1_out, xnor2_out, xnor3_out  :   std_logic;

    begin
        
        -- create the 3 individual xnor's for each input in this comparator
        xnor1   :   example22_xnor  port map    (A_IN(0), B_IN(0), xnor1_out);
        xnor2   :   example22_xnor  port map    (A_IN(1), B_IN(1), xnor2_out);
        xnor3   :   example22_xnor  port map    (A_IN(2), B_IN(2), xnor3_out);
        
        -- create the 3-input and gate using the output signals from the xnors
        and3    :   example22_and   port map    (xnor1_out, xnor2_out, xnor3_out, EQ_OUT);
end architecture arch_3bitcomp;