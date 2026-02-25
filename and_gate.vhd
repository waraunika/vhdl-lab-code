entity and_gate is
  port (
  a, b : in bit;
  y    : out bit
       );
end entity;

architecture behavioral of and_gate is
begin
  y <= a and b;
end architecture;

