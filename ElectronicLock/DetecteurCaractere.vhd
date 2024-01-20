library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DetecteurCaractere is
    Port ( data_in : in STD_LOGIC_VECTOR(15 downto 0);
           detect : out STD_LOGIC);
end DetecteurCaractere;

architecture Behavioral of DetecteurCaractere is

begin

    process(data_in)
    begin
        case data_in is
            when "0010000000000000" | "0000000000000001" | "0000000000000010" | "0000000000000100" | "0000000000010000" | "0000000000100000" | "0000000001000000" | "0000000100000000" |
                 "0000001000000000" | "0000010000000000" | "0000000000001000" | "0000000010000000" | "0000100000000000" | "1000000000000000" | "0100000000000000" | "0001000000000000" =>
                detect <= '1';
            when others =>
                detect <= '0';
        end case;
    end process;

end Behavioral;
