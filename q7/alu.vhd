library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu is
    port (
        a     : in  std_logic_vector(3 downto 0);
        b     : in  std_logic_vector(3 downto 0);
        mode  : in  std_logic;
        sum   : out std_logic_vector(3 downto 0);
        carry : out std_logic
    );
end entity alu;

architecture structural of alu is
    component full_adder is
        port (
            a    : in  std_logic;
            b    : in  std_logic;
            cin  : in  std_logic;
            sum  : out std_logic;
            cout : out std_logic
        );
    end component;

    -- Internal signals
    signal b_xor     : std_logic_vector(3 downto 0);
    signal carry_int : std_logic_vector(3 downto 0);

begin
    b_xor <= b xor (mode & mode & mode & mode);

    fa0: full_adder port map (
        a    => a(0),
        b    => b_xor(0),
        cin  => mode,
        sum  => sum(0),
        cout => carry_int(0)
    );

    fa1: full_adder port map (
        a    => a(1),
        b    => b_xor(1),
        cin  => carry_int(0),
        sum  => sum(1),
        cout => carry_int(1)
    );

    fa2: full_adder port map (
        a    => a(2),
        b    => b_xor(2),
        cin  => carry_int(1),
        sum  => sum(2),
        cout => carry_int(2)
    );

    fa3: full_adder port map (
        a    => a(3),
        b    => b_xor(3),
        cin  => carry_int(2),
        sum  => sum(3),
        cout => carry_int(3)
    );

    carry <= carry_int(3);

end architecture structural;
