library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity majority_2_of_3_tb is
end entity;

architecture sim of majority_2_of_3_tb is
  signal x1, x2, x3 : std_logic := '0';
  signal y : std_logic;
  signal test_vector : std_logic_vector(2 downto 0);

begin
  -- uut for dataflow
  UUT: entity work.majority_2_of_3(structural_nor)
    port map(
      x1 => x1, x2 => x2, x3 => x3, y => y
    );

  x1 <= test_vector(2);
  x2 <= test_vector(1);
  x3 <= test_vector(0);

  process
  begin
    for i in 0 to 7 loop
      test_vector <= std_logic_vector(to_unsigned(i, 3));
      wait for 10 ns;
    end loop;
    wait;
  end process;
end architecture;
