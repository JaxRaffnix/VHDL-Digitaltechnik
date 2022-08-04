LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD_UNSIGNED.ALL;

ENTITY top_level IS
    PORT (
        btn0 : IN STD_LOGIC;
        btn1 : IN STD_LOGIC;
        sysclk : IN STD_LOGIC;
        switch : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        segments : OUT STD_LOGIC_VECTOR (6 DOWNTO 0)
    );
END top_level;

ARCHITECTURE Behavioral OF top_level IS

    SIGNAL count_bcd : STD_LOGIC_VECTOR (3 DOWNTO 0); -- counter value output
    SIGNAL enable_from_divider : STD_LOGIC; -- enable output from divider

    COMPONENT counter_3bit IS
        PORT (
            clk : IN STD_LOGIC; -- clock cycle as square-wave voltage
            rst : IN STD_LOGIC; -- asynchronous reset to 0
            enb : IN STD_LOGIC; -- 1: calculate next counter. 0: stop counting
            dir : IN STD_LOGIC; -- 1: increment upwards from 0 to ceiling. 0: decrement from ceiling down to 0
            ceil : IN STD_LOGIC_VECTOR (2 DOWNTO 0); -- max value for counter
            count : OUT STD_LOGIC_VECTOR (2 DOWNTO 0) -- current value of counter 
        );
    END COMPONENT;

    COMPONENT enable_strobe_divider IS
        PORT (
            enb_btn : IN STD_LOGIC; -- enable button input
            clk : IN STD_LOGIC; -- 12 MHz clock
            enb_strobe : OUT STD_LOGIC -- strobed enable output
        );
    END COMPONENT;

    COMPONENT sevenseg_decoder IS
        PORT (
            bcd : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
            seg : OUT STD_LOGIC_VECTOR (6 DOWNTO 0)
        );
    END COMPONENT;

BEGIN

    count_bcd(3) <= '0'; -- counter_3bit gives 3 bit signal, sevenseg_decoder expects 4 bit.

    counter_instance : counter_3bit PORT MAP(
        clk => sysclk, -- 12 MHz
        rst => btn0,
        enb => enable_from_divider,
        dir => switch (3), -- switch 4 sets direction
        ceil => switch (2 DOWNTO 0),
        count => count_bcd (2 DOWNTO 0) -- output
    );

    strobe_divider_instance : enable_strobe_divider PORT MAP(
        enb_btn => btn1,
        clk => sysclk, -- 12 MHz
        enb_strobe => enable_from_divider --output
    );

    sevenseg_instance : sevenseg_decoder PORT MAP(
        bcd => count_bcd,
        seg => segments -- output
    );

END Behavioral;