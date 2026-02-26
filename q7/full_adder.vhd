library ieee;
use ieee.std_logic_1164.all;

entity full_adder is
  port (
    a, b, cin : in std_logic;
    sum, cout : out std_logic
  );
end entity;

architecture behavioral of full_adder is
begin
  process(a, b, cin)
  begin
    sum <= a xor b xor cin;
    cout <= (a and b) or (a and cin) or (b and cin);
  end process;
end architecture;
