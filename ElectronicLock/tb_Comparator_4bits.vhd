library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity tb_Comparator_4bits is
end;

architecture bench of tb_Comparator_4bits is

  component Comparator_4bits
      Port ( input1 : in STD_LOGIC_VECTOR(3 downto 0);
             input2 : in STD_LOGIC_VECTOR(3 downto 0);
             equal : out STD_LOGIC);
  end component;

  signal input1: STD_LOGIC_VECTOR(3 downto 0);
  signal input2: STD_LOGIC_VECTOR(3 downto 0);
  signal equal: STD_LOGIC;

begin

  uut: Comparator_4bits port map ( input1 => input1,
                                   input2 => input2,
                                   equal  => equal );

  stimulus: process
  begin
    -- Initialization
    input1 <= "0000";
    input2 <= "0000";
    wait for 10 ns;
    assert equal = '1' report "Error: Test case 0 failed" severity failure;

    -- Test case 1: Set different values
    input1 <= "0101";
    input2 <= "1010";
    wait for 10 ns;
    assert equal = '0' report "Error: Test case 1 failed" severity failure;

    -- Test case 2: Set equal values
    input1 <= "1100";
    input2 <= "1100";
    wait for 10 ns;
    assert equal = '1' report "Error: Test case 2 failed" severity failure;

    wait;
  end process;

end bench;

