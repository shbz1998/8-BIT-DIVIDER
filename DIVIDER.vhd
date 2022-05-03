----------------------------------------------------------------------------------
-- Company: CALIFORNIA STATE UNIVERSITY NORTHRIDGE
-- Engineer: SHAHBAZ HASSAN KHAN MALIK
-- 
-- Create Date: 10/13/2021 12:48:22 PM
-- Design Name: DIVIDER
-- Module Name: DIVIDER - Behavioral
-- Project Name: COMP ASSIGNMENT #3
-- Target Devices: FPGA
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DIVIDER is
 Port ( D : in STD_LOGIC_VECTOR (7 downto 0);
        R : out STD_LOGIC_VECTOR (7 downto 0);
        Q : out STD_LOGIC_VECTOR (2 downto 0) );
end DIVIDER;


architecture Behavioral of DIVIDER is

component COMP is
    Port ( a : in STD_LOGIC_VECTOR (7 downto 0);
           b : in STD_LOGIC_VECTOR (7 downto 0);
           c : out STD_LOGIC_VECTOR (7 downto 0));          
end component;

signal VAL: std_logic_vector(7 downto 0);
signal R_a,R_b,R_c,R_d,R_e : std_logic_vector(7 downto 0); 
signal Q_a, Q_b, Q_c, Q_d, Q_e : std_logic_vector(2 downto 0);
signal Q_f : std_logic_vector(2 downto 0);

begin

--FIND R
VAL <= "00101111"; --constant = 47
 
comp_first: COMP port map(a=>D, b=>VAL, c=>R_a); 
comp_second: COMP port map(a=>R_a, b=>VAL, c=>R_b);
comp_third: COMP port map(a=>R_b, b=>VAL, c=>R_c);
comp_fourth: COMP port map(a=>R_c, b=>VAL, c=>R_d);
comp_fifth: COMP port map(a=>R_d, b=>VAL, c=>R);

--FINDING QUOTIENT--
Q_a <= "001" when unsigned(D)>=unsigned(VAl) else --YES WHEN FIRST CONDITION IS TRUE, Q=1
"000";

Q_b <= "010" when unsigned(R_a)>=unsigned(VAl) else --YES WHEN SECOND CONDITOIN IS TRUE, Q=2. ELSE, CHECK IF FIRST CONDITION IS TRUE. ELSE 0
"001" when unsigned(D)>=unsigned(VAL) else
"000";

Q_c <= "011" when unsigned(R_b)>=unsigned(VAl) else 
"010" when unsigned(R_a)>=unsigned(VAL) else
"001" when unsigned(D)>=unsigned(VAL) else
"000";

Q_d <= "100" when unsigned(R_c)>=unsigned(VAl) else
"011" when unsigned(R_b)>=unsigned(VAL) else
"010" when unsigned(R_a)>=unsigned(VAL) else
"001" when unsigned(D)>=unsigned(VAL) else
"000";

Q_e <= "101" when unsigned(R_d)>=unsigned(VAl) else
"100" when unsigned(R_c)>=unsigned(VAL) else
"011" when unsigned(R_b)>=unsigned(VAL) else
"001" when unsigned(D)>=unsigned(VAL) else
"000";

Q_f <= Q_e when unsigned(Q_e) = "101" else
Q_d when unsigned(Q_d) = "100" else
Q_c when unsigned (Q_c) = "011" else
Q_b when unsigned (Q_b) = "010" else
Q_a when unsigned (Q_a) = "001"else
"000";

Q <= Q_f;

end Behavioral;
