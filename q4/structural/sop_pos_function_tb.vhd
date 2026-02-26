library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sop_pos_function_tb is
end entity;

architecture sim of sop_pos_function_tb is
  signal x1, x2, x3, x4 : std_logic := '0';
  signal y_sop, y_pos : std_logic;
  signal test_vector : std_logic_vector(3 downto 0);

begin
  UUT: entity work.sop_pos_function(structural_nor)
    port map(
      x1 => x1, x2 => x2, x3 => x3, x4 => x4,
      y_sop => y_sop, y_pos => y_pos
    );

    -- connect test vector to inputs
    x1 <= test_vector(3);
    x2 <= test_vector(2);
    x3 <= test_vector(1);
    x4 <= test_vector(0);

    -- test process
    process
    begin
      for i in 0 to 15 loop
        test_vector <= std_logic_vector(to_unsigned(i, 4));
        wait for 10 ns;
      end loop;

      report "Simulation complete";
      wait;
    end process;

end architecture;
