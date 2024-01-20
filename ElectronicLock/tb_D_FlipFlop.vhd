library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity tb_D_FlipFlop is
end;

architecture bench of tb_D_FlipFlop is

  component D_FlipFlop
      Port ( D : in STD_LOGIC;
             clk : in STD_LOGIC;
             reset : in STD_LOGIC;
             Enable : in STD_LOGIC;
             Q : out STD_LOGIC);
  end component;

  signal D: STD_LOGIC := '0';
  signal clk: STD_LOGIC := '0';
  signal reset: STD_LOGIC := '0';
  signal Enable: STD_LOGIC := '0';
  signal Q: STD_LOGIC;

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin

  uut: D_FlipFlop port map ( D      => D,
                             clk    => clk,
                             reset  => reset,
                             Enable => Enable,
                             Q      => Q );

  stimulus: process
  begin
  
    -- Initialization code

    reset <= '1';
    wait for 5 ns;
    reset <= '0';
    wait for 5 ns;

    -- Test bench stimulus code

    -- Test case 1: Enable the flip-flop
    Enable <= '1';
    D <= '1';
    wait for 10 ns;
    assert Q = '1' report "Test case 1 failed" severity error;

    -- Test case 2: Disable the flip-flop
    Enable <= '0';
    D <= '0';
    wait for 10 ns;
    assert Q = '1' report "Test case 2 failed" severity error;

    -- Test case 3: Reset the flip-flop
    reset <= '1';
    wait for 10 ns;
    assert Q = '0' report "Test case 3 failed" severity error;

    -- Test case 4: Enable the flip-flop with a different input
    Enable <= '1';
    D <= '0';
    wait for 10 ns;
    assert Q = '0' report "Test case 4 failed" severity error;

    stop_the_clock <= true;
    wait;
  end process;

  clocking: process
  begin
    while not stop_the_clock loop
      clk <= not clk after clock_period / 2;
      wait for clock_period;
    end loop;
    wait;
  end process;

end bench;

