----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/23/2021 05:23:33 PM
-- Design Name: 
-- Module Name: DIVIDER_SEQUENTIAL - Behavioral
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
use IEEE.NUMERIC_STD.ALL; --Need this for calculation 

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DIVIDER_SEQUENTIAL is
 Port ( D : in STD_LOGIC_VECTOR (7 downto 0);
        R : out STD_LOGIC_VECTOR (7 downto 0);
        Q : out STD_LOGIC_VECTOR (2 downto 0) );
end DIVIDER_SEQUENTIAL;

architecture Behavioral of DIVIDER_SEQUENTIAL is

signal VAL: std_logic_vector(7 downto 0);
signal R_a,R_b,R_c,R_d,R_e : std_logic_vector(7 downto 0); 
signal Q_a, Q_b, Q_c, Q_d, Q_e : std_logic_vector(2 downto 0);
signal Q_f : std_logic_vector(2 downto 0);

component COMP_SEQUENTIAL is
    Port ( a : in STD_LOGIC_VECTOR (7 downto 0);
           b : in STD_LOGIC_VECTOR (7 downto 0);
           c : out STD_LOGIC_VECTOR (7 downto 0));          
end component;

begin

--FIND R
VAL <= "00101111"; --constant = 47
 
comp_first: COMP_SEQUENTIAL port map(a=>D, b=>VAL, c=>R_a); 
comp_second: COMP_SEQUENTIAL port map(a=>R_a, b=>VAL, c=>R_b);
comp_third: COMP_SEQUENTIAL port map(a=>R_b, b=>VAL, c=>R_c);
comp_fourth: COMP_SEQUENTIAL port map(a=>R_c, b=>VAL, c=>R_d);
comp_fifth: COMP_SEQUENTIAL port map(a=>R_d, b=>VAL, c=>R);

--FIND Q

process(R_a,R_b,R_c,R_d,D,VAL, Q_e, Q_f, Q_a, Q_b, Q_c, Q_d)

begin

if unsigned(D)>=unsigned(VAl) then --YES WHEN FIRST CONDITION IS TRUE, Q=1
Q_a <= "001";
else 
Q_a <= "000";
end if;

if unsigned(R_a)>=unsigned(VAL) then
Q_b <= "010";
elsif unsigned(D)>=unsigned(VAL) then
Q_b <= "001";
else
Q_b <= "000";
end if;

if unsigned(R_b)>=unsigned(VAL) then 
Q_c <= "011";
elsif unsigned(R_a)>=unsigned(VAL) then
Q_c<="010";
elsif unsigned(D)>=unsigned(VAL) then
Q_c<="001";
else 
Q_c <= "000";
end if;

if unsigned(R_c)>=unsigned(VAL) then
Q_d <= "100";
elsif unsigned(R_b)>=unsigned(VAL) then
Q_d<="011";
elsif unsigned(R_a)>=unsigned(VAL) then
Q_d<="010";
elsif unsigned(D)>=unsigned(VAL) then
Q_d<="001";
else 
Q_d <= "000";
end if;

if unsigned(R_d)>=unsigned(VAL) then 
Q_e <= "101";
elsif unsigned(R_c)>=unsigned(VAL) then
Q_e <= "100";
elsif unsigned(R_b)>=unsigned(VAL) then
Q_e<="011";
elsif unsigned(R_a)>=unsigned(VAL) then
Q_e<="010";
elsif unsigned(D)>=unsigned(VAL) then
Q_e<="001";
else 
Q_e <= "000";
end if;

if (unsigned(Q_e)="101") then 
Q_f <= Q_e;
elsif (unsigned(Q_d)="100") then 
Q_f <= Q_d;
elsif (unsigned(Q_c)="011") then 
Q_f <= Q_c;
elsif (unsigned(Q_b)="010") then
Q_f<=Q_b;
elsif (unsigned(Q_a)="001") then
Q_f<=Q_a;
else
Q_f <= "000";
end if;

Q <= Q_f;

end process;


end Behavioral;
