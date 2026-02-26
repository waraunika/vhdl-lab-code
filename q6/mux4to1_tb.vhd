library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux4to1_tb is
end entity mux4to1_tb;

architecture behavioral of mux4to1_tb is
  component mux4to1 is
    port (
      x1, x2, x3, x4, s0, s1 : in std_logic;
      y : out std_logic
    );
  end component;

  signal x1_tb : std_logic := '0';
  signal x2_tb : std_logic := '0';
  signal x3_tb : std_logic := '0';
  signal x4_tb : std_logic := '0';
  signal s0_tb : std_logic := '0';
  signal s1_tb : std_logic := '0';
  signal y_tb  : std_logic;

begin
  uut: mux4to1 port map(
    x1 => x1_tb,
    x2 => x2_tb,
    x3 => x3_tb,
    x4 => x4_tb,
    s0 => s0_tb,
    s1 => s1_tb,
    y => y_tb
  );

process
begin
  -- Pattern 1: x1=1, x2=0, x3=1, x4=0
    x1_tb <= '1';
    x2_tb <= '0';
    x3_tb <= '1';
    x4_tb <= '0';
    
    -- Test all select combinations
    -- s1s0 = 00 (select x1)
    s1_tb <= '0'; s0_tb <= '0';
    wait for 10 ns;
    
    -- s1s0 = 01 (select x2)
    s1_tb <= '0'; s0_tb <= '1';
    wait for 10 ns;
    
    -- s1s0 = 10 (select x3)
    s1_tb <= '1'; s0_tb <= '0';
    wait for 10 ns;
    
    -- s1s0 = 11 (select x4)
    s1_tb <= '1'; s0_tb <= '1';
    wait for 10 ns;
    
    -- Pattern 2: x1=0, x2=1, x3=0, x4=1
    x1_tb <= '0';
    x2_tb <= '1';
    x3_tb <= '0';
    x4_tb <= '1';
    
    -- Test all select combinations
    -- s1s0 = 00 (select x1)
    s1_tb <= '0'; s0_tb <= '0';
    wait for 10 ns;
    
    -- s1s0 = 01 (select x2)
    s1_tb <= '0'; s0_tb <= '1';
    wait for 10 ns;
    
    -- s1s0 = 10 (select x3)
    s1_tb <= '1'; s0_tb <= '0';
    wait for 10 ns;
    
    -- s1s0 = 11 (select x4)
    s1_tb <= '1'; s0_tb <= '1';
    wait for 10 ns;

    -- Pattern 3: x1=1, x2=0, x3=0, x4=1
    x1_tb <= '1';
    x2_tb <= '0';
    x3_tb <= '0';
    x4_tb <= '1';
    
    -- Test all select combinations
    -- s1s0 = 00 (select x1)
    s1_tb <= '0'; s0_tb <= '0';
    wait for 10 ns;
    
    -- s1s0 = 01 (select x2)
    s1_tb <= '0'; s0_tb <= '1';
    wait for 10 ns;
    
    -- s1s0 = 10 (select x3)
    s1_tb <= '1'; s0_tb <= '0';
    wait for 10 ns;
    
    -- s1s0 = 11 (select x4)
    s1_tb <= '1'; s0_tb <= '1';
    wait for 10 ns;
    
    report "Simulation completed successfully!";
    wait;
end process;

end architecture Behavioral;
