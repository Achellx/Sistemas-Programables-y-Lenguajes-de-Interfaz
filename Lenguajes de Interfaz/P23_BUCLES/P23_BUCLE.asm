;************************ Proyecto: Práctica 2.3 BUCLES **************************************************
; Instituto Tecnológico Chihuahua 2
; Materia: Lenguaje de Interfacez 
; Autores: 
; - Adan Gerardo Trejo Garcia
; - Alejandro Soto Aguirre
; - Azul Siret Cordero  Gonzalez
; Fecha de Realizacion: 18/03/25 

;

;================================ ZONA DE DATOS ===================================================================
	LIST    P=16F84A            ; Especifica que el microcontrolador utilizado
	INCLUDE "P16F84a.INC"       ; Incluye el archivo de definiciones del PIC16F84A

	__CONFIG _CP_OFF & _WDT_OFF & _PWRTE_ON & _XT_OSC  ; Configuracion del grabador del microcontrolador:
                            ; _CP_OFF: Desactiva la protección de código
                            ; _WDT_OFF: Desactiva el Watchdog Timer
                            ; _PWRTE_ON: Habilita el Power-Up Timer
                            ; _XT_OSC: Configura el oscilador en modo XT (cristal)


;================================= ZONA DE CODIGO ===================================================================
CONTADOR EQU 0x0C  ; Definir CONTADOR en la dirección 0x0C	

	ORG 0x00 ;Direccion de inicio del Programa

INICIO:
    BSF STATUS, RP0     ; Seleccionar banco 1
    MOVLW 0x00
    MOVWF TRISB         ; Puerto B como salida
    MOVLW 0xFF 
    MOVWF TRISA     	; Puerto A como entrada
    BCF STATUS, RP0     ; Regresar a banco 0
    CLRF PORTB          ; Apagar todos los LEDs

	MOVLW 0x03        ; Cargar 3 en el registro del contador
	MOVWF CONTADOR    ; Guardar el valor en CONTADOR

FOR_LOOP:
    BSF PORTB, 0  ; Encender LED en RB0
    ;CALL DELAY    ; Llamar a un retardo
    DECFSZ CONTADOR, F   ; Decrementar CONTADOR y verificar si es 0
    GOTO FOR_LOOP        ; Si no es 0, repetir el ciclo

; Cuando CONTADOR llegue a 0, el FOR termina y sigue el código

    END    ; Fin del programa

;====================================================================================================================


                
