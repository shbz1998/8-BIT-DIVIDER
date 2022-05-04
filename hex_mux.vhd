----------------------------------------------------------------------------------
-- Company: CALIFORNIA STATE UNIVERSITY, NORTHRIDGE
-- Engineer: SHAHBAZ HASSAN KHAN MALIK
-- 
-- Create Date: 09/30/2021 08:07:54 AM
-- Design Name: 2:1 MULTIPLEXER
-- Module Name: MUX, CONQ
-- Project Name: 
-- Target Devices: DIVIDER
-- Tool Versions: 1.0
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity COMP is
    Port ( a : in STD_LOGIC_VECTOR (7 downto 0);
           b : in STD_LOGIC_VECTOR (7 downto 0);
           c : out STD_LOGIC_VECTOR (7 downto 0));
end COMP;

architecture Behavioral of COMP is
    
signal QA: std_logic_vector(2 downto 0);

begin
    
with (unsigned(a) < unsigned(b)) select
c <= std_logic_vector(a) when true,
std_logic_vector((unsigned(a) - unsigned(b))) when false;

end Behavioral;
