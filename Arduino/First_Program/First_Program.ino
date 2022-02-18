int Motor1_Pin1 = 2;
int Motor1_Pin2 = 3;

int Motor2_Pin1 = 5;
int Motor2_Pin2 = 4;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  
  pinMode(Motor1_Pin1, OUTPUT);
  pinMode(Motor1_Pin2, OUTPUT);

  pinMode(Motor2_Pin1, OUTPUT);
  pinMode(Motor2_Pin2, OUTPUT);

}

void loop() {
  // put your main code here, to run repeatedly:
  myRun(1, 200);

  myTurn(1, true);

  myRun(3, 200);

  myTurn(1, true);

  myRun(3, 200);

  myRun(1, 10);

  exit(0);
}

void myRun(float inputClocks, int inputSpeed) {
    
  changeSpeed(inputSpeed);
  
  digitalWrite(Motor1_Pin1, HIGH);
  digitalWrite(Motor1_Pin2, LOW);
  
  digitalWrite(Motor2_Pin1, HIGH);
  digitalWrite(Motor2_Pin2, LOW);
  
  delay(1000 * inputClocks);
}

void myTurn(float inputClocks, bool turn) {
  
  if (turn) {
    digitalWrite(Motor1_Pin1, HIGH);
    digitalWrite(Motor1_Pin2, LOW);
    
    digitalWrite(Motor2_Pin1, LOW);
    digitalWrite(Motor2_Pin2, HIGH);

    delay(1000 * inputClocks);
  }

  else if (! turn) {
    digitalWrite(Motor1_Pin1, LOW);
    digitalWrite(Motor1_Pin2, HIGH);
    
    digitalWrite(Motor2_Pin1, HIGH);
    digitalWrite(Motor2_Pin2, LOW);

    delay(1000 * inputClocks);
  }
}

void changeSpeed(int inputSpeed) {
  pinMode(9, OUTPUT);
  pinMode(10, OUTPUT);
    
  analogWrite(9, inputSpeed);
  analogWrite(10, inputSpeed);
}
