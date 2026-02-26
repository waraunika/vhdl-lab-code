library ieee;
use ieee.std_logic_1164.all;

entity majority_2_of_3 is
  port (
    x1, x2, x3 : in std_logic;
    y : out std_logic
  );
end entity;

architecture dataflow of majority_2_of_3 is
begin
  y <= (x1 and (x2 xor x3)) or ((not x1) and x2 and x3);
end architecture;
