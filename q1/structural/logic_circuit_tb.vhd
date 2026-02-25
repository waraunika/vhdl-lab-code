library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity logic_circuit_tb is
end entity;

architecture testbench of logic_circuit_tb is
  component logic_circuit is
    port (
      x1, x2, x3, x4  : in std_logic;
      f               : out std_logic
    );
  end component;

  -- signals to connect to each component;
  signal x1, x2, x3, x4: std_logic := '0';
  signal f_dataflow, f_behavioral, f_structural : std_logic;

  -- for verification
  signal expected: std_logic;

  -- time constant
  constant simulation_time : time := 10 ns;

begin
 -- start different architectures
  UUT_dataflow: entity work.logic_circuit(dataflow)
    port map (x1 => x1, x2 => x2, x3 => x3, x4 => x4, f => f_dataflow);

  UUT_behavioral: entity work.logic_circuit(behavioral)
    port map (x1 => x1, x2 => x2, x3 => x3, x4 => x4, f => f_behavioral);

  UUT_structural: entity work.logic_circuit(structural)
    port map (x1 => x1, x2 => x2, x3 => x3, x4 => x4, f => f_structural);

  -- stimulus process
  stimulus: process
  begin
    -- test all 16 combinations of inputs
    for i in 0 to 15 loop
      -- convert integer to 4-bit vector and assign to inputs
      (x4, x3, x2, x1) <= to_unsigned(i, 4);
      wait for 10 ns;
    end loop;

    wait for 20 ns;
    report "Simulation completed" severity note;
    wait;
  end process;

  -- expected value calculation
  expected <= (x1 and x2) or ((not x2) and x3) or ((not x2) and x3 and x4);

  -- verification process
  verification: process
  begin
    wait for 5 ns;
    assert (f_dataflow = expected)
      report "Dataflow mismatch: x1=" & std_logic'image(x1) &
             " x2=" & std_logic'image(x2) &
             " x3=" & std_logic'image(x3) &
             " x4=" & std_logic'image(x4) &
             " f=" & std_logic'image(f_dataflow) &
             " expected=" & std_logic'image(expected)
      severity warning;

    assert (f_behavioral = expected)
      report "Behavioral mismatch" severity warning;
        
    assert (f_structural = expected)
      report "Structural mismatch" severity warning;
  end process;

end architecture;
