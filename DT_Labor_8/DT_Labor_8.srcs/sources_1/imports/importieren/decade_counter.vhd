library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD_UNSIGNED.ALL;

entity decade_counter is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           enb : in STD_LOGIC;
           dir : in STD_LOGIC;
           ripple : out STD_LOGIC;
           bcd : out STD_LOGIC_VECTOR (3 downto 0));
end decade_counter;

architecture rtl of decade_counter is
    constant COUNTER_MAX : std_logic_vector(3 downto 0) := X"9";
    signal next_bcd : std_logic_vector(3 downto 0);
begin

    synchronous: process(clk, rst) is begin
        if(rst = '1') then
            bcd <= (others => '0');
        elsif(rising_edge(clk)) then
            if(enb = '1') then
                bcd <= next_bcd;
            end if;
        end if;
    end process;

    combinational: process(all) is
        variable overflow_imminent : boolean;
    begin
        if(dir = '1') then
            overflow_imminent := (bcd = COUNTER_MAX);
            next_bcd <= (others => '0') when overflow_imminent else bcd + 1;
        else
            overflow_imminent := (bcd = 0);
            next_bcd <= COUNTER_MAX when overflow_imminent else bcd - 1;
        end if;
        ripple <= '1' when (overflow_imminent and enb = '1') else '0';
    end process;
end rtl;
