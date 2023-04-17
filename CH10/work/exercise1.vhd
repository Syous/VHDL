library ieee;
use ieee.std_logic_1164.all;

entity exercise1 is
    port
    (
        A, B            :   in  std_logic_vector(7 downto 0);
        LDA, CLK, SEL   :   in  std_logic;
        F               :   out std_logic_vector(7 downto 0)
    );
end entity exercise1;

architecture rtl_exercise1 of exercise1 is
    
    --  signal declarations
    signal mux_out  :   std_logic_vector(7 downto 0);
    
    --  component declarations
    --  8-bit input, 2-bit select mux, 8-bit out
    component mux8bit is
        port
        (
            D1_IN, D2_IN        :       in  std_logic_vector(7 downto 0);
            SEL                 :       in  std_logic;
            MUX_OUT             :       out std_logic_vector(7 downto 0)
        );
    end component mux8bit;
    
    --  8-bit in, 8-bit out, synchronous mux with load
    component reg8bit is
        port
        (
            REG_IN      :       in  std_logic_vector(7 downto 0);
            CLK         :       in  std_logic;
            LOAD        :       in  std_logic;
            REG_OUT     :       out std_logic_vector(7 downto 0)
        );
    end component reg8bit;

    begin
        -- Mux component instantiation
        myMux8Bit   :   mux8bit port map
            (
                D1_IN   =>  A,
                D2_IN   =>  B,
                SEL     =>  SEL,
                MUX_OUT =>  mux_out
            );

        -- 8-bit input register component instantiation
        myReg8Bit   :   reg8bit port map
            (
                REG_IN  =>  mux_out,
                CLK     =>  CLK,
                LOAD    =>  LDA,
                REG_OUT =>  F
            );
end architecture rtl_exercise1;