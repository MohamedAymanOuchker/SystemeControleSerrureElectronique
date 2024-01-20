library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity tb_Register_4bits is
end;

architecture bench of tb_Register_4bits is

  component Register_4bits
      Port ( D : in STD_LOGIC_VECTOR(3 downto 0);
             clk : in STD_LOGIC;
             reset : in STD_LOGIC;
             Enable : in STD_LOGIC;
             Q : out STD_LOGIC_VECTOR(3 downto 0));
  end component;

  signal D: STD_LOGIC_VECTOR(3 downto 0);
  signal clk: STD_LOGIC;
  signal reset: STD_LOGIC;
  signal Enable: STD_LOGIC;
  signal Q: STD_LOGIC_VECTOR(3 downto 0);

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin

  uut: Register_4bits port map ( D      => D,
                                 clk    => clk,
                                 reset  => reset,
                                 Enable => Enable,
                                 Q      => Q );

  stimulus: process
  begin
    -- Initialization
    D <= (others => '0');
    reset <= '1';
    wait for 5 ns;
    reset <= '0';
    wait for 5 ns;

    -- Test case 1: Enable the register
    Enable <= '1';
    D <= "1101";
    wait for 10 ns;
    assert Q = "1101" report "Error: Test case 1 failed" severity failure;

    -- Test case 2: Disable the register
    Enable <= '0';
    D <= "0011";
    wait for 10 ns;
    assert Q = "1101" report "Error: Test case 2 failed" severity failure;

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

