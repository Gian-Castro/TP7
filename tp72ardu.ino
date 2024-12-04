#define pul1 2
#define pul2 3
#define led1 11
#define led2 12

int l1m=0;
int l2m=0;

String inputString = "";       
boolean stringComplete = false;

void setup() {
  Serial.begin(9600);

  pinMode(pul1, INPUT);
  pinMode(pul2, INPUT);
  pinMode(led1, OUTPUT);
  pinMode(led2, OUTPUT);

  inputString.reserve(200);
}

void loop() {
  serialEvent();

  if(stringComplete){
    if (inputString[0]== 'x'){
      int auxx= String(inputString[1]).toInt();
      //Serial.println(auxx);
      l1m=auxx;
    }
    if (inputString[0]== 'z'){
      int auxz= String(inputString[1]).toInt();
      //Serial.println(auxz);
      l2m=auxz;
    }
    stringComplete=false;
  }
       
  if(digitalRead(pul1)==HIGH){
    Serial.println("a1");
    if(l1m==0){
      l1m=1;
    }
    else if(l1m==1){
      l1m=0;
    }
  }
  else if(digitalRead(pul1)==LOW){
    Serial.println("a0");
  }
  
  if(digitalRead(pul2)==HIGH){
    Serial.println("b1");
    if(l2m==0){
      l2m=1;
    }
    else if(l2m==1){
      l2m=0;
    }
  }
  else if(digitalRead(pul2)==LOW){
    Serial.println("b0");
  }



  if(l1m==0){
    digitalWrite(led1, LOW);
    Serial.println("c0");
  }
  else if(l1m==1){
    digitalWrite(led1, HIGH);
    Serial.println("c1");
  }

  if(l2m==0){
    digitalWrite(led2, LOW);
    Serial.println("d0");
  }
  else if(l2m==1){
    digitalWrite(led2, HIGH);
    Serial.println("d1");
  }
  
  delay(500);
}

void serialEvent() {
  while (Serial.available()>0) 
  {
    inputString = Serial.readStringUntil('E');
    stringComplete = true;
    //Serial.println(inputString);
  }
}