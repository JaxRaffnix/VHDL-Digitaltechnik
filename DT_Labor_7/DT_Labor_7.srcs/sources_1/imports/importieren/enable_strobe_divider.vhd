/**********************************************
* DIGITALTECHNIK LABOR DER HOCHSCHULE KARLSRUHE
* Christian Frank, B.Eng.
*
* ENABLE VHDL2008 FOR THIS MODULE!
*
* A module for generating a 2 Hz strobe signal
* from a 12 MHz clock. Each strobe impulse has
* a width of exactly one period of the 12 MHz
* clock. Intended for use in the third FPGA lab
* assignment.
*
* The input enb_btn serves as an enable input,
* which should be driven by a button. The signal
* is synchronized by double flopping it. Once
* the button is pushed, an internal counter
* starts running until it overflows. 
* During this time, which will be appr. 0.5s,
* the enb_strobe output is held high constantly.
* This state is called passthrough-mode, since
* the enb_strobe output represents the enb_btn
* input.
*
* After the counter overflows the first time,
* the module will enter strobe-mode. It then
* uses the counter overflow flag to produce 2Hz
* pulses on the enb_strobe output, allowing to
* operate subsequent modules at a low Frequency
*
* Once enb_btn goes low, the module is reset.
***********************************************/

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std_unsigned.all;
use ieee.math_real.all;

entity enable_strobe_divider is
  port (
    enb_btn : in std_logic; -- enable button input
    clk : in std_logic; -- 12 MHz clock
    enb_strobe: out std_logic -- strobed enable output
  );
end enable_strobe_divider;

architecture rtl of enable_strobe_divider is
    -- CONSTANTS --
    constant INPUT_FREQ : natural := 12000000; -- clk frequency in Hz
    constant OUTPUT_FREQ : natural := 2; -- desired enb strobe frequency in Hz
    constant NBITS : natural := integer(ceil(log2(real(INPUT_FREQ/OUTPUT_FREQ)))) + 1; -- calc division counter width. One extra bit to detect rollover
    constant CNT_RELOAD : std_logic_vector := to_std_logic_vector(integer(ceil(real(INPUT_FREQ/OUTPUT_FREQ))) - 1, NBITS); -- calc division counter reload value
    
    -- REGISTERS AND SIGNALS --
    signal reg_div_cnt : std_logic_vector(NBITS-1 downto 0); -- division counter
    signal next_reg_div_cnt : std_logic_vector(NBITS-1 downto 0); -- next value for division counter
    signal next_enb_strobe : std_logic; -- next value for enb_strobe ff output
    signal ff_divide_mode_flag : std_logic; -- flag ff to distinguish passthrough/strobe modes
    signal next_ff_divide_mode_flag : std_logic; -- next value for strobe mode flag ff
    signal ff_enb_btn_metastable : std_logic; -- first ff in double flopper synchronization chain for enb_btn input, assume metastability
    signal ff_enb_btn_stable : std_logic; -- second ff in double flopper synchronization chain for enb_btn input, can be assumed as stable
begin
    -- double flopper synchronization algorithm for enb_btn input
    synchronize_enb_btn: process (clk) is begin
        if(rising_edge(clk)) then
            ff_enb_btn_metastable <= enb_btn; -- register asynchronous input enb_btn, assume metastability
            ff_enb_btn_stable <= ff_enb_btn_metastable; -- double flop input enb_btn, should now be stable
        end if;
    end process;
        
    sequential: process (clk) is begin
        if(rising_edge(clk)) then
            reg_div_cnt <= next_reg_div_cnt;
            enb_strobe <= next_enb_strobe;
            ff_divide_mode_flag <= next_ff_divide_mode_flag;
        end if;
    end process;
    
    combinational: process (all) is
        variable reg_div_cnt_rollover : std_logic; -- rollover flag for division counter
    begin
        reg_div_cnt_rollover := reg_div_cnt(NBITS-1); -- MSB of counter register is rollover flag
        if(ff_enb_btn_stable = '1') then -- user pushed enb_btn
            next_reg_div_cnt <= CNT_RELOAD when reg_div_cnt_rollover = '1' else reg_div_cnt - 1; --set counter to reload value after rollover, decrement otherwise
            next_ff_divide_mode_flag <= '1' when reg_div_cnt_rollover = '1' else ff_divide_mode_flag; --set divide_flag to 1 after the first rollover, thus enabling strobe mode
            if(ff_divide_mode_flag = '1') then -- if operating in strobe mode...
                next_enb_strobe <= '1' when reg_div_cnt_rollover = '1' else '0'; -- ...generate enable strobe for one clk-cycle every 1/OUTPUT_FREQ seconds.
            else -- if operating in passthrough mode....
                next_enb_strobe <= '1'; -- ...keep enable high
            end if;
        else -- enb_btn is not pushed
            next_enb_strobe <= '0'; -- 
            next_ff_divide_mode_flag <= '0'; 
            next_reg_div_cnt <= CNT_RELOAD; -- reload backwards-counter
        end if;
    end process;
end rtl;
