library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity majority_2_of_3 is
  port (
    x1, x2, x3 : in std_logic;
    y : out std_logic
  );
end entity;

architecture behavioral of majority_2_of_3 is
begin
   process(x1, x2, x3)
     variable inputs : std_logic_vector(2 downto 0);
     variable count: integer;
  begin
    inputs := x1 & x2 & x3;
    count := 0;

    if x1 = '1' then count := count + 1; end if;
    if x2 = '1' then count := count + 1; end if;
    if x3 = '1' then count := count + 1; end if;

    if count = 2 then
      y <= '1';
    else
      y <= '0';
    end if;
  end process;
end architecture;
