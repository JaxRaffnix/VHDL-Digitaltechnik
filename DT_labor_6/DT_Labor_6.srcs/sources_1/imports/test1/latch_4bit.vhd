LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY latch_4bit IS
    PORT (
        data_in : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        gate : IN STD_LOGIC;
        data_out : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
END latch_4bit;

ARCHITECTURE Behavioral OF latch_4bit IS
    -- empty
BEGIN

    data_out <= data_in WHEN
        gate = '1' 
    ELSE
        data_out;

END Behavioral;