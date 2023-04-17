library ieee;
use ieee.std_logic_1164.all;

entity example24 is
    port
    (
        D1_IN, D2_IN                    :       in  std_logic_vector(7 downto 0);
        SEL, CLK, LOAD_A, LOAD_B        :       in  std_logic;
        REG_A, REG_B                    :       out std_logic_vector(7 downto 0)
    );
end entity example24;

architecture rtl_example24 of example24 is
    -- signal declaration
    signal  MUX_OUT     :   std_logic_vector(7 downto 0);

    -- component declaration
    --  MUX component
    component mux8bit is
        port
        (
            D1_IN, D2_IN        :       in  std_logic_vector(7 downto 0);
            SEL                 :       in  std_logic;
            MUX_OUT             :       out std_logic_vector(7 downto 0)
        );
    end component mux8bit;

    -- 8-bit register component
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
        my8bitMUX   :   mux8bit port map 
            (
                D1_IN   =>  D1_IN,
                D2_IN   =>  D2_IN,
                SEL     =>  SEL,
                MUX_OUT =>  MUX_OUT
            );

        myReg8Bit_1 :   reg8bit port map
            (
                REG_IN  =>  MUX_OUT,
                CLK     =>  CLK,
                LOAD    =>  LOAD_A,
                REG_OUT =>  REG_A
            );
        
        myReg8Bit_2 :   reg8bit port map
            (
                REG_IN  =>  MUX_OUT,
                CLK     =>  CLK,
                LOAD    =>  LOAD_B,
                REG_OUT =>  REG_B
            );
end architecture rtl_example24;