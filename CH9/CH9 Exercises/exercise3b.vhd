library ieee;
use ieee.std_logic_1164.all;

entity exercise3b is
    port
    (
        A, B, C     :   in  std_logic;
        CLK         :   in  std_logic;
        dec_output  :   out std_logic_vector(7 downto 0);
        F           :   out std_logic
    );
end entity exercise3b;

architecture rtl_exercise3b_3to8_decoder of exercise3b is
    -- signal declaration
    signal dec_out0, dec_out1, dec_out2, dec_out3   :   std_logic;

    -- component declaration
    component dec_3to8 is
        port
        (
            dec_in0, dec_in1, dec_in2   :   in std_logic;
            CLK                         :   in std_logic;
            dec_out                     :   out std_logic_vector(7 downto 0)
        );
    end component dec_3to8;

    component my4bit_OR is
        port
        (
            A, B, C, D  :   in  std_logic;
            F           :   out std_logic
        );
    end component my4bit_OR;

    begin

        --  port map entity inputs to local decoder signals/outputs
        myDec_3to8  :   dec_3to8    port map    
            (
                dec_in0     =>  A,
                dec_in1     =>  B,
                dec_in2     =>  C,
                CLK         =>  CLK,
                dec_out(0)  =>  dec_out0,
                dec_out(1)  =>  dec_out1,
                dec_out(2)  =>  dec_out2,
                dec_out(3)  =>  dec_out3,
                dec_out(4)  =>  dec_output(4),
                dec_out(5)  =>  dec_output(5),
                dec_out(6)  =>  dec_output(6),
                dec_out(7)  =>  dec_output(7)
            );        

        --  port map decoder to outputs
        dec_output(0)    <=  dec_out0;
        dec_output(1)    <=  dec_out1;
        dec_output(2)    <=  dec_out2;
        dec_output(3)    <=  dec_out3;

        my4bit_OR1  :   my4bit_OR   port map    
            (
                A   =>  dec_out0,
                B   =>  dec_out1,
                C   =>  dec_out2,
                D   =>  dec_out3,
                F   =>  F
            );
end architecture rtl_exercise3b_3to8_decoder;