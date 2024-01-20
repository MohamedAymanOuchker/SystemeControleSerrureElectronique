library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity tb_DetecteurCaractere is
end;

architecture bench of tb_DetecteurCaractere is

  component DetecteurCaractere
      Port ( data_in : in STD_LOGIC_VECTOR(15 downto 0);
             detect : out STD_LOGIC);
  end component;

  signal data_in: STD_LOGIC_VECTOR(15 downto 0);
  signal detect: STD_LOGIC;

begin

  uut: DetecteurCaractere port map ( data_in => data_in,
                                     detect  => detect );

  stimulus: process
  begin
    -- Test case 1: Test with a matching value
    data_in <= "0000000000001000"; -- Set a matching value
    wait for 10 ns;
    assert detect = '1' report "Test case 1 failed" severity error;

    -- Test case 2: Test with a non-matching value
    data_in <= "0000000000000010"; -- Set a non-matching value
    wait for 10 ns;
    assert detect = '0' report "Test case 2 failed" severity error;

    -- Test case 3: Test with another matching value
    data_in <= "0000000000100000"; -- Set another matching value
    wait for 10 ns;
    assert detect = '1' report "Test case 3 failed" severity error;

    -- Test case 4: Test with an unmatched value
    data_in <= "1111111111111111"; -- Set a value not covered in the case statement
    wait for 10 ns;
    assert detect = '0' report "Test case 4 failed" severity error;

    wait;
  end process;

end bench;

