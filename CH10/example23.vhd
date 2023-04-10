library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity example23 is
    port
    (
        LD      :   in  std_logic;
        CLK     :   in  std_logic;
        REG_IN  :   in  std_logic_vector(7 downto 0);
        REG_OUT :   out std_logic_vector(7 downto 0)
    );
end entity example23;

architecture example23_8bitreg of example23 is
    begin
        reg_process :   process(CLK)
            if  (rising_edge(CLK))    then
                if  (LD = '1')  then
                    REG_OUT <=  REG_IN;
                end if;
            end if;
        end process reg_process;
end architecture example23_8bitreg;