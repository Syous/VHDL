library ieee;
use ieee.std_logic_1164.all;

entity decoder1to2 is
    port
        (
            DS      :   in  std_logic;
            DEC_OUT :   out std_logic
        );
end entity decoder1to2;

architecture rtl_decoder1to2 of decoder1to2 is
    begin
        myDec_proc      :   process(DS)
            begin
                case DS is
                    when    '0' =>  DEC_OUT <=  '0';
                    when    '1' =>  DEC_OUT <=  '1';
                    when others =>  DEC_OUT <=  '0';
                end case;
        end process myDec_proc;
end architecture rtl_decoder1to2;