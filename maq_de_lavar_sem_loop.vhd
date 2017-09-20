library ieee;
use ieee.std_logic_1164.all;

entity maq_de_lavar is
	port(	push_bt1, push_bt2, push_bt3, push_bt4		:	in		std_logic;
			clock,reset											:	in		std_logic;
			led1, led2, led3, led4, led5, led6 			:	out	std_logic;
			led7, led8, led9, led10, led11, led12 		:	out	std_logic;
			led13, led14, led15, led16, led17, led18 	:	out	std_logic;
			led19, led20, led21, led22, led23, led24 	:	out	std_logic;
			led25, led26, led27							 	:	out	std_logic);
end maq_de_lavar;

architecture etapas of maq_de_lavar is
	type estado is (ligado,
						 enchimento1, enchimento2, enchimento3, enchimento4, enchimento5, enchimento6, enchimento7, enchimento8,
						 agitacao1, agitacao2, agitacao3, agitacao4, agitacao5, agitacao6, agitacao7
						 pausa, 
						 lavagem1, lavagem2, lavagem3, lavagem4, lavagem5, lavagem6, lavagem7,lavagem8,
						 lavagem9, lavagem10, lavagem11, lavagem12, lavagem13, lavagem14, 
						 centrifugacao1, centrifugacao2, centrifugacao3, centrifugacao4, centrifugacao5,
						 centrifugacao6, centrifugacao7, centrifugacao8);
	signal atual, futuro : estado;
