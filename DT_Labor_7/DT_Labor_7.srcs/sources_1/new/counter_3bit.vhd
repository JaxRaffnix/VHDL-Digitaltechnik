LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD_UNSIGNED.ALL;

ENTITY counter_3bit IS
    PORT (
        clk : IN STD_LOGIC; -- clock cycle as square-wave voltage
        rst : IN STD_LOGIC; -- asynchronous reset to 0
        enb : IN STD_LOGIC; -- 1: calculate next counter. 0: stop counting
        dir : IN STD_LOGIC; -- 1: increment upwards from 0 to ceiling. 0: decrement from ceiling down to 0
        ceil : IN STD_LOGIC_VECTOR (2 DOWNTO 0); -- max value for counter
        count : OUT STD_LOGIC_VECTOR (2 DOWNTO 0) -- current value of counter. 3 bit => 0 ... 7
    );
END counter_3bit;

ARCHITECTURE Behavioral OF counter_3bit IS

    SIGNAL next_count : STD_LOGIC_VECTOR (2 DOWNTO 0); -- calculated value of counter in next clock cycle

BEGIN

    -- synchronous part
    -- set counter to next value
    synch_process : PROCESS (clk, rst, enb) IS BEGIN

        IF rst = '0' THEN
            IF enb = '1' THEN
                IF rising_edge(clk) THEN
                    count <= next_count; -- set count to calculated value of next_counter
                ELSE -- no rising edge
                    count <= count;
                END IF;
            ELSE -- enb = 0
                count <= count;
            END IF;
        ELSE -- rst = 1
            count <= "000";
        END IF;

    END PROCESS;

    -- combinatorial part / ÜSN
    -- calculate next_counter
    comb_process : PROCESS (ALL) IS BEGIN

        IF dir = '1' THEN -- move counter forward       
            IF count >= ceil THEN -- when counter has reached ceiling value
                next_count <= "001"; -- set counter to 1
            ELSE
                next_count <= count + 1; -- until then increment counter.
            END IF;
        ELSE -- dir = 0. decrement counter
            IF count <= "001" THEN -- if counter has reached minumum
                next_count <= ceil; -- set to ceiling value
            ELSE
                next_count <= count - 1; -- until then, decrement counter.
            END IF;
        END IF;

    END PROCESS;

END Behavioral;