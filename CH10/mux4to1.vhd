library ieee;
use ieee.std_logic_1164.all;

entity mux4to1 is
    port
        (
            X, Y, Z, RB         :   in  std_logic_vector(7 downto 0);
            MS                  :   in  std_logic_vector(1 downto 0);
            MUX_OUT             :   out std_logic_vector(7 downto 0)
        );
end entity mux4to1;

architecture rtl_mux4to1 of mux4to1 is
    begin
        myMux4to1_proc  :   process(X, Y, Z, RB, MS)
            begin
                case MS is
                    when "00"   =>  MUX_OUT <=  RB;
                    when "01"   =>  MUX_OUT <=  Z;
                    when "10"   =>  MUX_OUT <=  Y;
                    when "11"   =>  MUX_OUT <=  X;
                    when others =>  MUX_OUT <=  RB;
                end case;
        end process myMux4to1_proc;
end architecture rtl_mux4to1;