library IEEE;
use ieee.std_logic_1164.all, ieee.numeric_std.all;

entity adder_bit is
port(A,B,Cin :in std_logic;
     S,Cout :out std_logic);
end adder_bit;

architecture Adder of adder_bit is
signal F_x, top_an,bot_an :std_logic;

begin

F_x<= A XOR B;
bot_an <= A AND B;
S<=Cin XOR F_x;
COUT<= bot_an OR (Cin and F_x);

end adder;

library IEEE;
use ieee.std_logic_1164.all, ieee.numeric_std.all;

Entity ripple_4 is
port(A0,A1,A2,A3,B0,B1,B2,B3,C0:in std_logic;
     c4,S0,S1,S2,S3:out std_logic);
end ripple_4;

architecture crt4 of ripple_4 is
component adder_bit
port(A,B,Cin :in std_logic;
     S,Cout :out std_logic);
end component;

signal C1,C2,C3: std_logic;
begin 
rip1 : adder_bit
port map(A=>A0,
         B=>B0,
         Cin=>c0,
         S=>S0,
         Cout=>C1);
rip2 : adder_bit
port map(A=>A1,
         B=>B1,
         Cin=>c1,
         S=>S1,
         Cout=>C2);
rip3 : adder_bit
port map(A=>A2,
         B=>B2,
         Cin=>c2,
         S=>S2,
         Cout=>C3);
         
rip4 : adder_bit
port map(A=>A3,
         B=>B3,
         Cin=>c3,
         S=>S3,
         Cout=>C4);

end crt4;

 


