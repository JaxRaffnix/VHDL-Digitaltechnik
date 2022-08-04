-- import variable type logic vector from iee library.
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY adder_4bit IS
    PORT (-- take two 4 bit values, calculate their sum and give carry output
        summand_a : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        summand_b : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        sum : OUT STD_LOGIC_VECTOR (3 DOWNTO 0); -- result of the addition
        carry : OUT STD_LOGIC -- high if sum is greater than 4 bit 
    );
END adder_4bit;

ARCHITECTURE Behavioral OF adder_4bit IS

    COMPONENT halfadder IS -- import halfadder
        PORT (-- take two 1 bit values, calculate their sum and give carry output
            halfadder_summand_a : IN STD_LOGIC;
            halfadder_summand_b : IN STD_LOGIC;
            halfadder_sum : OUT STD_LOGIC;
            halfadder_carry : OUT STD_LOGIC --- high if sum is greater than 1 bit
        );
    END COMPONENT;

    COMPONENT fulladder IS -- import fulladder
        PORT (-- take two 1 bit values and a carry_in, calculate their sum and give carry_out output
            fulladder_summand : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
            fulladder_carry_in : IN STD_LOGIC;
            fulladder_sum : OUT STD_LOGIC;
            fulladder_carry_out : OUT STD_LOGIC --- high if sum is greater than 1 bit
        );
    END COMPONENT;

    SIGNAL sum_sub : STD_LOGIC_VECTOR (3 DOWNTO 0); -- store sum result of each fulladder/halfadder for each bit addition
    SIGNAL carry_sub : STD_LOGIC_VECTOR (3 DOWNTO 0); -- store fulladder_carry_out of each fulladder/halfadder for each bit addition

BEGIN

    halfadder_0 : halfadder PORT MAP(-- add first bit of the two input variables
        halfadder_summand_a => summand_a(0),
        halfadder_summand_b => summand_b(0),
        halfadder_sum => sum_sub(0), -- store sum in first bit of sum_sub
        halfadder_carry => carry_sub(0) -- store carry_out in first bit of carry_sub
    );

    fulladder_1_3 : FOR i IN 1 TO 3 GENERATE -- create three fulladders, one for the bits 1 to 3
        fulladder_1 : fulladder PORT MAP(-- add bit of ith place from both input variables and the carry_out from the previous fulladder  
            fulladder_summand(0) => summand_a(i),
            fulladder_summand(1) => summand_b(i),
            fulladder_carry_in => carry_sub(i - 1),
            fulladder_sum => sum_sub(i), -- store sum in ith place of sum_sub
            fulladder_carry_out => carry_sub(i) -- store carry_out in ith place of carry_sub
        );
    END GENERATE;

    sum <= sum_sub; -- save each bit value of sum_sub to sum
    carry <= carry_sub(3); -- save value of carry_sub on 4th place as carry signal for the 4bit adder

END Behavioral;
