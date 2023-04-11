library ieee;
use ieee.std_logic_1164.all;

entity reg8bit is
    port
    (
        REG_IN      :       in  std_logic_vector(7 downto 0);
        CLK         :       in  std_logic;
        LOAD        :       in  std_logic;
        REG_OUT     :       out std_logic_vector(7 downto 0)
    );
end entity reg8bit;

architecture rtl_reg8bit of reg8bit is
    begin
        myCLK_proc  :   process(CLK)
            begin
                if  (rising_edge(CLK))  then
                    if  (LOAD = '1')  then
                        REG_OUT <=  REG_IN;
                    end if;
                end if;
        end process myCLK_proc;
end architecture rtl_reg8bit;