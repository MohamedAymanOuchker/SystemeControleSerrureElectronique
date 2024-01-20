library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Register_4bits is
    Port ( D : in STD_LOGIC_VECTOR(3 downto 0);
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           Enable : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR(3 downto 0));
end Register_4bits;

architecture Behavioral of Register_4bits is
    signal internal_Q : STD_LOGIC_VECTOR(3 downto 0);
begin
    process (clk, reset)
    begin
        if reset = '1' then
            internal_Q <= (others => '0');
        elsif rising_edge(clk) then
            if Enable = '1' then
                internal_Q <= D;
            end if;
        end if;
    end process;

    Q <= internal_Q;

end Behavioral;
