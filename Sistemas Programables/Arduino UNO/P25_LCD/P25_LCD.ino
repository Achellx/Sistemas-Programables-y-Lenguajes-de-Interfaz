// Práctica 2.5 Arduino y LCD
// Tecnologia de Chihuahua ll
// Sistemas Programables
// Adán Gerardo Trejo Garcia
// Alegandro Soto Aguirre
// Azul Siret Cordero Gonzáles 
// Fecha de Realizacion: 18/03/25
// Programa que utiliza el puerto analogo A0 del Arduino Uno para leer el valor de un potenciometro
// Mostrandolo en el monitor serial y a su vez conectado en el display LCD con ayuda de la libreria 
// LiquidCrystal, practica devidida en dos partes revision fisica y revision simulada.


#include <LiquidCrystal.h>

LiquidCrystal lcd(12,11,10,9,8,7);

// Definicion de pines
const int potenciometro = A0;  // Pin del potenciometro
int ultimaLectura = -1;

void setup() {
    // Configuración del pin como entrada
    pinMode(potenciometro, INPUT);
    // Inicializacion del Monitor serial
    Serial.begin(9600);

    //LCD Settings
    lcd.begin(16,2);
}

void loop () {
    
    int lectura = analogRead(potenciometro);
    float voltaje = (lectura / 1023.0) * 5.0; // Conversion a voltaje

    if (lectura != ultimaLectura){

      lcd.clear();
      lcd.setCursor(0, 0);
      lcd.print(voltaje);

      ultimaLectura = lectura;
    }

    Serial.println(voltaje);
    delay(500);
}



