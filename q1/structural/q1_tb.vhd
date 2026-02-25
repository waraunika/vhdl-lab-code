library ieee;
use ieee.std_logic_1164.all;

entity q1_tb is
end entity;

architecture sim of q1_tb is
  signal x1, x2, x3, x4 : std_logic := '0';
  signal f : std_logic;
  
  -- array type for test vectors
  type test_vector is array (0 to 15) of std_logic_vector(3 downto 0);
  constant test_vectors : test_vector := (
    "0000", "0001", "0010", "0011",
    "0100", "0101", "0110", "0111",
    "1000", "1001", "1010", "1011",
    "1100", "1101", "1110", "1111"
  );
  
begin
  -- unit under test - using structural architecture
  UUT: entity work.logic_circuit(structural)
    port map(x1 => x1, x2 => x2, x3 => x3, x4 => x4, f => f);

  process
  begin
    -- iterate through all test vectors
    for i in 0 to 15 loop
      (x4, x3, x2, x1) <= test_vectors(i);
      wait for 10 ns;
    end loop;
    
    -- stop simulation
    wait;
  end process;
end architecture;
