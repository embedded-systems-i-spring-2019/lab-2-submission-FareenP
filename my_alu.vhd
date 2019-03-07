library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity alu_16 is
port(A,B,opcode :in std_logic_vector(3 downto 0);
     A_out: out std_logic_vector(3 downto 0));
end alu_16;

architecture alu_func of alu_16 is
signal g_t : std_logic_vector(3 downto 0);
begin
 
    process(opcode,A,B)
    begin
       if (A>B) then
            g_t<="0001";
        else
            g_t<="0000";
         end if;
        case(opcode) is
            when "0000" => A_out <=A+B;
            when "0001"=> A_out <= A-B;
            when "0010"=>A_out<=A+1;
            when "0011" => A_out<=A-1;
            when "0100" => A_out<=0-A;
            when "0101"=>  A_out <= g_t;
            when "0110"=>  A_out <= A(2 downto 0)&"0";
            when "0111"=>  A_out <= "0"&A(3 downto 1);
            when "1000"=>  A_out <= "1"&A(3 downto 1);
            when "1001"=> A_out <= Not(A);
            when "1010"=> A_out <= A AND B;
            when "1011"=>A_out <= A OR B;
            when "1100" => A_out <=A XOR B;
            when "1101" => A_out <=A XNOR B;
            when "1110"=> A_out <=A NAND B;
            when "1111" => A_out <=A NOR B;
            when others => A_Out <= "0000";
        end case;
    end process;
end alu_func;
            