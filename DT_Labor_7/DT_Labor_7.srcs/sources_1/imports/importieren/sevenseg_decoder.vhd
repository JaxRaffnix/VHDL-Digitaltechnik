-------------------------------------------------
-- Christian Frank
-- Digitaltechnik Labor der Hochschule Karlsruhe
--
-- BCD zu 7 Segment Decoder
-------------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY sevenseg_decoder IS
    PORT (
        bcd : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        seg : OUT STD_LOGIC_VECTOR (6 DOWNTO 0)
    );
END sevenseg_decoder;

ARCHITECTURE behav OF sevenseg_decoder IS
    -- empty
BEGIN
    lut : PROCESS (bcd) BEGIN
        CASE bcd IS
                --                 abcdefg
            WHEN "0000" => seg <= "1111110"; --0
            WHEN "0001" => seg <= "0110000"; --1
            WHEN "0010" => seg <= "1101101"; --2
            WHEN "0011" => seg <= "1111001"; --3
            WHEN "0100" => seg <= "0110011"; --4
            WHEN "0101" => seg <= "1011011"; --5
            WHEN "0110" => seg <= "0011111"; --6
            WHEN "0111" => seg <= "1110000"; --7
            WHEN "1000" => seg <= "1111111"; --8
            WHEN "1001" => seg <= "1110011"; --9
            WHEN OTHERS => seg <= (OTHERS => '0'); --blank display
        END CASE;
    END PROCESS;
END behav;