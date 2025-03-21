// Práctica 2.4 Dando Electroncio
// Adán Gerardo Trejo Garcia
// Alegandro Soto Aguirre
// Azul Siret Cordero Gonzáles 
// Fecha de Realizacion: 04/03/25
// Breve explicación de la función del programa (tres renglones máximo)
//
//


// Definicion de pines
const int uno = 2;  // Led uno
const int dos = 3;  // Led dos 
const int tres = 4;  // Led tres
const int cuatro = 5;  // Led cuatro
const int cinco = 6;  // Led cinco
const int seis = 7;  // Led seis
const int button = 8;  // Led button


void setup() {
   // Configuración de pines como salidas o entradas
  pinMode(uno, OUTPUT); 
  pinMode(dos, OUTPUT);
  pinMode(tres, OUTPUT);
  pinMode(cuatro, OUTPUT);
  pinMode(cinco, OUTPUT);
  pinMode(seis, OUTPUT);
  pinMode(button, INPUT);
  serial.begin(9600);
}

void loop() {

  spinNumber = random(1,6);
  Serial.print(spinNumber);

  switch (spinNumber) {
    case 1:
      digitalWrite(uno, HIGH);
      break;
    case 2:
      digitalWrite(uno, HIGH)
      digitalWrite(dos, HIGH);
      break;
    case 3:
      digitalWrite(uno, HIGH)
      digitalWrite(dos, HIGH);
      digitalWrite(tres, HIGH);
      break;
    case 4:
      digitalWrite(uno, HIGH)
      digitalWrite(dos, HIGH);
      digitalWrite(tres, HIGH);
      digitalWrite(cuatro, HIGH);
      break;
    case 5:
      digitalWrite(uno, HIGH)
      digitalWrite(dos, HIGH);
      digitalWrite(tres, HIGH);
      digitalWrite(cuatro, HIGH);
      digitalWrite(cinco, HIGH);
      break;
    case 5:
      digitalWrite(uno, HIGH)
      digitalWrite(dos, HIGH);
      digitalWrite(tres, HIGH);
      digitalWrite(cuatro, HIGH);
      digitalWrite(cinco, HIGH);
      digitalWrite(seis, HIGH)
      break;
  }
}
