library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity q1_tb is
end entity;

architecture sim of q1_tb is
  signal x1, x2, x3, x4 : std_logic := '0';
  signal f : std_logic;
begin
  -- unit under test
  UUT: entity work.logic_circuit(dataflow)
    port map(x1 => x1, x2 => x2, x3 => x3, x4 => x4, f => f);

  process
    variable input_vec : unsigned(3 downto 0); 
  begin
    for i in 0 to 15 loop
      -- convert integer to 4-bit vector and assign to inputs
      input_vec := to_unsigned(i, 4);
      x4 <= input_vec(3);
      x3 <= input_vec(2);
      x2 <= input_vec(1);
      x1 <= input_vec(0);
      wait for 10 ns;
    end loop;

    wait;
  end process;
end architecture;
