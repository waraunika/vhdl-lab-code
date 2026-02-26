library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bcd_to_gray_tb is
end entity;

architecture sim of bcd_to_gray_tb is
  signal a, b, c, d : std_logic := '0';
  signal w, x, y, z : std_logic;
  signal test_vector : std_logic_vector(3 downto 0);

begin
  -- uut for dataflow
  UUT: entity work.bcd_to_gray(structural)
    port map(
      a => a, b => b, c => c, d => d,
      w => w, x => x, y => y, z => z
    );

  a <= test_vector(3);
  b <= test_vector(2);
  c <= test_vector(1);
  d <= test_vector(0);

  process
  begin
    for i in 0 to 15 loop
      test_vector <= std_logic_vector(to_unsigned(i, 4));
      wait for 10 ns;
    end loop;
    wait;
  end process;
end architecture;
