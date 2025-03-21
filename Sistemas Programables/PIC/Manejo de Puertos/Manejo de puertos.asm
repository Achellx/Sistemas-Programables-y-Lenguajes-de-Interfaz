__CONFIG _CP_OFF & _WDT_OFF & _PWRTE_ON & _XT_OSC

LIST	P=16F84A
INCLUDE <P16F84A.INC>

	ORG 0

Inicio	bsf	STATUS,RP0
		clrf	TRISB
		movlw	b'00011111'
		movfw	TRISA
		bcf		STATUS,RP0
Principal	
		movf	PORTA,W
		movwf	PORTB
		goto	Principal

	END