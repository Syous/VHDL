library ieee;
use ieee.std_logic_1164.all;

entity dec_3to8 is
    port
    (
        dec_in0, dec_in1, dec_in2   :   in std_logic;
        CLK                         :   in std_logic;
        dec_out                     :   out std_logic_vector(7 downto 0)
    );
end entity dec_3to8;

architecture rtl_dec_3to8 of dec_3to8 is

    signal dec_out_tmp  :   std_logic_vector(7 downto 0);
    signal ins          :   std_logic_vector(2 downto 0); 

begin

    myClkDec_proc   :   process(CLK)
		begin
            if  (rising_edge(CLK))  then
                dec_out <=  dec_out_tmp;
            end if;
    end process myClkDec_proc;

    ins     <=  dec_in0 & dec_in1 & dec_in2;

    myCaseDec_proc	:	process(ins)	 
        begin
            case ins is
                        when    "000"	=>	dec_out_tmp	<=	"00000001";
                        when    "001"   =>  dec_out_tmp <=  "00000010";
                        when    "010"   =>  dec_out_tmp <=  "00000100";
                        when    "011"   =>  dec_out_tmp <=  "00001000";
                        when    "100"   =>  dec_out_tmp <=  "00010000";
                        when    "101"   =>  dec_out_tmp <=  "00100000";
                        when    "110"   =>  dec_out_tmp <=  "01000000";
                        when    "111"   =>  dec_out_tmp <=  "10000000";
                        when    others  =>  dec_out_tmp <=  "00000000";
            end case;
    end process myCaseDec_proc;
end architecture rtl_dec_3to8;