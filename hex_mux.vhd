----------------------------------------------------------------------------------
-- Company: CALIFORNIA STATE UNIVERSITY, NORTHRIDGE
-- Engineer: SHAHBAZ HASSAN KHAN MALIK
-- 
-- Create Date: 09/30/2021 08:07:54 AM
-- Design Name: 2:1 MULTIPLEXER
-- Module Name: hex_mux -Behavioral
-- Project Name: COMPUTER ASSIGNMENT #2
-- Target Devices: BARREL SHIFTER/ROTATOR B
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

entity hex_mux is
    Port ( a : in STD_LOGIC_VECTOR (15 downto 0);
           b : in STD_LOGIC_VECTOR (15 downto 0);
           sel : in STD_LOGIC;
           c : out STD_LOGIC_VECTOR (15 downto 0));
end hex_mux;

architecture Behavioral of hex_mux is

begin
c <= a WHEN sel ='1' ELSE
b;
end Behavioral;
