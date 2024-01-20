library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity tb_Memory is
end;

architecture bench of tb_Memory is

  component Memory
      Port ( clk : in STD_LOGIC;
             reset : in STD_LOGIC;
             detect : in STD_LOGIC;
             data_s : in STD_LOGIC_VECTOR(3 downto 0);
             code_sig : out STD_LOGIC_VECTOR(15 downto 0));
  end component;

  signal clk: STD_LOGIC;
  signal reset: STD_LOGIC;
  signal detect: STD_LOGIC;
  signal data_s: STD_LOGIC_VECTOR(3 downto 0);
  signal code_sig: STD_LOGIC_VECTOR(15 downto 0);

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin

  uut: Memory port map ( clk      => clk,
                         reset    => reset,
                         detect   => detect,
                         data_s   => data_s,
                         code_sig => code_sig );

  stimulus: process
  begin
    -- Initialization code

    reset <= '1';
    wait for 5 ns;
    reset <= '0';
    wait for 5 ns;

    -- Test bench stimulus code

    -- Test 1
    data_s <= "1101"; -- Set your input data
    detect <= '1';
    wait for 10 ns;
    assert code_sig = "0000110100000000" report "Test 1 failed" severity error;

    -- Test 2
    data_s <= "0010"; -- Set your input data
    detect <= '1';
    wait for 10 ns;
    assert code_sig = "0000001000000000" report "Test 2 failed" severity error;

    -- Test 3
    data_s <= "1111"; -- Set your input data
    detect <= '1';
    wait for 10 ns;
    assert code_sig = "0000111100000000" report "Test 3 failed" severity error;

    -- Deactivate detect for subsequent tests
    detect <= '0';

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

end;

