LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE std.env.finish;

ENTITY fulladder_tb IS
    --  Port ( );
END fulladder_tb;

ARCHITECTURE Behavioral OF fulladder_tb IS

    SIGNAL summand_s : STD_LOGIC_VECTOR (1 DOWNTO 0);
    SIGNAL carry_in_s : STD_LOGIC;
    SIGNAL sum_s : STD_LOGIC;
    SIGNAL carry_out_s : STD_LOGIC;

    COMPONENT fulladder IS
        PORT (
            fulladder_summand : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
            fulladder_carry_in : IN STD_LOGIC;
            fulladder_sum : OUT STD_LOGIC;
            fulladder_carry_out : OUT STD_LOGIC
        );
    END COMPONENT;

BEGIN

    dut : fulladder PORT MAP(
        fulladder_summand => summand_s,
        fulladder_carry_in => carry_in_s,
        fulladder_sum => sum_s,
        fulladder_carry_out => carry_out_s
    );

    test_pattern_gen : PROCESS BEGIN
        summand_s <= "00";
        carry_in_s <= '0';
        WAIT FOR 10 ns;
        ASSERT sum_s = '0' AND carry_out_s = '0' REPORT "000 failed.";

        summand_s <= "00";
        carry_in_s <= '1';
        WAIT FOR 10 ns;
        ASSERT sum_s = '1' AND carry_out_s = '0' REPORT "001 failed.";

        summand_s <= "01";
        carry_in_s <= '0';
        WAIT FOR 10 ns;
        ASSERT sum_s = '1' AND carry_out_s = '0' REPORT "010 failed.";

        summand_s <= "01";
        carry_in_s <= '1';
        WAIT FOR 10 ns;
        ASSERT sum_s = '0' AND carry_out_s = '1' REPORT "011 failed.";

        summand_s <= "10";
        carry_in_s <= '0';
        WAIT FOR 10 ns;
        ASSERT sum_s = '1' AND carry_out_s = '0' REPORT "100 failed.";

        summand_s <= "10";
        carry_in_s <= '1';
        WAIT FOR 10 ns;
        ASSERT sum_s = '0' AND carry_out_s = '1' REPORT "101 failed.";

        summand_s <= "11";
        carry_in_s <= '0';
        WAIT FOR 10 ns;
        ASSERT sum_s = '1' AND carry_out_s = '0' REPORT "110 failed.";

        summand_s <= "11";
        carry_in_s <= '1';
        WAIT FOR 10 ns;
        ASSERT sum_s = '1' AND carry_out_s = '1' REPORT "111 failed.";

        REPORT "Sumulation beendet";

        finish;

    END PROCESS;

END Behavioral;