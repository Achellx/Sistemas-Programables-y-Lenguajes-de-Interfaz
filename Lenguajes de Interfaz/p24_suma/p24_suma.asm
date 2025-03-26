;************************ Proyecto: Práctica 2.4 Suma de NIBBLES **************************************************
; Instituto Tecnológico Chihuahua 2
; Materia: Lenguaje de Interfacez 
; Autores: 
; - Adan Gerardo Trejo Garcia
; - Alejandro Soto Aguirre
; - Azul Siret Cordero  Gonzalez
; Fecha de Realizacion: 25/03/25 

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
; Variables
TEMP        EQU 0x0C    ; Almacena entrada PORTB
LOW_NIBBLE  EQU 0x0D    ; Nibble bajo
SUMA_TEMP   EQU 0x0E    ; Resultado temporal
CARRY       EQU 0x0F    ; Bandera de carry
DELAY1      EQU 0x10    ; Variable para delay
DELAY2      EQU 0x11    ; Variable para delay

; Vector de reset
    ORG 0x00
    GOTO INICIO

; Vector de interrupción (no usado)
    ORG 0x04
    RETFIE

; Programa principal
INICIO
    BANKSEL TRISB        ; Banco 1
    MOVLW   0xFF         ; PORTB como entrada
    MOVWF   TRISB
    CLRF    TRISA        ; PORTA como salida
    BANKSEL PORTA        ; Banco 0

BUCLE
    ; Leer PORTB y extraer nibbles
    MOVF    PORTB, W
    MOVWF   TEMP

    ; Nibble bajo (RB0-RB3)
    ANDLW   0x0F
    MOVWF   LOW_NIBBLE

    ; Nibble alto (RB4-RB7)
    SWAPF   TEMP, W
    ANDLW   0x0F
    MOVWF   SUMA_TEMP

    ; Sumar nibbles
    ADDWF   LOW_NIBBLE, W
    MOVWF   SUMA_TEMP

    ; Calcular carry (suma >= 16)
    MOVLW   0x10
    SUBWF   SUMA_TEMP, W
    MOVLW   0x01         ; Asumir carry=1
    BTFSS   STATUS, C    ; Si C=1 (suma >=16)
    MOVLW   0x00         ; Si no, carry=0
    MOVWF   CARRY

    ; Calcular suma real (0-15)
    BTFSS   STATUS, C
    GOTO    NO_CARRY
    MOVLW   0x10
    SUBWF   SUMA_TEMP, W
	GOTO	CONTINUE
NO_CARRY:
    MOVF	SUMA_TEMP, W
CONTINUE:
	ANDLW	0x0F

    ; Mapear bits a RA0-RA3
    MOVWF   TEMP
    CLRF    PORTA        ; Limpiar PORTA

    ; Bit 0 ? RA0 (pin 17)
    BTFSC   TEMP, 0
    BSF     PORTA, 0

    ; Bit 1 ? RA1 (pin 18)
    BTFSC   TEMP, 1
    BSF     PORTA, 1

    ; Bit 2 ? RA2 (pin 1)
    BTFSC   TEMP, 2
    BSF     PORTA, 2

    ; Bit 3 ? RA3 (pin 2)
    BTFSC   TEMP, 3
    BSF     PORTA, 3

    ; Añadir carry a RA4 (pin 3)
    BTFSS   CARRY, 0     ; Si carry=1, RA4=0 (LED encendido)
    BSF     PORTA, 4     ; Si carry=0, RA4=1 (LED apagado)

    ; Delay para evitar parpadeo (˜10ms)
    CALL    Retardo_10ms
    GOTO    BUCLE

INCLUDE <RETARDOS.INC>

    END
===================================================================================


