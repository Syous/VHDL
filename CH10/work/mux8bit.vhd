library ieee;
use ieee.std_logic_1164.all;

entity mux8bit is
    port
    (
        D1_IN, D2_IN        :       in  std_logic_vector(7 downto 0);
        SEL                 :       in  std_logic;
        MUX_OUT             :       out std_logic_vector(7 downto 0)
    );
end entity mux8bit;

architecture rtl_mux8bit of mux8bit is
    begin
        myMUX_proc  :   process(SEL, D1_IN, D2_IN)
            begin
                case SEL is
                    when '0'    =>  MUX_OUT <=  D1_IN;  
                    when '1'    =>  MUX_OUT <=  D2_IN;
                    when others =>  MUX_OUT <=  D1_IN;
                end case;
        end process myMUX_proc;
end architecture rtl_mux8bit;