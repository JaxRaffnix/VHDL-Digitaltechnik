LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY halfadder IS
    PORT (
        halfadder_summand_a : IN STD_LOGIC;
        halfadder_summand_b : IN STD_LOGIC;
        halfadder_sum : OUT STD_LOGIC;
        halfadder_carry : OUT STD_LOGIC
    );
END halfadder;

ARCHITECTURE Behavioral OF halfadder IS
    -- empty   
BEGIN
    halfadder_sum <= halfadder_summand_a XOR halfadder_summand_b;
    halfadder_carry <= halfadder_summand_a AND halfadder_summand_b;
END Behavioral;