begin
	process(clock,reset)
	
	variable gerador_tempo :	integer	range 0 to 4999999; -- ([20MHZ ^ -1] *5.000.000 = 0,25s). Como eh vereficado a cada borda de subida(2 ciclos de onda), 0,25 * 2 = 0,5s
				t_pausa	: integer range 0 to 19;
				n_centrifugacao : integer range 0 to 3;

	begin
		if(reset = '1')	then
			atual <= ligado;
		elsif(clock'event and clock = '1')	then
			gerador_tempo := gerador_tempo + 1;
			if(gerador_tempo = 4999999)	then
				atual <= futuro;
			end if;
		end if;
	end process;
	
	process(atual)
	begin
		case atual is
			when ligado =>
					led10 <= '1';
					if(push_bt1 = 1)
					{
						futuro <= enchimento1;
					}

			when enchimento1 =>
					led21	<= '1';
					led11 <= '1';
					led10 <= '0';
					led8	<= '1';
					if(push_bt1 = 1)	then
					{
						futuro <= ligado;
					}
					elsif(push_bt4)	then
					{
						futuro <= enchimento3;
					}
					else
					{
						futuro <= enchimento2;
					}
					
			when enchimento2 =>
					led7 	<= '1';
					if(push_bt1 = 1)	then
					{
						futuro <= ligado;
					}
					elsif(push_bt4)	then
					{
						futuro <= enchimento4;
					}
					else
					{
						futuro <= enchimento3;
					}
					
			when enchimento3 =>
					led6 	<= '1';
					if(push_bt1 = 1)	then
					{
						futuro <= ligado;
					}
					elsif(push_bt4)	then
					{
						futuro <= enchimento5;
					}
					else
					{
						futuro <= enchimento4;
					}
				
			when enchimento4 =>
					led5 	<= '1';
					if(push_bt1 = 1)	then
					{
						futuro <= ligado;
					}
					elsif(push_bt4)	then
					{
						futuro <= enchimento6;
					}
					else
					{
						futuro <= enchimento5;
					}
				
			when enchimento5 =>
					led4 	<= '1';
					if(push_bt1 = 1)	then
					{
						futuro <= ligado;
					}
					elsif(push_bt4)	then
					{
						futuro <= enchimento7;
					}
					else
					{
						futuro <= enchimento6;
					}
				
			when enchimento6 =>
					led3 	<= '1';
					if(push_bt1 = 1)	then
					{
						futuro <= ligado;
					}
					elsif(push_bt4)	then
					{
						futuro <= enchimento8;
					}
					else
					{
						futuro <= enchimento7;
					}
			
			when enchimento7 =>
					led2 	<= '1';
					if(push_bt1 = 1)	then
					{
						futuro <= ligado;
					}
					elsif(push_bt4)	then
					{
						futuro <= agitacao1;
					}
					else
					{
						futuro <= enchimento8;
					}
			
			when enchimento8 =>
					led1 	<= '1';
					led9  <= '1';
					led11 <= '0';
					futuro <= agitacao1;
			
			when agitacao1 =>
					led21 <= '0';
					led22	<= '1';
					led23	<= '1';
					led14 <= '1';
					futuro <= agitacao2;
			
			when agitacao2 =>
					led14 <= '0';
					led15 <= '1';
					futuro <= agitacao3;
					
			when agitacao3 =>
					led15 <= '0';
					led16 <= '1';
					futuro <= agitacao4;
			
			when agitacao4 =>
					led16 <= '0';
					led17 <= '1';
					futuro <= agitacao5;
			
			when agitacao5 =>
					led17 <= '0';
					led18 <= '1';
					futuro <= agitacao6;
			
			when agitacao6 =>
					led18 <= '0';
					led19 <= '1';
					fututo <= agitacao7;
			
			when agitacao7 =>
					led19 <= '0';
					led20 <= '1';
					futuro <= pausa;
			
			when pausa =>
					led23 <= '0';
					led24 <= '1';
					if(t_pausa = 19)	then
						futuro <= lavagem1;
					end if;
					t_pausa := t_pausa + 1;
			
			when lavagem1 =>
					led24 <= '0';
					led25 <= '1';
					led20 <= '0';
					led19 <= '1';					
					futuro <= lavagem2;
					
			when lavagem2 =>
					led19 <= '0';
					led18 <= '1';
					futuro <= lavagem3;
					
			when lavagem3 =>
					led18 <= '0';
					led17 <= '1';
					futuro <= lavagem4;
					
			when lavagem4 =>
					led17 <= '0';
					led16 <= '1';
					futuro <= lavagem5;
					
			when lavagem5 =>
					led16 <= '0';
					led15 <= '1';
					futuro <= lavagem6;
					
			when lavagem6 =>
					led15 <= '0';
					led14 <= '1';
					futuro <= lavagem7;
					
			when lavagem7 =>
					led14 <= '0';
					led13 <= '1';
					futuro <= lavagem8;
					
			when lavagem8 =>
					led13 <= '0';
					led14 <= '1';
					futuro <= lavagem9;
			
			when lavagem9 =>
					led14 <= '0';
					led15 <= '1';
					futuro <= lavagem10;
					
			when lavagem10 =>
					led15 <= '0';
					led16 <= '1';
					futuro <= lavagem11;
			
			when lavagem11 =>
					led16 <= '0';
					led17 <= '1';
					futuro <= lavagem12;
			
			when lavagem12 =>
					led17 <= '0';
					led18 <= '1';
					futuro <= lavagem13;
			
			when lavagem13 =>
					led18 <= '0';
					led19 <= '1';
					futuro <= lavagem14;
			
			when lavagem14 =>
					led19 <= '0';
					led20 <= '1';
					futuro <= centrifugacao1;
			
			when centrifugacao1 =>
					led25 <= '0';
					led26 <= '1';
					led20 <= '0';
					led13 <= '1';
					futuro <= centrifugacao2;
					
			when centrifugacao2 =>
					led13 <= '0';
					led14 <= '1';
					futuro <= centrifugacao3;
			
			when centrifugacao3 =>
					led14 <= '0';
					led15 <= '1';
					futuro <= centrifugacao4;
					
			when centrifugacao4 =>
					led15 <= '0';
					led16 <= '1';
					futuro <= centrifugacao5;
					
			when centrifugacao5 =>
					led16 <= '0';
					led17 <= '1';
					futuro <= centrifugacao6;
					
			when centrifugacao6 =>
					led17 <= '0';
					led18 <= '1';
					futuro <= centrifugacao7;
			
			when centrifugacao7 =>
					led18 <= '0';
					led19 <= '1';
					if (n_centrifugacao <= 3)
					{
						n_centrifugacao := n_centrifugacao + 1;
						futuro <= centrifugacao1;
					}
					futuro <= fim; 
		end case;
	end process;
end etapas;