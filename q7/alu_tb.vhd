library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu_tb is
end entity alu_tb;

architecture behavioral of alu_tb is
    component alu is
        port (
            a     : in  std_logic_vector(3 downto 0);
            b     : in  std_logic_vector(3 downto 0);
            mode  : in  std_logic;
            sum   : out std_logic_vector(3 downto 0);
            carry : out std_logic
        );
    end component;

    -- Test signals
    signal a_tb     : std_logic_vector(3 downto 0) := (others => '0');
    signal b_tb     : std_logic_vector(3 downto 0) := (others => '0');
    signal mode_tb  : std_logic := '0';
    signal sum_tb   : std_logic_vector(3 downto 0);
    signal carry_tb : std_logic;

begin
    uut: alu port map (
        a     => a_tb,
        b     => b_tb,
        mode  => mode_tb,
        sum   => sum_tb,
        carry => carry_tb
    );

    -- test process
    process
    begin
        -- test Addition (mode = '0')
        report "Testing Addition Mode (mode = '0'):";
        mode_tb <= '0';
        
        -- test case 1: 5 + 3 = 8 (with carry 0)
        a_tb <= "0101";  -- 5
        b_tb <= "0011";  -- 3
        wait for 10 ns;
        
        -- test case 2: 9 + 6 = 15 (with carry 0)
        a_tb <= "1001";  -- 9
        b_tb <= "0110";  -- 6
        wait for 10 ns;
        
        -- test case 3: 12 + 5 = 17 (with carry 1)
        a_tb <= "1100";  -- 12
        b_tb <= "0101";  -- 5
        wait for 10 ns;
        
        -- test case 4: 15 + 1 = 16 (with carry 1)
        a_tb <= "1111";  -- 15
        b_tb <= "0001";  -- 1
        wait for 10 ns;
        
        -- test Subtraction (mode = '1')
        report "Testing Subtraction Mode (mode = '1'):";
        mode_tb <= '1';
        
        -- test case 5: 8 - 3 = 5 (with borrow 0)
        a_tb <= "1000";  -- 8
        b_tb <= "0011";  -- 3
        wait for 10 ns;
        
        -- test case 6: 15 - 7 = 8 (with borrow 0)
        a_tb <= "1111";  -- 15
        b_tb <= "0111";  -- 7
        wait for 10 ns;
        
        -- test case 7: 5 - 8 = -3 (2's complement: 13 with borrow 1)
        a_tb <= "0101";  -- 5
        b_tb <= "1000";  -- 8
        wait for 10 ns;
        
        -- test case 8: 12 - 15 = -3 (2's complement: 13 with borrow 1)
        a_tb <= "1100";  -- 12
        b_tb <= "1111";  -- 15
        wait for 10 ns;
        
        -- test boundary conditions
        report "Testing Boundary Conditions:";
        
        -- tst case 9: 0 + 0 = 0
        mode_tb <= '0';
        a_tb <= "0000";
        b_tb <= "0000";
        wait for 10 ns;
        
        -- test case 10: 15 - 15 = 0
        mode_tb <= '1';
        a_tb <= "1111";
        b_tb <= "1111";
        wait for 10 ns;
        
        -- test case 11: 15 - 0 = 15
        mode_tb <= '1';
        a_tb <= "1111";
        b_tb <= "0000";
        wait for 10 ns;
        
        -- test case 12: 0 - 1 = -1 (15 with borrow 1)
        mode_tb <= '1';
        a_tb <= "0000";
        b_tb <= "0001";
        wait for 10 ns;
        
        report "Simulation completed successfully!";
        wait;
    end process;

end architecture behavioral;
