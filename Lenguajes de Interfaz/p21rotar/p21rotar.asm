;************************ Proyecto: Práctica 2.1 Operación de desplazamiento  **************************************************
; Instituto Tecnológico Chihuahua 2
; Materia: Lenguaje de Interfacez 
; Autores: 
; - Adan Gerardo Trejo Garcia
; - Azul Siret Cordero Gonzalez
; - Alejandro Soto Aguirre
; Fecha: 03/03/25 

;================================ ZONA DE DATOS ===================================================================
	LIST    P=16F84A            ; Especifica que el microcontrolador utilizado
	INCLUDE "P16F84a.INC"       ; Incluye el archivo de definiciones del PIC16F84A

	__CONFIG _CP_OFF & _WDT_OFF & _PWRTE_ON & _XT_OSC  ; Configura los fusibles del microcontrolador:
                            ; _CP_OFF: Desactiva la protección de código
                            ; _WDT_OFF: Desactiva el Watchdog Timer
                            ; _PWRTE_ON: Habilita el Power-Up Timer
                            ; _XT_OSC: Configura el oscilador en modo XT (cristal)

;================================= ZONA DE CODIGO ===================================================================

    ORG 0x00 ; Direccion de inicio del programa
    GOTO START ; Salto a la Etiqueta START 

	 ORG 0x20 ; Asigna la  direccion 20 y 21 para los Contadores izquierda y derecha
COUNT_LEFT  EQU 0x20
COUNT_RIGHT EQU 0x21

START:
    BSF STATUS, RP0    ; Cambiar a banco 1
    CLRF TRISB         ; Configurar PORTB como salida
    BCF STATUS, RP0    ; Volver a banco 0

    MOVLW b'00000001'  ; Cargar el valor inicial
    MOVWF PORTB        ; Mostrarlo en PORTB

	BCF	STATUS, C	; Limpia el Carry
	CALL Retardo_1s ; Llama a un retardo de 1 segundo

ROTATE_LEFT:			; Rotacion a la Izquierda
    MOVLW 7             ; Carga el valo decimal 8 para 8 rotaciones
    MOVWF COUNT_LEFT	; Mueve el valor del registro W (8) a la etiqueta COUNT_LEFT en la direccion 20 en memoria
    
LOOP_LEFT:				  ; Bucle izquierda
    RLF PORTB, F          ; Rotar a la izquierda con Carry
    CALL Retardo_500ms       ; Esperar un segundo en rotacion 
    DECFSZ COUNT_LEFT, F  ; Decremento del contador (COUNT_LEFT = 8)
    GOTO LOOP_LEFT        ; Salto a la etiqueta LOOP_LEFT, cuando el contador sea igual a 0 continua con la siguiente instruccion 

    CALL Retardo_1s         ; Espera 1 segundo antes de la rotación a la derecha

ROTATE_RIGHT:		   ; Rotacion a la Derecha
    MOVLW 7           ; Carga el valo decimal 8 para 8 rotaciones
    MOVWF COUNT_RIGHT  ; Mueve el valor del registro W (8) a la etiqueta COUNT_RIGHT en la direccion 21 en memoria
    
LOOP_RIGHT:			   ; Bucle Derecha
    RRF PORTB, F       ; Rotar a la derecha con Carry
    CALL Retardo_500ms        ; Esperar 1 segundo entre rotacion
    DECFSZ COUNT_RIGHT, F 	; Decrementar la etiqueta  COUNT_RIGHT = 8, cuando llega a 0 ignora la siguiente instrucion
	GOTO LOOP_RIGHT
    GOTO STOP		; Salto a la etiqueta STOP

STOP:
    GOTO $              ; Bucle infinito para detener el programa
;=========================================================================================

	INCLUDE "RETARDOS.INC" ; Incluye la libreria para los retardos

    END                ; Fin del programa
