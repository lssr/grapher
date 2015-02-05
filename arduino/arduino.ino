void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  pinMode(2, INPUT);
  pinMode(3, INPUT);
  pinMode(4, INPUT);
  pinMode(5, INPUT);
  pinMode(6, INPUT);
  pinMode(7, INPUT);
  pinMode(8, INPUT);
  pinMode(9, INPUT);
  pinMode(10, INPUT);
  pinMode(11, INPUT);
  pinMode(12, INPUT);
  pinMode(13, INPUT);
}

void loop() {
  // put your main code here, to run repeatedly:
  
  int a0 = analogRead(A0);
  int a1 = analogRead(A1);
  int a2 = analogRead(A2);
  int a3 = analogRead(A3);
  int a4 = analogRead(A4);
  int a5 = analogRead(A5);
  
  int d2 = digitalRead(2);
  int d3 = digitalRead(3);
  int d4 = digitalRead(4);
  int d5 = digitalRead(5);
  int d6 = digitalRead(6);
  int d7 = digitalRead(7);
  int d8 = digitalRead(8);
  int d9 = digitalRead(9);
  int d10 = digitalRead(10);
  int d11 = digitalRead(11);
  int d12 = digitalRead(12);
  int d13 = digitalRead(13);
  
  String stringDiv = ";";
  String print_val = a0 + stringDiv +
                     a1 + stringDiv +
                     a2 + stringDiv +
                     a3 + stringDiv +
                     a4 + stringDiv +
                     a5 + stringDiv +
                     d2 + stringDiv + 
                     d3 + stringDiv + 
                     d4 + stringDiv + 
                     d5 + stringDiv + 
                     d6 + stringDiv + 
                     d7 + stringDiv + 
                     d8 + stringDiv + 
                     d9 + stringDiv + 
                     d10 + stringDiv + 
                     d11 + stringDiv + 
                     d12 + stringDiv +
                     d13;

  Serial.println(print_val);
  delay(100);
}
