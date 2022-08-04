library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use std.env.finish;

entity statemachine_tb is
end statemachine_tb;

architecture Behavioral of statemachine_tb is
    component statemachine is
       Port (
           s: in std_logic_vector(1 downto 0); --(S2 S1)
           clk: in std_logic;
           rst: in std_logic;
           dir: out std_logic;
           cnt_pulse: out std_logic
       );
    end component;
    
    constant CLK_PERIOD : time := 10 ns;
    type SEQUENCE_TYPE is array(integer range <>) of std_logic_vector(1 downto 0);
    type TEST_PHASE_LABELS is (forward, backward, aborted_forward, aborted_backward);
    signal current_testcase : TEST_PHASE_LABELS;
    signal clk_counter : integer := 0;
    signal s_sim: std_logic_vector(1 downto 0);
    signal clk_sim, rst_sim, dir_sim, cnt_pulse_sim: std_logic;
begin
    
    -- Instanziieren des DUT
    dut: statemachine port map(
        s => s_sim,
        clk => clk_sim,
        rst => rst_sim,
        dir => dir_sim,
        cnt_pulse => cnt_pulse_sim
    );
    
    -- Taktgenerator
    clk_generator: process begin
        clk_sim <= '0';
        wait for CLK_PERIOD/2;
        clk_counter <= clk_counter + 1;
        clk_sim <= '1';
        wait for CLK_PERIOD/2;
    end process;

    -- Abarbeiten der Testcases
    tescases: process is
        /**
        * Prozedur zum Testen des Zustandsautomaten.
        * s_sim wird mit einer Folge von Testvektoren beschalten.
        * Mit dem Eintreffen der nächsten Taktflanke werden die Ausgaenge (dir,cnt_pulse)
        * auf den erwarteten Wert ueberprueft.
        *
        * @param: input_sequence - ein array aus SLVs, Testvektoren Lichtschranken
        * @param: expected_output_sequence -- ein array aus 2-Bit SLVs, Pruefvektoren fuer Ausgaenge
        */
        procedure test_sequence(
            input_sequence: SEQUENCE_TYPE;
            expected_output_sequence: SEQUENCE_TYPE;
            message : string
        ) is 
            variable exp_dir, exp_cnt_pulse : std_logic;
        begin
            rst_sim <= '1', '0' after 1ns;
            for i in input_sequence'range loop
                s_sim <= input_sequence(i);
                wait until rising_edge(clk_sim);
                exp_dir := expected_output_sequence(i)(1);
                exp_cnt_pulse := expected_output_sequence(i)(0);
                assert dir_sim = exp_dir report message & "Taktzyklus " & integer'image(clk_counter-1) & ", erwartet wurde dir=" & std_logic'image(exp_dir) severity warning;
                assert cnt_pulse_sim = exp_cnt_pulse report message & "Taktzyklus " & integer'image(clk_counter-1) & ", erwartet wurde cnt_pulse=" & std_logic'image(exp_cnt_pulse) severity warning;
            end loop;
        end;
    begin
        report "#### BEGINN DES TESTS ####";
        -- Testen der Vorwartsrichtung. Jeder Zustand wird fuer zwei Taktflanken gehalten.
        current_testcase <= forward;
        test_sequence(
            input_sequence =>           ("00", "00", "01", "01", "11", "11", "10", "10", "00", "00"),
            expected_output_sequence => ("00", "00", "10", "10", "10", "10", "10", "10", "11", "00"),
            message => "-----> Fehler bei der Vorwaertsbewegung: "
        );
        
        -- Testen der Rueckwaertsrichtung. Jeder Zustand wird fuer zwei Taktflanken gehalten.
        current_testcase <= backward;
        test_sequence(
            input_sequence =>           ("00", "00", "10", "10", "11", "11", "01", "01", "00", "00"),
            expected_output_sequence => ("00", "00", "00", "00", "00", "00", "00", "00", "01", "00"),
            message => "-----> Fehler bei der Rueckwartsbewegung: "
        );
        
        --Testen eines abgebrochenen Einfahrsvorgangs. Richtzungsaenderung vor dem letzten Schritt.
        current_testcase <= aborted_forward;
        test_sequence(
            input_sequence =>           ("00", "01", "11", "10", "11", "01", "00"),
            expected_output_sequence => ("00", "10", "10", "10", "10", "10", "00"),
            message => "-----> Fehler bei der abgebrochenen Vorwaertsbewegung: "
        );
        
        --Testen eines abgebrochenen Ausfahrsvorgangs. Richtzungsaenderung vor dem letzten Schritt.
        current_testcase <= aborted_backward;
        test_sequence(
            input_sequence =>           ("00", "10", "11", "01", "11", "10", "00"),
            expected_output_sequence => ("00", "00", "00", "00", "00", "00", "00"),
            message => "-----> Fehler bei der abgebrochenen Rueckwartsbewegung: "
        );
        report "#### ENDE DES TESTS ####";
        finish;
    end process;
end Behavioral;
