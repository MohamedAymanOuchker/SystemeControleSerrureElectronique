library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity tb_Comparator_16bits is
end;

architecture bench of tb_Comparator_16bits is

  component Comparator_16bits
      Port ( input1 : in STD_LOGIC_VECTOR(15 downto 0);
             fixed_key : in STD_LOGIC_VECTOR(15 downto 0) := "0000010011010010";
             ouverture : out STD_LOGIC);
  end component;

  signal input1: STD_LOGIC_VECTOR(15 downto 0);
  signal fixed_key: STD_LOGIC_VECTOR(15 downto 0) := "0000010011010010";
  signal ouverture: STD_LOGIC;

begin

  uut: Comparator_16bits port map ( input1    => input1,
                                    fixed_key => fixed_key,
                                    ouverture => ouverture );

  stimulus: process
  begin
  
    -- Initialization code
    input1 <= "1100110011001100"; -- Set your input value

    wait for 10 ns; -- Allow some time for the simulation to settle
    
    -- Test bench stimulus code
    assert ouverture = '1' report "Test failed when values are not equal" severity error;

    -- Test case when the two values are equal
    input1 <= fixed_key;
    wait for 10 ns;
    assert ouverture = '1' report "Test failed when values are equal" severity error;
    
    wait;
  end process;

end bench;

