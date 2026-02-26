library ieee;
use ieee.std_logic_1164.all;

entity sop_pos_function is
  port (
    x1, x2, x3, x4 : in std_logic;
    y_sop, y_pos : out std_logic
  );
end entity;

architecture structural_nor of sop_pos_function is
  component nor_gate is
    port (a, b : in std_logic; y : out std_logic);
  end component;

  signal A_not, B_not, C_not, D_not : std_logic;
  signal AB, AC_BC_CC, ABComp, ABC, y_sop_c : std_logic;
  signal C_DC, B_C, ABD, CDBC, CDBC_C : std_logic;

begin
  not_A: nor_gate port map (a => x1, b => x1, y => A_not);
  not_B: nor_gate port map (a => x2, b => x2, y => B_not);
  not_C: nor_gate port map (a => x3, b => x3, y => C_not);
  not_D: nor_gate port map (a => x4, b => x4, y => D_not);
  
  nor_1: nor_gate port map (a => A_not, b => B_not, y => AB);
  nor_2: nor_gate port map (a => AB, b => C_not, y => AC_BC_CC);
  nor_3: nor_gate port map (a => AB, b => AB, y => ABComp);
  nor_4: nor_gate port map (a => ABComp, b => C_not, y => ABC);
  nor_5: nor_gate port map (a => AC_BC_CC, b => ABC, y => y_sop_c);
  nor_6: nor_gate port map (a => y_sop_c, b => y_sop_c, y => y_sop);

  nor_7: nor_gate port map (a => x3, b => D_not, y => C_DC);
  nor_8: nor_gate port map (a => x2, b => x3, y => B_C);
  nor_9: nor_gate port map (a => ABComp, b => D_not, y => ABD);
  nor_10: nor_gate port map (a => C_DC, b => B_C, y => CDBC);
  nor_11: nor_gate port map (a => CDBC, b => CDBC, y => CDBC_C);
  nor_12: nor_gate port map (a => ABD, b => CDBC_C, y => y_pos);

end architecture;
