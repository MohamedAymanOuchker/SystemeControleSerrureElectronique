library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity tb_Codeur is
end;

architecture bench of tb_Codeur is

  component Codeur
      Port ( clk : in STD_LOGIC;
             reset : in STD_LOGIC;
             data_in : in STD_LOGIC_VECTOR(15 downto 0);
             data_s : out STD_LOGIC_VECTOR(3 downto 0));
  end component;

  signal clk: STD_LOGIC;
  signal reset: STD_LOGIC;
  signal data_in: STD_LOGIC_VECTOR(15 downto 0);
  signal data_s: STD_LOGIC_VECTOR(3 downto 0);

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin

  uut: Codeur port map ( clk     => clk,
                         reset   => reset,
                         data_in => data_in,
                         data_s  => data_s );

  stimulus: process
  begin
    -- Initialization
    reset <= '1';
    wait for 5 ns;
    reset <= '0';
    wait for 5 ns;

    -- Test case 1: Test with a specific input
    data_in <= "0010000000000000"; -- Set a specific input
    wait for 10 ns;
    assert data_s = "0000" report "Test case 1 failed" severity error;

    -- Test case 2: Test with another input
    data_in <= "0000000000000010"; -- Set another input
    wait for 10 ns;
    assert data_s = "0010" report "Test case 2 failed" severity error;

    -- Test case 3: Test with a default case
    data_in <= "1111111111111111"; -- Set a default input
    wait for 10 ns;
    assert data_s = "0000" report "Test case 3 failed" severity error;

    stop_the_clock <= true;
    wait;
  end process;

  clocking: process
  begin
    while not stop_the_clock loop
      clk <= '0', '1' after clock_period / 2;
      wait for clock_period;
    end loop;
    wait;
  end process;

end bench;

