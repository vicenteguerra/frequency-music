
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity frecdiv is
    Port ( c50 : in  STD_LOGIC;
           clk : out  STD_LOGIC);
end frecdiv;

architecture Behavioral of frecdiv is

CONSTANT max: INTEGER := 50000000; 
CONSTANT half: INTEGER := max/2;

SIGNAL count: INTEGER RANGE 0 TO max; 
signal dclk: std_logic;

BEGIN 



uno: PROCESS --El proceso es un divisor de frecuencia
	BEGIN 
		WAIT UNTIL c50'EVENT and c50 = '1'; 
		IF count < max THEN count <= count + 1; 
		ELSE count <= 0; 
		END IF;
		
		IF count < half THEN 
			dclk <= '0'; 
		ELSE 
			dclk <= '1'; 
		END IF;	
	END PROCESS;
	

PROCESS 
BEGIN 
	if dclk'event and dclk='1' then
		clk <= '1';
	else
		clk <= '0';
	end if;
	
END PROCESS;

end Behavioral;