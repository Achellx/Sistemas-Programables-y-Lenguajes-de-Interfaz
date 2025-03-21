// Práctica 2.2 Semáforo peatonal.
// Instituto Tecnologico de Chihauhua 2
// Sistemas Programables
// Adán Gerardo Trejo Garcia
// Alegandro Soto Aguirre
// Azul Siret Cordero Gonzáles 
// Fecha de Realizacion: 01/03/25

// Este código implementa el control de un semáforo peatonal con un botón utilizando un microcontrolador (como Arduino).
// Inicialmente, el semáforo vehicular está en verde y el peatonal en rojo. Cuando un peatón presiona el botón, 
//se activa una secuencia en la que el semáforo vehicular cambia a amarillo, luego a rojo, permitiendo el paso de peatones con luz verde durante 15 segundos. 
//Finalmente, el sistema vuelve al estado inicial.

// Definición de pines
const int vehicularVerde = 2;  // Pin para el semáforo vehicular en verde
const int vehicularAmarillo = 3;  // Pin para el semáforo vehicular en amarillo
const int vehicularRojo = 4;  // Pin para el semáforo vehicular en rojo
const int peatonVerde = 5;  // Pin para el semáforo peatonal en verde
const int peatonRojo = 6;  // Pin para el semáforo peatonal en rojo
const int botonPeaton = 7;  // Pin para el botón del peatón

void setup() {
  // Configuración de pines como salidas o entradas
  pinMode(vehicularVerde, OUTPUT);
  pinMode(vehicularAmarillo, OUTPUT);
  pinMode(vehicularRojo, OUTPUT);
  pinMode(peatonVerde, OUTPUT);
  pinMode(peatonRojo, OUTPUT);
  pinMode(botonPeaton, INPUT);

  // Estado inicial: Verde para vehículos, Rojo para peatones
  digitalWrite(vehicularVerde, HIGH);
  digitalWrite(vehicularAmarillo, LOW);
  digitalWrite(vehicularRojo, LOW);
  digitalWrite(peatonVerde, LOW);
  digitalWrite(peatonRojo, HIGH);
}

void loop() {
  // Verifica si el botón del peatón ha sido presionado
  if (digitalRead(botonPeaton) == HIGH) {
    // Inicia la secuencia de cambio de semáforo
    secuenciaSemaforo();
  }
}

void secuenciaSemaforo() {
  // Cambia a Amarillo para vehículos y Rojo para peatones
  digitalWrite(vehicularVerde, LOW);
  digitalWrite(vehicularAmarillo, HIGH);
  delay(5000);  // Espera 5 segundos

  // Cambia a Rojo para vehículos y Verde para peatones
  digitalWrite(vehicularAmarillo, LOW);
  digitalWrite(vehicularRojo, HIGH);
  digitalWrite(peatonRojo, LOW);
  digitalWrite(peatonVerde, HIGH);
  delay(15000);  // Espera 15 segundos

  // Vuelve al estado inicial: Verde para vehículos, Rojo para peatones
  digitalWrite(vehicularRojo, LOW);
  digitalWrite(vehicularVerde, HIGH);
  digitalWrite(peatonVerde, LOW);
  digitalWrite(peatonRojo, HIGH);
}

void delaySegundos(int segundos) {
  // Función para generar un retardo en segundos
  delay(segundos * 1000);
}