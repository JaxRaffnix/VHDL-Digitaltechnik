----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.05.2022 10:39:20
-- Design Name: 
-- Module Name: adder_4bit_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use std.env.finish ;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity adder_4bit_tb is
--  Port ( );
end adder_4bit_tb;

architecture Behavioral of adder_4bit_tb is
    
    signal summand_a_s : std_logic_vector (3 downto 0) ;
    signal summand_b_s : std_logic_vector (3 downto 0) ;
    signal sum_s : std_logic_vector (3 downto 0) ;
    signal carry_s : std_logic ;
    component adder_4bit is
        Port (
            summand_a : in std_logic_vector (3 downto 0) ;
            summand_b : in std_logic_vector (3 downto 0) ;
            sum : out std_logic_vector (3 downto 0) ;
            carry : out std_logic 
        );
    end component ;
begin
    dut : adder_4bit port map(
        summand_a => summand_a_s ,
        summand_b => summand_b_s ,
        sum => sum_s ,
        carry => carry_s 
    );
    
    test_pattern_gen : process begin
    
        summand_a_s <= "0000" ;
        summand_b_s <= "0000" ;
        wait for 10 ns ;
        assert sum_s = "0000" and carry_s = '0' report "0000 0000 failed." ;
        
        summand_a_s <= "0101" ;
        summand_b_s <= "1010" ;
        wait for 10 ns ;
        assert sum_s = "1111" report "0101 1010 failed." ;
        
        summand_a_s <= "0111" ;
        summand_b_s <= "1111" ;
        wait for 10 ns ;
        assert sum_s = "0110" report "0111 1111 failed." ;
        
        summand_a_s <= "1111" ;
        summand_b_s <= "1111" ;
        wait for 10 ns ;
        assert sum_s = "1110" report "1111 1111 failed." ;
        
        report "Simulation beendet." ;
        finish;
    
    end process;
end Behavioral;
