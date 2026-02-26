library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sop_pos_function is
  port (
    x1, x2, x3, x4 : in std_logic;
    y_sop, y_pos : out std_logic
  );
end entity;

architecture behavioral of sop_pos_function is
begin
  process(x1, x2, x3, x4)
    variable inputs : std_logic_vector(3 downto 0);
    variable input_int : integer;
  begin
    inputs := x1 & x2 & x3 & x4;
    input_int := to_integer(unsigned(inputs));

    case input_int is
      when 0 | 1 | 4 | 8 | 9 | 14 | 15 =>
        y_sop <= '1';
      when others =>
        y_sop <= '0';
    end case;


    case input_int is
      when 0 | 1 | 5 | 8 | 9 | 13 | 15 =>
        y_pos <= '0';
      when others =>
        y_pos <= '1';
    end case;
  end process;
end architecture;
