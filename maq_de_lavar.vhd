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
	type estado is (enchimento1, enchimento2, enchimento3, enchimento4, enchimento5, enchimento6, enchimento7, enchimento8,
						 agitacao1, agitacao2, agitacao3, agitacao4, agitacao5, agitacao6,
						 pausa1, pausa2, pausa3, pausa4, pausa5, pausa6, pausa7, pausa8, pausa9, pausa10, 
						 lavagem1, lavagem2, lavagem3, lavagem4, lavagem5, lavagem6, lavagem7,lavagem8, 
						 centrifugacao1);
	signal atual, futuro : estado;
begin
	process(clock,reset)
	begin
		variable gerador_tempo =	integer	range 0 to 4999999; -- ([20MHZ ^ -1] *5.000.000 = 0,25s). Como eh vereficado a cada borda de subida(2 ciclos de onda), 0,25 * 2 = 0,5s
	
		if(reset = '1')	then
			atual <= enchimento1;
		elsif(clock'event and clock = '1')	then
			atual <= futuro;
			gerador_tempo += 1;
		end if;
	end process;
	
	process(atual)
	begin
		case atual is
			when enchimento1 =>
				if (gerador_tempo = 0) then
					
					futuro <= enchimento2;
				end if;
			
			when enchimento2 =>
				if (gerador_tempo = 0) then
					
					futuro <= enchimento3;
				end if;
				
			when enchimento3 =>
				if (gerador_tempo = 0) then
					
					futuro <= enchimento4;
				end if;
				
			when enchimento4 =>
				if (gerador_tempo = 0) then
					
					futuro <= enchimento5;
				end if;
				
			when enchimento5 =>
				if (gerador_tempo = 0) then
					
					futuro <= enchimento6;
				end if;
				
			when enchimento6 =>
				if (gerador_tempo = 0) then
					
					futuro <= enchimento7;
				end if;
			
			when enchimento7 =>
				if (gerador_tempo = 0) then
					
					futuro <= enchimento8;
				end if;
			
			when enchimento8 =>
				if (gerador_tempo = 0) then
					
					futuro <= agitacao1;
				end if;
		
		end case;
	end process;
end etapas;