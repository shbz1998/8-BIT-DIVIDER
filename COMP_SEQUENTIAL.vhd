----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/23/2021 05:27:50 PM
-- Design Name: 
-- Module Name: COMP_SEQUENTIAL - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity COMP_SEQUENTIAL is
Port ( a : in STD_LOGIC_VECTOR (7 downto 0);
           b : in STD_LOGIC_VECTOR (7 downto 0);
           c : out STD_LOGIC_VECTOR (7 downto 0));
end COMP_SEQUENTIAL;

architecture Behavioral of COMP_SEQUENTIAL is

begin
process (a,b)
begin
if (unsigned(a) < unsigned(b)) then 
c <= std_logic_vector(a);
else
c <= std_logic_vector((unsigned(a) - unsigned(b)));
end if;
end process;
end Behavioral;
