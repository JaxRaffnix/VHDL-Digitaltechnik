library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity input_synchronizer is
    Port ( data_in : in STD_LOGIC_VECTOR (1 downto 0);
           data_out : out STD_LOGIC_VECTOR (1 downto 0);
           clk : in STD_LOGIC);
end input_synchronizer;

architecture rtl of input_synchronizer is
    signal data_metastable : std_logic_vector(1 downto 0);
begin
    process(clk) is begin
        if(rising_edge(clk)) then
            data_metastable <= data_in; -- Daten koennten metastabil sein
            data_out <= data_metastable; -- Daten nach zwei Registerstufen stabil
        end if;
    end process;
end rtl;
