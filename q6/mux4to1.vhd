library ieee;
use ieee.std_logic_1164.all;

entity mux4to1 is
  port (
    x1, x2, x3, x4 : in std_logic;
    s0, s1 : in std_logic;
    y : out std_logic
  );
end entity mux4to1;

architecture structural of mux4to1 is
  component mux2to1 is
    port (
      a, b, sel : in std_logic;
      y : out std_logic
    );
  end component;

  signal mux1_out : std_logic;
  signal mux2_out : std_logic;

begin
  mux1 : mux2to1 port map (
    a => x1,
    b => x2,
    sel => s0,
    y => mux1_out
  );

  mux2 : mux2to1 port map (
    a => x3,
    b => x4,
    sel => s0,
    y => mux2_out
  );

  mux3 : mux2to1 port map (
    a => mux1_out,
    b => mux2_out,
    sel => s1,
    y => y
  );

end architecture structural;
