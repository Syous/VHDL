library ieee;
use ieee.std_logic_1164.all;

entity exercise2 is
    port
        (
            DS          :   in  std_logic;
            X, Y, Z     :   in  std_logic_vector(7 downto 0);
            MS          :   in  std_logic_vector(1 downto 0);
            CLK         :   in  std_logic;
            RA, RB      :   out std_logic_vector(7 downto 0)        
        );
end entity exercise2;

architecture rtl_exercise2 of exercise2 is
 
    --  signal declaration
    signal  mux_out, reg_RA, reg_RB     :   std_logic_vector(7 downto 0);
    signal  LD                          :   std_logic;
    signal  LD_A, LD_B                  :   std_logic;
    --  component declaration

    --  1 to 2 decoder
    component decoder1to2 is
        port
            (
                DS      :   in  std_logic;
                DEC_OUT :   out std_logic   
            );
    end component decoder1to2;

    --  4 to 1 mux
    component mux4to1 is
        port
            (
                X, Y, Z, RB         :   in  std_logic_vector(7 downto 0);
                MS                  :   in  std_logic_vector(1 downto 0);
                MUX_OUT             :   out std_logic_vector(7 downto 0)
            );
    end component mux4to1;

    --  8 bit register
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

        myDec1to2       :   decoder1to2 port map
            (   
                DS          =>  DS,
                DEC_OUT     =>  LD
            );
        
        myMux4to1       :   mux4to1 port map
            (
                X       =>  X,
                Y       =>  Y,
                Z       =>  Z,
                RB      =>  reg_RB,
                MS      =>  MS,
                MUX_OUT =>  mux_out
            );
        
        myReg8bit_A     :   reg8bit port map
            (
                REG_IN      =>  mux_out,
                CLK         =>  CLK,
                LOAD        =>  LD_A,
                REG_OUT     =>  reg_RA
            );
        
        myReg8bit_B     :   reg8bit port map
            (
                REG_IN      =>  reg_RA,
                CLK         =>  CLK,
                LOAD        =>  LD_B,
                REG_OUT     =>  reg_RB
            );
        --  if statement to take the value of decoder output load value
        --  and determine which register we want to load
        myLD_proc   :   process(LD)
            begin
                case LD is
                    when    '0' =>  LD_A    <=  '1';
                                    LD_B    <=  '0';

                    when    '1' =>  LD_A    <=  '0';
                                    LD_B    <=  '1';

                    when others =>  LD_A    <=  '0';
                                    LD_B    <=  '0';
                end case;
        end process myLD_proc;

        RA  <=  reg_RA;
        RB  <=  reg_RB;
end architecture rtl_exercise2;