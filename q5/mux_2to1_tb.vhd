library ieee;
use ieee.std_logic_1164.all;

entity mux_2to1_tb is
end entity;

architecture behavioral of mux_2to1_tb is
  component mux_2to1 is
    port (
      x1, x2 : in std_logic;
      s : in std_logic;
      y : out std_logic
    );
  end component;

  signal x1_tb, x2_tb : std_logic;
  signal s_tb : std_logic;
  signal y_when_else, y_if_then_else : std_logic;

begin
  uut_when_else: entity work.mux_2to1(when_else)
    port map (
      x1 => x1_tb,
      x2 => x2_tb,
      s => s_tb,
      y => y_when_else
    );

  uut_if_then_else: entity work.mux_2to1(if_then_else)
    port map (
      x1 => x1_tb,
      x2 => x2_tb,
      s => s_tb,
      y => y_if_then_else
    );

  process
  begin
    -- test case 1: s = 0, select x1
    x1_tb <= '0';
    x2_tb <= '1';
    s_tb <= '0';
    wait for 10 ns;

    -- test case 2: s = 0, select x1
    x1_tb <= '1';
    x2_tb <= '0';
    s_tb <= '0';
    wait for 10 ns;
        
    -- test case 3: s = 1, select x2
    x1_tb <= '0';
    x2_tb <= '1';
    s_tb <= '1';
    wait for 10 ns;
    
    -- Test case 4: s = 1, select x2
    x1_tb <= '1';
    x2_tb <= '0';
    s_tb <= '1';
    wait for 10 ns;
    
    -- Test case 5: toggle s
    x1_tb <= '1';
    x2_tb <= '0';
    s_tb <= '0';
    wait for 10 ns;
    s_tb <= '1';
    wait for 10 ns;
    
    -- Test case 6: toggle x1, x2 with s=0
    x1_tb <= '0';
    x2_tb <= '1';
    s_tb <= '0';
    wait for 10 ns;
    x1_tb <= '1';
    x2_tb <= '0';
    wait for 10 ns;
    
    -- Test case 7: toggle x1, x2 with s=1
    x1_tb <= '0';
    x2_tb <= '1';
    s_tb <= '1';
    wait for 10 ns;
    x1_tb <= '1';
    x2_tb <= '0';
    wait for 10 ns;
    
    wait;
  end process;
end architecture;
    
