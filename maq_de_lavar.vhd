library ieee;
use ieee.std_logic_1164.all;

entity maq_de_lavar is
	port(	push_bt1, push_bt2, push_bt3, push_bt4		:	in		std_logic;
			led1, led2, led3, led4, led5, led6 			:	out	std_logic;
			led7, led8, led9, led10, led11, led12 		:	out	std_logic;
			led13, led14, led15, led16, led17, led18 	:	out	std_logic;
			led19, led20, led21, led22, led23, led24 	:	out	std_logic;
			led25, led26, led27, led28, led29, led30 	:	out	std_logic;
			led31													:	out	std_logic);
end maq_de_lavar;

architecture etapas of maq_de_lavar is
	type estado is (enchimento1, enchimento2, enchimento3)