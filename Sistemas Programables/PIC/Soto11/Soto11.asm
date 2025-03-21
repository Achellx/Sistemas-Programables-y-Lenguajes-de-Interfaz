;Soto

;Alejandro

;7 de Febrero de 2025

list p=16f84	;Directivas de compilador
include <p16F84.inc>	;Son instrucciones especificas, en el caso de esta linea incluimos una libreria
__CONFIG _RC_OSC & _WDT_OFF & _PWRTE_ON	;Se configura el registro de configuracion, en este caso utilizamos 
										;Un oscilador con resistencia y condensador, desactivamos el watchdog
										;Y deja encendido el Power Up Timer   

;-------------------------Codigo ensamblador empieza aqui ------------------------

j	equ	h'1F'	;En esta linea de codigo se define una variable 'j' en la direccion 1F dentro de la memoria
k	equ	h'1E'	;Esta linea hace lo mismo que la de arriba, define la variable 'k'
	org	0	;Esta es una directiva de ensamblador, inidica que la siguiente seccion del codigo debe ubicarse en la direccion de memoria 0
	
	movlw	b'00000000' ;Carga el valor binario al registro de trabajo W
	tris 	PORTB	;Configura los pines del puerto B en base a los valores contenidos en el registro W
	movlw	b'00000001'	;Carga el valor binarios al registro W
	movwf	PORTB	;Copia el valor del registro W al PORTB
	goto	mloop
	goto	interrupciones

mloop: rlf	PORTB,f	;Rota el bit del menos significativo al mas significativo
	
	   movlw	d'50'	;Carga este valor decimal al registro W
	   movwf	j	;Copia el valor del registro W a la variable 'j'
jloop	movwf	k	;Se asigna la etiqueta jloop y se copia el valor del registro W a la variable 'k'
kloop	decfsz	k,f	;Decrementa k-1, esto es un ciclo, estructura de control. Recordemos que k cuenta con el valor 50 en decimal,
					;si el resultado es 0 salta a la siguiente instruccion
		goto	kloop	;Salta a la etiqueta 'kloop' mientra 'k' no sea 0
		decfsz	j,f	;Decrementa 'j' en 1, si el resultado es 0 salta a la siguiente instruccion
		goto	jloop ;Vuelve a la etiqueta 'jloop'

		goto	mloop ;Salta a la etiqueta mloop, creando un bucle infinito

interrupciones	nop
		
		end	
;---------------------Directiva de compilador que marca el final del programa, sin el archivo no termina-------------------------
;Este programa es un loop infinito no termina hasta que se apague 