library ieee;
use ieee.std_logic_1164.all, ieee.numeric_std.all, ieee.std_logic_unsigned.all;

entity alu_top is
port(clk : in std_logic;
     btn,sw : in std_logic_vector(3 downto 0);
     led : out std_logic_vector(3  downto 0));
end alu_top;

architecture alu_tester of alu_top is
component alu_16
port(A,B,opcode :in std_logic_vector(3 downto 0);
     A_out: out std_logic_vector(3 downto 0));
end component;
component debounce
port (clk : in std_logic;
      btn : in std_logic;
      dbnc : out std_logic);
end component;

signal db3_rt,db2_op, db1_A, db0_b :std_logic;
signal d3,d2,d1,d0 : std_logic_vector(3 downto 0);
begin

process(clk)
begin
    if(rising_edge(clk)) then
        if(db2_op='1') then
            d2<=sw;
        elsif(db1_A='1') then
            d1<=sw;
        elsif(db0_B='1') then
            d0<=sw;
        elsif(db3_rt='1') then
            d3<="0000";
            d2<="0000";
            d1<="0000";
            d0<="0000";
        end if;
    end if;
 end process;
        
            


alu: alu_16
port map(A=>d1,
         B=>d0,
         Opcode=>d2,
         A_out=>led);


db2 : debounce
port map(clk=>clk,
         btn=>btn(2),
         dbnc=>db2_op);

db1 : debounce
port map(clk=>clk,
         btn=>btn(1),
         dbnc=>db1_A);
         
db0 : debounce
port map(clk=>clk,
         btn=>btn(0),
         dbnc=>db0_B);
         
db3 : debounce
port map(clk=>clk,
         btn=>btn(3),
         dbnc=>db3_rt);


end alu_tester;