-- import variable type logic vector from iee library.
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY top_level IS -- get input value from switch if button is pressed, add two 4 bit integers, give output to led. 
    PORT (
        btn0 : IN STD_LOGIC; -- sets summand b from switch
        btn1 : IN STD_LOGIC; -- sets summand a from switch
        switch : IN STD_LOGIC_VECTOR (3 DOWNTO 0); -- input value from switch
        led : OUT STD_LOGIC_VECTOR (4 DOWNTO 0) -- 4 output leds for sum and one led for carry.
    );
END top_level;

ARCHITECTURE Behavioral OF top_level IS

    COMPONENT latch_4bit IS -- import latch 4bit
        PORT (-- set switch input to summand a or b, when gate is high
            data_in : IN STD_LOGIC_VECTOR (3 DOWNTO 0); -- input value for summand a or b
            gate : IN STD_LOGIC; -- deactivate to store last data_in value
            data_out : OUT STD_LOGIC_VECTOR (3 DOWNTO 0) -- output value for summand a or b
        );
    END COMPONENT;

    COMPONENT adder_4bit IS -- import adder 4bit
        PORT (-- add two 4 bit integers, ouput includes carry variable 
            summand_a : IN STD_LOGIC_VECTOR (3 DOWNTO 0); -- input value for summand a
            summand_b : IN STD_LOGIC_VECTOR (3 DOWNTO 0); -- input value for summand b
            sum : OUT STD_LOGIC_VECTOR (3 DOWNTO 0); -- output value for sum of a and b
            carry : OUT STD_LOGIC -- output value for carry of sum of a and b
        );
    END COMPONENT;

    SIGNAL summand_a_latched : STD_LOGIC_VECTOR (3 DOWNTO 0); -- store output value of first latch to summand a
    SIGNAL summand_b_latched : STD_LOGIC_VECTOR (3 DOWNTO 0); -- store output value of second latch to summand b

BEGIN

    SUMMAND_A_LATCH_INSTANCE : latch_4bit PORT MAP(-- store switch value when btn1 is pressed as summand a
        data_in => switch,
        gate => btn1,
        data_out => summand_a_latched
    );

    SUMMAND_B_LATCH_INSTANCE : latch_4bit PORT MAP(-- store switch value when btn0 is pressed as summand b
        data_in => switch,
        gate => btn0,
        data_out => summand_b_latched
    );

    ADDER_INSTANCE : adder_4bit PORT MAP(-- add two 4 bit integers, ouput includes carry variable 
        summand_a => summand_a_latched,
        summand_b => summand_b_latched,
        sum => led(3 DOWNTO 0), -- send output value of sum to led 0 to 3
        carry => led(4) -- send output value of carry to led 4
    );

END Behavioral;