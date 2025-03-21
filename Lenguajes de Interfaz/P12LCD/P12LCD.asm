;************************ Proyecto: Práctica 1.2 LCD **************************************************
; Instituto Tecnológico Campus Chihuahua 2
; Materia: Sistemas Programables
; Autores: 
; - Adan Gerardo Trejo Garcia
; - Azul Siret Cordero Gonzalez
; - Alejandro Soto Aguirre
; Fecha: 17/02/25 

;================================ ZONA DE DATOS ===================================================================
List P=16F84A ; Procesador PIC16f84A
INCLUDE <P16F84A.INC> ;Incluye las librerias 
    
; CONFIGURACION DEL PIC16F84A
  __CONFIG _XT_OSC & _WDTE_OFF & _PWRTE_ON & _CP_OFF

;MEMORIA DE USUARIO
CBLOCK 0x0C
ENDC
 
;CODIGO
    ORG	0
INICIO
	
	bsf	STATUS,RP0
	clrf	TRISB
	movlw	b'11110000'
	movwf	PORTB
	bcf		STATUS,RP0
	clrf	TRISA
	movlw	b'00010101'
	movwf	PORTA
    CALL    LCD_Inicializa 

START
    BTFSS   PORTA, 4	     ; Verifica el estado del interruptor en RA4
    GOTO    MOSTRAR_LETRAS ; Si RA4 es 0, muestra las letras
    GOTO    MOSTRAR_INTERFAZ ; Si RA4 es 1, muestra "INTERFAZ"

MOSTRAR_LETRAS
    MOVLW   1
    CALL    LCD_PosicionLinea1
    MOVLW   'T'           ; Primera letra del primer apellido
    CALL    LCD_Caracter
    MOVLW   'S'           ; Primera letra del segundo apellido
    CALL    LCD_Caracter
    MOVLW   'C'           ; Primera letra del tercer apellido
    CALL    LCD_Caracter
    CALL    Retardo_2s
    CALL    LCD_Borra
    CALL    Retardo_1s
    GOTO    START

MOSTRAR_INTERFAZ
    MOVLW   1
    CALL    LCD_PosicionLinea1
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
    GOTO    START

	 INCLUDE <LCD_4BIT.INC>
     INCLUDE <RETARDOS.INC>
		
	END