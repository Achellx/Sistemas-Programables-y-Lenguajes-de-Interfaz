;************************ Proyecto: Práctica 1.2 LCD **************************************************
; Instituto Tecnológico Campus Chihuahua 2
; Materia: Lenguaje de Interfacez 
; Autores: 
; - Adan Gerardo Trejo Garcia
; - Azul Siret Cordero Gonzalez
; - Alejandro Soto Aguirre
; Fecha: 17/02/25 

;================================ ZONA DE DATOS ===================================================================

    LIST    P=16F84A
    INCLUDE "P16F84a.INC"
    __CONFIG _CP_OFF & _WDT_OFF & _PWRTE_ON & _XT_OSC

    ORG	0
INICO 
	BSF     STATUS, RP0      ; Banco 1
    MOVLW   B'00010000'      ; Configura RA4 como entrada
	MOVWF   PORTA
    BCF     STATUS, RP0      ; Banco 0

	CALL LCD_Inicializa

INTERRUPTOR
    ; Verifica el estado del interruptor en RA4
    BTFSC	PORTA, 5        ; Verifica si RA4 estádo
    GOTO    INICIALES 		; Salta 
    GOTO    PALABRA 		; Salta
			
INICIALES
    MOVLW   1
    CALL    LCD_PosicionLinea1
    MOVLW   'T'
    CALL    LCD_Caracter
    MOVLW   'S'
    CALL    LCD_Caracter
    MOVLW   'C'
    CALL    LCD_Caracter
    CALL    Retardo_2s
    CALL    LCD_Borra
    CALL    Retardo_1s
    GOTO    INTERRUPTOR
	
PALABRA
 	MOVLW   1
	CALL    LCD_PosicionLinea2
    MOVLW   'I'
    CALL    LCD_Caracter
    MOVLW   'N'
    CALL    LCD_Caracter
    MOVLW   'T'
    CALL    LCD_Caracter
    MOVLW   'E'
    CALL    LCD_Caracter
    MOVLW   'R'
    CALL    LCD_Caracter
    MOVLW   'F'
    CALL    LCD_Caracter
	MOVLW   'A'
    CALL    LCD_Caracter
    MOVLW   'Z'
    CALL    LCD_Caracter
	CALL    Retardo_2s
    CALL    LCD_Borra
    CALL    Retardo_1s
    GOTO    INTERRUPTOR	

    INCLUDE  <RETARDOS.INC>
    INCLUDE  <LCD_4BIT.INC>
    END