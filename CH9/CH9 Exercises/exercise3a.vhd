library ieee;
use ieee.std_logic_1164.all;

entity exercise3a is
    port
    (
        A, B, C :   in  std_logic;
        F       :   out std_logic
    );
end entity exercise3a;

architecture rtl_exercise3a of exercise3a is
    --  and gate output signal declarations
    signal  myand1_out, myand2_out              :   std_logic;

    --  not gate output signal declarations
    signal  mynot1_out, mynot2_out, mynot3_out  :   std_logic;

    --  and gate component declaration
    component my2bit_AND is
        port
        (
            A, B    :   in  std_logic;
            F       :   out std_logic
        );
    end component my2bit_AND;

    -- or gate component declaration
    component my2bit_OR is
        port
        (
            A, B    :   in  std_logic;
            F       :   out std_logic
        );
    end component my2bit_OR;

    -- not gate component declaration
    component my1bit_NOT is
        port
        (
            A   :   in  std_logic;
            F   :   out std_logic
        );
    end component my1bit_NOT;

    begin
        --  instantiate component and gates
        my2bit_and1 :   my2bit_AND  port map    (A, mynot1_out, myand1_out);
        my2bit_and2 :   my2bit_AND  port map    (mynot2_out, mynot3_out, myand2_out);
        
        --  instantiate component or gate
        my2bit_or1  :   my2bit_OR   port map    (myand1_out, myand2_out, F);

        --  instantiate component not gates
        my1bit_not1 :   my1bit_NOT  port map    (B, mynot1_out);
        my1bit_not2 :   my1bit_NOT  port map    (A, mynot2_out);
        my1bit_not3 :   my1bit_not  port map    (C, mynot3_out);
end architecture rtl_exercise3a;