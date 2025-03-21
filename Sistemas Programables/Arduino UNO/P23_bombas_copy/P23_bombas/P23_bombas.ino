// Práctica 2.3 Control de Bombas
// - Adán Gerardo Trejo Garcia
// - Alejandro Soto Aguirre
// - Azul Siret Cordero Gonzáles
// Fecha de Realizacion: 04/03/25
// Este programa en Arduino controla un depósito de líquidos utilizando interruptores en lugar de sondas para detectar el nivel del líquido
//  y accionar dos bombas de llenado. Se utiliza la instruccion (digitalRead) para detectar su activación (1 = ON, 0 = OFF).
// Se usa (If else) para manejar el control de los sensores en el programa.

// Definicion de pines
const int Vacio = 2;       // Led de Vacio
const int Llenandose = 3;  // Led de llenandose
const int Lleno = 4;       // Led de Lleno
const int Rebose = 5;      // Led de Rebose
const int Alarma = 6;      // Led de Alarma

const int Bomba1 = 7;  // Led de Bomba1
const int Bomba2 = 8;  // Led de Bomba2

const int SV = 9;    // Sensor de Vacio
const int SLL = 10;  // Sensor de Lleno
const int SR = 11;   // Sensor de Rebose


void setup() {
  // Configuracion de Entradas y Salidas

  // Configuración de los pines de entrada con resistencias pull-up internas
  pinMode(SV, INPUT);   // Entrada: Interruptor PULLUP para el sensor de Vacio
  pinMode(SLL, INPUT);  // Entrada: Interruptor PULLUP para el sensor de Llenado
  pinMode(SR, INPUT);   // Entrada: Interruptor PULLUP para el sensor de Rebose

  // Configuración de los pines de salida
  pinMode(Vacio, OUTPUT);       // Salida: Led de Vacio
  pinMode(Llenandose, OUTPUT);  // Salida: Led de Llenandose
  pinMode(Lleno, OUTPUT);       // Salida: Led de Lleno
  pinMode(Rebose, OUTPUT);      // Salida: Led de Rebose
  pinMode(Alarma, OUTPUT);      // Salida: Led de Alarma

  pinMode(Bomba1, OUTPUT);  // Salida: Led de Bomba1
  pinMode(Bomba2, OUTPUT);  // Salida: Led de Bomba2
}

void loop() {
    // Leer el estado de los interruptores (1 = ON, 0 = OFF)
    bool estadoSV = digitalRead(SV);
    bool estadoSLL = digitalRead(SLL);
    bool estadoSR = digitalRead(SR);

    // Fallo de Sensor de Vacio: Detectar fallo en sensores y activar alarma
    if ((estadoSR && !estadoSV) || (!estadoSV && estadoSLL)) {
        digitalWrite(Alarma, HIGH);
        digitalWrite(Bomba1, LOW);
        digitalWrite(Bomba2, LOW);
        return; // Detener el resto del código
    } else {
        digitalWrite(Alarma, LOW);
    }

    // Sensor de Rebose activado: Rebose - Apagar ambas bombas y activar LED de rebose
    if (estadoSR) {
        digitalWrite(Bomba1, LOW);
        digitalWrite(Bomba2, LOW);
        digitalWrite(Rebose, HIGH);
        return; // Salir de la función para evitar conflictos
    } else {
        digitalWrite(Rebose, LOW);
    }

    // Ningun Sensor esta activado: Depósito vacío - Activar ambas bombas
    if (!estadoSV && !estadoSLL) {
        digitalWrite(Bomba1, HIGH);
        digitalWrite(Bomba2, HIGH);
        digitalWrite(Vacio, HIGH);
        digitalWrite(Llenandose, LOW);
        digitalWrite(Lleno, LOW);
    } 
    // Sensor de Vacio Activado: Depósito llenándose - Ambas bombas siguen activas
    else if (estadoSV && !estadoSLL) {
        digitalWrite(Bomba1, HIGH);
        digitalWrite(Bomba2, HIGH);
        digitalWrite(Vacio, LOW);
        digitalWrite(Lleno, LOW);
        digitalWrite(Llenandose, HIGH);
    } 
    // Sensor de lleno Activado: Depósito lleno - Se apaga la bomba 2, pero la bomba 1 sigue activada
    else if (estadoSLL) {
        digitalWrite(Bomba1, HIGH);
        digitalWrite(Bomba2, LOW);
        digitalWrite(Llenandose, LOW);
        digitalWrite(Lleno, HIGH);
    }
}
