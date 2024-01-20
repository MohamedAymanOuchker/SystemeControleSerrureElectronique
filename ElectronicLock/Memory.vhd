library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Memory is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           detect : in STD_LOGIC;
           data_s : in STD_LOGIC_VECTOR(3 downto 0);
           code_sig : out STD_LOGIC_VECTOR(15 downto 0));
end Memory;

architecture Behavioral of Memory is
    signal reg1, reg2, reg3, reg4 : STD_LOGIC_VECTOR(3 downto 0);
begin

    process (clk, reset)
    begin
        if reset = '1' then
            reg1 <= (others => '0');
            reg2 <= (others => '0');
            reg3 <= (others => '0');
            reg4 <= (others => '0');
        elsif rising_edge(clk) then
            if detect = '1' then
                reg1 <= data_s;
                reg2 <= reg1;
                reg3 <= reg2;
                reg4 <= reg3;
            end if;
        end if;
    end process;

    code_sig <= reg4 & reg3 & reg2 & reg1;

end Behavioral;
