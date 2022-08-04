LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY fulladder IS
    PORT (
        fulladder_summand : IN STD_LOGIC_VECTOR (1 DOWNTO 0); -- two bit length, each bit represents one fulladder_summand.
        fulladder_carry_in : IN STD_LOGIC;
        fulladder_sum : OUT STD_LOGIC;
        fulladder_carry_out : OUT STD_LOGIC
    );
END fulladder;

ARCHITECTURE Behavioral OF fulladder IS

    SIGNAL p : STD_LOGIC;
    SIGNAL g : STD_LOGIC;

BEGIN

    p <= fulladder_summand(0) XOR fulladder_summand(1);
    g <= fulladder_summand(0) AND fulladder_summand(1);

    fulladder_sum <= p XOR fulladder_carry_in;
    fulladder_carry_out <= g OR (p AND fulladder_carry_in);

END Behavioral;
