library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top_level is
    Port ( segments_H : out STD_LOGIC_VECTOR (6 downto 0);
           segments_L : out STD_LOGIC_VECTOR (6 downto 0);
           sysclk : in STD_LOGIC;
           btn0 : in STD_LOGIC;
           opt_switch : in STD_LOGIC_VECTOR (1 downto 0));
end top_level;

architecture structural of top_level is
    component decade_counter is
        Port ( clk : in STD_LOGIC;
               rst : in STD_LOGIC;
               enb : in STD_LOGIC;
               dir : in STD_LOGIC;
               ripple : out STD_LOGIC;
               bcd : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    component input_synchronizer is
        Port ( data_in : in STD_LOGIC_VECTOR (1 downto 0);
               data_out : out STD_LOGIC_VECTOR (1 downto 0);
               clk : in STD_LOGIC);
    end component;
    
    component statemachine is
        Port ( s: in STD_LOGIC_VECTOR(1 downto 0); --(S2 S1)
               clk: in STD_LOGIC;
               rst: in STD_LOGIC;
               dir: out STD_LOGIC;
               cnt_pulse: out STD_LOGIC);
    end component;
    
    component sevenseg_decoder is
        Port ( bcd : in STD_LOGIC_VECTOR (3 downto 0);
               seg : out STD_LOGIC_VECTOR (6 downto 0));
    end component;
    
    signal cnt_pulse_internal : std_logic;
    signal ripple_internal : std_logic;
    signal dir_internal : std_logic;
    signal s_synchronized : std_logic_vector(1 downto 0);
    signal bcd_h_internal, bcd_l_internal : std_logic_vector(3 downto 0);
begin
    FSM_INSTANCE: statemachine port map(
        dir => dir_internal,
        clk => sysclk,
        rst => btn0,
        s => s_synchronized,
        cnt_pulse => cnt_pulse_internal
    );
    
    S_SYNCHRONIZER: input_synchronizer port map(
        data_in => opt_switch,
        data_out => s_synchronized,
        clk => sysclk
    );
    
    COUNTER_HIGH: decade_counter port map(
        rst => btn0,
        clk => sysclk,
        enb => ripple_internal,
        dir => dir_internal,
        bcd => bcd_h_internal
    );
    
    COUNTER_LOW: decade_counter port map(
        rst => btn0,
        clk => sysclk,
        enb => cnt_pulse_internal,
        dir => dir_internal,
        bcd => bcd_l_internal,
        ripple => ripple_internal
    );
    
    BCD_DECODER_HIGH : sevenseg_decoder port map(
        bcd => bcd_h_internal,
        seg => segments_H
    );
    
    BCD_DECODER_LOW : sevenseg_decoder port map(
        bcd => bcd_l_internal,
        seg => segments_L
    );
end structural;
