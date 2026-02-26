library ieee;
use ieee.std_logic_1164.all;

entity bcd_to_gray is
  port (
    a, b, c, d : in std_logic;
    w, x, y, z : out std_logic
  );
end entity;

architecture structural of bcd_to_gray is
  -- nor component
  component nor_gate is
    port (
      a, b : in std_logic;
      y : out std_logic
    );
  end component;

  -- internal signals for xor gate:
  -- a xor b = AB' + A'B = ( A N (A N B) ) N ( B N ( A N B ) ), N = nor gate
  
  -- signals for XOR of A and B
  signal not_ab_1, not_a_ab_1, not_b_ab_1 : std_logic;
  signal xor_ab : std_logic;
  
  -- signals for XOR of B and C
  signal not_ab_2, not_a_ab_2, not_b_ab_2 : std_logic;
  signal xor_bc : std_logic;
  
  -- signals for XOR of C and D
  signal not_ab_3, not_a_ab_3, not_b_ab_3 : std_logic;
  signal xor_cd : std_logic;

begin
  -- W = A is just wire
  w <= a;

  -- X = A XOR B
  nor1: nor_gate port map (a => a, b => b, y => not_ab_1);
  nor2: nor_gate port map (a => a, b => not_ab_1, y => not_a_ab_1);
  nor3: nor_gate port map (a => b, b => not_ab_1, y => not_b_ab_1);
  nor4: nor_gate port map (a => not_a_ab_1, b => not_b_ab_1, y => xor_ab);
  x <= xor_ab;

  -- Y = B XOR C
  nor5: nor_gate port map (a => b, b => c, y => not_ab_2);
  nor6: nor_gate port map (a => b, b => not_ab_2, y => not_a_ab_2);
  nor7: nor_gate port map (a => c, b => not_ab_2, y => not_b_ab_2);
  nor8: nor_gate port map (a => not_a_ab_2, b => not_b_ab_2, y => xor_bc);
  y <= xor_bc;

  -- Z = C XOR D
  nor9:  nor_gate port map (a => c, b => d, y => not_ab_3);
  nor10: nor_gate port map (a => c, b => not_ab_3, y => not_a_ab_3);
  nor11: nor_gate port map (a => d, b => not_ab_3, y => not_b_ab_3);
  nor12: nor_gate port map (a => not_a_ab_3, b => not_b_ab_3, y => xor_cd);
  z <= xor_cd;
end architecture;
