library ieee;
use ieee.std_logic_1164.all;

entity logic_circuit is
  port (
    x1, x2, x3, x4  : in std_logic;
    f               : out std_logic
  );
end entity;

architecture structural of logic_circuit is
  -- component declarations
  component and_gate is
    port (
      a, b : in std_logic;
      y    : out std_logic
    );
  end component;

  component or_gate is
    port (
      a, b : in std_logic;
      y    : out std_logic
    );
  end component;

  component not_gate is
    port (
      a : in std_logic;
      y : out std_logic
    );
  end component;

  component and3_gate is
    port (
      a, b, c : in std_logic;
      y       : out std_logic
    );
  end component;

  -- internal signals
  signal BC, A_B, BC_C, A_C, BC_D : std_logic;
begin
  U1: not_gate port map (a => x2, y => BC);

  U2: and_gate port map (a => x1, b => x2, y => A_B);

  U3: and_gate port map (a => BC, b => x3, y => BC_C);

  U4: or_gate port map (a => A_B, b => BC_C, y => A_C);

  U5: and3_gate port map (a => BC, b => x3, c => x4, y => BC_D);

  U6: or_gate port map (a => A_C, b => BC_D, y => f);

end architecture;
