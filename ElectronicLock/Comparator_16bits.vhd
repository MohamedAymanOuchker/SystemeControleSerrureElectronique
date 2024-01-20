library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Comparator_16bits is
    Port ( input1 : in STD_LOGIC_VECTOR(15 downto 0);
           fixed_key : in STD_LOGIC_VECTOR(15 downto 0) := "0000010011010010"; -- 1234 en binaire
           ouverture : out STD_LOGIC);
end Comparator_16bits;

architecture Behavioral of Comparator_16bits is
    signal equal_4bits : STD_LOGIC_VECTOR(3 downto 0);
    signal ouverture_4bits : STD_LOGIC;
    
    component Comparator_4bits
        Port ( input1 : in STD_LOGIC_VECTOR(3 downto 0);
               input2 : in STD_LOGIC_VECTOR(3 downto 0);
               equal : out STD_LOGIC);
    end component;

begin
    -- Comparateurs 4-bits en cascade
    comp0: Comparator_4bits port map(input1(3 downto 0), fixed_key(3 downto 0), equal_4bits(0));
    comp1: Comparator_4bits port map(input1(7 downto 4), fixed_key(7 downto 4), equal_4bits(1));
    comp2: Comparator_4bits port map(input1(11 downto 8), fixed_key(11 downto 8), equal_4bits(2));
    comp3: Comparator_4bits port map(input1(15 downto 12), fixed_key(15 downto 12), equal_4bits(3));

    -- Porte ET pour le résultat final
    process (equal_4bits)
    begin
        if equal_4bits = "1111" then
            ouverture_4bits <= '1';
        else
            ouverture_4bits <= '0';
        end if;
    end process;

    ouverture <= ouverture_4bits;

end Behavioral;
