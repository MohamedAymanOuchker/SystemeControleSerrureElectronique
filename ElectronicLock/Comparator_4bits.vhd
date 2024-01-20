library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Comparator_4bits is
    Port ( input1 : in STD_LOGIC_VECTOR(3 downto 0);
           input2 : in STD_LOGIC_VECTOR(3 downto 0);
           equal : out STD_LOGIC);
end Comparator_4bits;

architecture Behavioral of Comparator_4bits is
begin
    equal <= '1' when input1 = input2 else '0';
end Behavioral;
