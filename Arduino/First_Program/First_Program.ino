int Motor1_Pin1 = 2;
int Motor1_Pin2 = 3;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  
  pinMode(Motor1_Pin1, OUTPUT);
  pinMode(Motor1_Pin2, OUTPUT);

}

void loop() {
  // put your main code here, to run repeatedly:
  digitalWrite(Motor1_Pin1, LOW);
  digitalWrite(Motor1_Pin2, HIGH);
}
