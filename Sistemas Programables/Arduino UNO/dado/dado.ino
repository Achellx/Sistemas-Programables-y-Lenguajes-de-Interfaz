// Práctica 2.4 Dado Electroncio
// Adán Gerardo Trejo Garcia
// Alegandro Soto Aguirre
// Azul Siret Cordero Gonzáles 
// Fecha de Realizacion: 10/03/25
// Programa que simula a un dado, utilizando la funcion random para generar la aleatoriedad de un dado
// El numero que "cae" es mostrado por 6 leds conectados a los pines del Arduino UNO
// Las condiciones son manejadas por medio de un switch 


// Definicion de pines
const int uno = 2;  // Led uno
const int dos = 3;  // Led dos 
const int tres = 4;  // Led tres
const int cuatro = 5;  // Led cuatro
const int cinco = 6;  // Led cinco
const int seis = 7;  // Led seis
const int button = A3;  // Button


void setup() {
   // Configuración de pines como salidas o entradas
  pinMode(uno, OUTPUT); 
  pinMode(dos, OUTPUT);
  pinMode(tres, OUTPUT);
  pinMode(cuatro, OUTPUT);
  pinMode(cinco, OUTPUT);
  pinMode(seis, OUTPUT);
  pinMode(button, INPUT);

  Serial.begin(9600);
}

void loop () {

  int buttonValue = digitalRead(button);

  while (digitalRead(button) == LOW);

  while (digitalRead(button) == HIGH);

  int spinNumber = random(1,7);
  Serial.print("Lado del dado: ");
  Serial.print(spinNumber);

  ledOFF();

  // Funcion para mostrar el numero del dado
  switch (spinNumber) {
    case 1:
      digitalWrite(uno, HIGH);
      break;
    case 2:
      digitalWrite(uno, HIGH);
      digitalWrite(dos, HIGH);
      break;
    case 3:
      digitalWrite(uno, HIGH);
      digitalWrite(dos, HIGH);
      digitalWrite(tres, HIGH);
      break;
    case 4:
      digitalWrite(uno, HIGH);
      digitalWrite(dos, HIGH);
      digitalWrite(tres, HIGH);
      digitalWrite(cuatro, HIGH);
      break;
    case 5:
      digitalWrite(uno, HIGH);
      digitalWrite(dos, HIGH);
      digitalWrite(tres, HIGH);
      digitalWrite(cuatro, HIGH);
      digitalWrite(cinco, HIGH);
      break;
    case 6:
      digitalWrite(uno, HIGH);
      digitalWrite(dos, HIGH);
      digitalWrite(tres, HIGH);
      digitalWrite(cuatro, HIGH);
      digitalWrite(cinco, HIGH);
      digitalWrite(seis, HIGH);
      break;
  }
}

// Funcion para apagar los leds
void ledOFF(){
  digitalWrite(uno, LOW);
  digitalWrite(dos, LOW);
  digitalWrite(tres, LOW);
  digitalWrite(cuatro, LOW);
  digitalWrite(cinco, LOW);
  digitalWrite(seis, LOW);
}

