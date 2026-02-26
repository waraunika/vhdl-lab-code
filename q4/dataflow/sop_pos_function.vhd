library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sop_pos_function is
  port (
    x1, x2, x3, x4 : in std_logic;
    y_sop, y_pos : out std_logic
  );
end entity;

architecture dataflow of sop_pos_function is
  signal inputs : std_logic_vector(3 downto 0);
begin
  inputs <= x1 & x2 & x3 & x4;
  
  -- SOP Form : f = SUM(m0, m1, m4, m5, m8, m9, m14, m15)
  y_sop <= '1' when (inputs = "0000") or -- m0
            (inputs = "0001") or --m1
            (inputs = "0100") or --m4
            (inputs = "0101") or --m5
            (inputs = "1000") or --m8
            (inputs = "1001") or --m9
            (inputs = "1110") or --m14
            (inputs = "1111") else '0'; --m15

  y_pos <= '0' when (inputs = "0000") or --m0
           (inputs = "0001") or --m1
           (inputs = "0101") or --m5
           (inputs = "1000") or --m8
           (inputs = "1001") or --m9
           (inputs = "1101") or --m13
           (inputs = "1111") else '1'; --m15

end architecture;
