library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Codeur is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           data_in : in STD_LOGIC_VECTOR(15 downto 0);
           data_s : out STD_LOGIC_VECTOR(3 downto 0));
end Codeur;

architecture Behavioral of Codeur is
    signal code : STD_LOGIC_VECTOR(3 downto 0);

begin

    process(clk, reset)
    begin
        if reset = '1' then
            code <= "0000";
        elsif rising_edge(clk) then
            -- Codeur logique
            case data_in is
                when "0010000000000000" =>
                    code <= "0000";
                when "0000000000000001" =>
                    code <= "0001";
                when "0000000000000010" =>
                    code <= "0010";
                when "0000000000000100" =>
                    code <= "0011";
                when "0000000000010000" =>
                    code <= "0100";
                when "0000000000100000" =>
                    code <= "0101";
                when "0000000001000000" =>
                    code <= "0110";
                when "0000000100000000" =>
                    code <= "0111";
                when "0000001000000000" =>
                    code <= "1000";
                when "0000010000000000" =>
                    code <= "1001";
                when "0000000000001000" =>
                    code <= "1010";
                when "0000000010000000" =>
                    code <= "1011";
                when "0000100000000000" =>
                    code <= "1100";
                when "1000000000000000" =>
                    code <= "1101";
                when "0100000000000000" =>
                    code <= "1110";
                when "0001000000000000" =>
                    code <= "1111";
                when others =>
                    code <= "0000";
            end case;
        end if;
    end process;

    data_s <= code;

end Behavioral;

