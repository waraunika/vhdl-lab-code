library ieee;
use ieee.std_logic_1164.all;

entity majority_2_of_3 is
  port (
    x1, x2, x3 : in std_logic;
    y : out std_logic
  );
end entity;

architecture structural_nor of majority_2_of_3 is
  -- nor gate component
  component nor_gate is
    port (
      a, b : in std_logic;
      y : out std_logic
    );
  end component;
  
  -- internal signals
  signal n_x2_x3, n_x2_n_x2x3, n_x3_n_x2x3, xor_x2_x3 : std_logic;

  -- for NOT x1
  signal not_x1 : std_logic;

  -- for AND of x1 and xor_x2_x3
  signal n_x1, n_xor, and1 : std_logic;

  -- for AND of not_x1, x2, x3
  signal n_not_x1, n_x2_for_and2, n_x3_for_and2, and2_temp, and2 : std_logic;
  signal n_and2_temp : std_logic;

  -- for OR of and1 and and2
  signal n_or_inputs, or_final : std_logic;

begin
  -- generate NOT x1
  not1: nor_gate port map (a => x1, b => x1, y => not_x1);

  -- generate XOR of x2 and x3
  nor_xor1: nor_gate port map(a => x2, b => x3, y => n_x2_x3);
  nor_xor2: nor_gate port map(a => x2, b => n_x2_x3, y => n_x2_n_x2x3);
  nor_xor3: nor_gate port map(a => x3, b => n_x2_x3, y => n_x3_n_x2x3);
  nor_xor4: nor_gate port map(a => n_x2_n_x2x3, b => n_x3_n_x2x3, y => xor_x2_x3);

  -- generate AND of x1 and xor_x2_x3
  nor_and1_1: nor_gate port map (a => x1, b => x1, y => n_x1);
  nor_and1_2: nor_gate port map (a => xor_x2_x3, b => xor_x2_x3, y => n_xor);
  nor_and1_3: nor_gate port map (a => n_x1, b => n_xor, y => and1);

  -- generate AND of not_x1, x2, x3
  nor_and2_1: nor_gate port map (a => not_x1, b => not_x1, y => n_not_x1);
  nor_and2_2: nor_gate port map (a => x2, b => x2, y => n_x2_for_and2);
  nor_and2_3: nor_gate port map (a => n_not_x1, b => n_x2_for_and2, y => and2_temp);
  
  -- then AND the result with x3
  nor_and2_4: nor_gate port map (a => and2_temp, b => and2_temp, y => n_and2_temp);
  nor_and2_5: nor_gate port map (a => x3, b => x3, y => n_x3_for_and2);
  nor_and2_6: nor_gate port map (a => n_and2_temp, b => n_x3_for_and2, y => and2);

  -- generate OR of and1 and and2
  nor_or1: nor_gate port map (a => and1, b => and2, y => n_or_inputs);
  nor_or2: nor_gate port map (a => n_or_inputs, b => n_or_inputs, y => or_final);
  
  y <= or_final;

end architecture;
