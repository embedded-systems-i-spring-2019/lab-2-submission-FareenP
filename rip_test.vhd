Library IEEE;
use IEEE.std_logic_1164.all,IEEE.numeric_std.all;

ENTITY rip_t IS
END rip_t;

architecture rip of rip_t is
Component ripple_4
port(A0,A1,A2,A3,B0,B1,B2,B3,C0:in std_logic;
     c4,S0,S1,S2,S3:out std_logic);
end Component;

signal A0_t,A1_t,A2_t,A3_t,B0_t,B1_t,B2_t,B3_t,C0_t : std_logic ;
signal c4_t,S0_t,S1_t,S2_t,S3_t: std_logic;

constant clk_period : time := 10 ns;

begin
uut: ripple_4 PORT MAP (
A0 => A0_t,
b0=>b0_t,
C0=>c0_t,
s0=>s0_t,
A1 => A1_t,
b1=>b1_t,
s1=>s1_t,
b2=>b2_t,
A2 => a2_t,
s2=>s2_t,
a3=>a3_t,
b3=>b3_t,
c4=>C4_t,
s3=>s3_t);

--clk_process :process
--begin
--clk_test <= '0';
--wait for clk_period/2;
--clk_test <= '1';
--wait for clk_period/2;

--end process;


stim_proc: process
begin
    wait for 100ns;
    A0_t<='1';
    B0_t<='1';
    c0_t<='0';
    A1_t<='1';
    B1_t<='1';
    A2_t<='1';
    B2_t<='1';
    A3_t<='1';
    B3_t<='1';
    wait for 10ns;
    wait;
    end process;
    end;
 
