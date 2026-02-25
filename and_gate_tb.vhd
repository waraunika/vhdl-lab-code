entity and_gate_tb is
end entity;

architecture test of and_gate_tb is
  signal a, b, y : bit;
begin
  -- Instantiate the design
  uut: entity work.and_gate
    port map (a => a, b => b, y => y );


  -- generate test stimuli
  process
  begin
    a <= '0'; b <= '0'; wait for 10 ns;
    a <= '0'; b <= '1'; wait for 10 ns;
    a <= '1'; b <= '0'; wait for 10 ns;
    a <= '1'; b <= '1'; wait for 10 ns;
    wait;
  end process;
end architecture;
