library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity D_FlipFlop is
    Port ( D : in STD_LOGIC;
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           Enable : in STD_LOGIC;
           Q : out STD_LOGIC);
end D_FlipFlop;

architecture Behavioral of D_FlipFlop is
    signal internal_Q : STD_LOGIC;
begin
    process (clk, reset)
    begin
        if reset = '1' then
            internal_Q <= '0';
        elsif rising_edge(clk) then
            if Enable = '1' then
                internal_Q <= D;
            end if;
        end if;
    end process;

    Q <= internal_Q;

end Behavioral;
