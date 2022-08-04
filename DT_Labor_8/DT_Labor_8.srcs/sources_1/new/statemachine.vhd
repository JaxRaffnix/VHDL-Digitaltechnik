LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY statemachine IS
    PORT (
        clk : IN STD_LOGIC;     -- clock innput
        rst : IN STD_LOGIC;     -- asynchronous reset button
        s : IN STD_LOGIC_VECTOR;    -- light sensors input
        dir : OUT STD_LOGIC;    -- direction of counter. 1: forward, 0: backward
        cnt_pulse : OUT STD_LOGIC   -- impulse to counter direction: up/down 
    );
END statemachine;

ARCHITECTURE Behavioral OF statemachine IS

    TYPE STATETYPE IS (IDLE, FORW1, FORW2, BACK1, BACK2);       -- possible states of statemachine

    SIGNAL state : STATETYPE;       -- current state of statemachine
    SIGNAL next_state : STATETYPE;  -- state in next clock period 

BEGIN

    sequential : PROCESS (rst, clk) IS BEGIN    -- control when state takes it's next state. rest works independent of clock frequency
        
        IF rst = '1' THEN
            state <= IDLE;  -- reset to idle when rest button is pressed, regardless of clock frequency
        ELSIF rising_edge(clk) THEN -- when clock input is rising
            state <= next_state; -- take over next_state as new state
        END IF;

    END PROCESS;

    combinatorial : PROCESS (ALL) IS BEGIN  -- determine next_state, set dir and cnt_pulse

        next_state <= state;    -- default mode: keep current state as new state

        CASE(state) IS -- evaluate current state and set next_state depending on light sensors

            WHEN IDLE =>    -- wait for new maneuver

                dir <= '0'; --  0:  count down, 1: count up
                cnt_pulse <= '0';

                IF s = "01" THEN    -- detected entry move
                    dir <= '1'; -- counter direction: up
                    cnt_pulse <= '0';
                    next_state <= FORW1;
                ELSIF s = "10" THEN     -- detected exit move
                    dir <= '0'; -- count down
                    cnt_pulse <= '0';
                    next_state <= BACK1;
                END IF;
            
            WHEN FORW1 =>   -- wait until entry move has progressed

                dir <= '1'; -- counter direction: up
                cnt_pulse <= '0';

                IF s = "00" THEN    -- entry move aborted 
                    dir <= '0'; --  0:  count down, 1: count up
                    cnt_pulse <= '0'; -- no impuls to counter
                    next_state <= IDLE;
                ELSIF s = "10" THEN     -- entry has progressed to second sensor
                    dir <= '1'; -- counter direction: up
                    cnt_pulse <= '0';
                    next_state <= FORW2;
                END IF;

            WHEN FORW2 =>   -- wait until entry move is completed

                dir <= '1'; -- counter direction: up
                cnt_pulse <= '0';

                if s = "01" then -- detected aborted entry move, fall back to first position
                    dir <= '1'; -- counter direction: up
                    cnt_pulse <= '0';
                    next_state <= FORW1;
                elsif s = "00" then -- completed entry move
                    dir <= '1'; -- counter direction: up
                    cnt_pulse <= '1';   -- SEND IMPULSE TO COUNTER
                    next_state <= IDLE;
                end if ;

            WHEN BACK1 =>   -- wait until exit move has progressed

                dir <= '0'; -- count down
                cnt_pulse <= '0';

                if s = "00" then    -- exit move aborted
                    dir <= '0'; -- count down
                    cnt_pulse <= '0';
                    next_state <= IDLE;
                elsif s = "01" then -- exit has moved further to second sensor
                    dir <= '0'; -- count down
                    cnt_pulse <= '0';
                    next_state <= BACK2;
                end if;

            WHEN BACK2 =>   -- wait until exit move is completed
                dir <= '0'; -- count down
                cnt_pulse <= '0';

                if s = "10" then    -- exit move aborted, fal back to first position
                    dir <= '0'; -- count down
                    cnt_pulse <= '0';
                    next_state <= BACK1;
                elsif s = "00" then -- exit move completed
                    dir <= '0'; -- count down
                    cnt_pulse <= '1';
                    next_state <= IDLE;
                end if ;

        END CASE;

    END PROCESS;

END Behavioral;