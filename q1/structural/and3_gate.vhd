library ieee;
use ieee.std_logic_1164.all;

entity and3_gate is
    port (
        a, b, c : in  std_logic;
        y       : out std_logic
    );
end entity;

architecture behavioral of and3_gate is
begin
    y <= a and b and c;
end architecture;
