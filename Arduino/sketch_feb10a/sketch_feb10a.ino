int Motor1_Pin1 = 4;
int Motor1_Pin2 = 5;

void setup() {
  // put your setup code here, to run once:
  
  pinMode(Motor1_Pin1, OUTPUT);
  pinMode(Motor1_Pin2, OUTPUT);
}

void loop() {
  // put your main code here, to run repeatedly:
  digitalWrite(Motor1_Pin1, HIGH);
  digitalWrite(Motor1_Pin2, LOW);
  delay(1000);
}
