library ieee;
use ieee.std_logic_1164.ALL;

entity mux2to1 is
    port (
        a   : in  std_logic;  -- input 0
        b   : in  std_logic;  -- input 1
        sel : in  std_logic;  -- select line
        y   : out std_logic   -- output
    );
end entity mux2to1;

architecture Behavioral of mux2to1 is
begin
    process(a, b, sel)
    begin
        if sel = '0' then
            y <= a;
        else
            y <= b;
        end if;
    end process;
end architecture Behavioral;
