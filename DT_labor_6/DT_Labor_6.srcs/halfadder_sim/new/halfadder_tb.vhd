LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE std.env.finish;

ENTITY halfadder_tb IS
    --  Port ( );
END halfadder_tb;

ARCHITECTURE arch OF halfadder_tb IS

    SIGNAL summand_x_s : STD_LOGIC;
    SIGNAL summand_y_s : STD_LOGIC;
    SIGNAL sum_s : STD_LOGIC;
    SIGNAL carry_s : STD_LOGIC;

    COMPONENT halfadder IS
        PORT (
            halfadder_summand_a : IN STD_LOGIC;
            halfadder_summand_b : IN STD_LOGIC;
            halfadder_sum : OUT STD_LOGIC;
            halfadder_carry : OUT STD_LOGIC
        );
    END COMPONENT;

BEGIN

    dut : halfadder PORT MAP(
        halfadder_summand_a => summand_x_s,
        halfadder_summand_b => summand_y_s,
        halfadder_sum => sum_s,
        halfadder_carry => carry_s
    );

    test_pattern_gen : PROCESS BEGIN

        summand_x_s <= '0';
        summand_y_s <= '0';
        WAIT FOR 10ns;
        ASSERT sum_s = '0' AND carry_s = '0' REPORT "00 failed.";

        summand_x_s <= '0';
        summand_y_s <= '1';
        WAIT FOR 10ns;
        ASSERT sum_s = '1' AND carry_s = '0' REPORT "01 failed.";

        summand_x_s <= '1';
        summand_y_s <= '0';
        WAIT FOR 10ns;
        ASSERT sum_s = '1' AND carry_s = '0' REPORT "10 failed.";

        summand_x_s <= '1';
        summand_y_s <= '1';
        WAIT FOR 10ns;
        ASSERT sum_s = '0' AND carry_s = '1' REPORT "11 failed.";

        REPORT "Simulation beendet";

        finish;

    END PROCESS;

END arch;
