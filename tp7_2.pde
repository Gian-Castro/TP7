import processing.serial.*;

Serial myport;

int e1;
int e2;
int s1;
int s2;
int s1i;
int s2i;

String e1in;
String e2in;
String s1in;
String s2in;
String s1out;
String s2out;


void setup(){
  size(500, 360);
  
  printArray(Serial.list());
  String portName = Serial.list()[1];
  myport = new Serial(this, portName, 9600);
  e1in= "";
  e2in= "";
  s1out= "";
  s2out= "";
  
}

void draw(){
  background(255,255,255);
  
  fill(182,162,240);
  rect(50, 60, 100, 25);
  textSize(18);
  fill(0, 0, 0);
  text("Entradas", 60, 79);
  
  fill(255,255,255);
  rect(200, 60, 35, 25);
  fill(0,0,0);
  text("E1", 210, 79);
  
  fill(255,255,255);
  rect(260, 60, 35, 25);
  fill(0,0,0);
  text("E2", 270, 79);
  
  
  fill(54,106,255);
  rect(50, 200, 100, 25);
  textSize(18);
  fill(0, 0, 0);
  text("Salidas", 60, 219);
  
  fill(255,255,255);
  circle(212, 212, 35);
  //rect(194.5, 194.5, 35, 35);
  fill(0,0,0);
  text("L1" , 203, 218);
  
  fill(255,255,255);
  circle(272, 212, 35);
  //rect(254.5, 194.5, 35, 35);
  fill(0,0,0);
  text("L2" , 263, 218);
  
  delay(00);
  while (myport.available()>0){
    String buffer = myport.readStringUntil(10); //caracter ascii del enter
    print(buffer);
    
    if(buffer.startsWith("a")){
      e1in = buffer.substring(1, 2);
      e1 = int(e1in);
      //println(e1);
    }
    if(buffer.startsWith("b")){
      e2in = buffer.substring(1, 2);
      e2 = int(e2in);
      //println(e2);
    }
    if(buffer.startsWith("c")){
      s1in = buffer.substring(1, 2);
      s1i = int(s1in);
      //println(s1);
      //s1=s1i;
    }
    if(buffer.startsWith("d")){
      s2in = buffer.substring(1, 2);
      s2i = int(s2in);
      //println(s2);
    }
  }
  
  if(e1==1){
    fill(0,214,8);
    rect(200, 60, 35, 25);
  }
  else if(e1==0){
    fill(234,0,8);
    rect(200, 60, 35, 25);
  }
  fill(0,0,0);
  text("E1", 210, 79);
  
  if(e2==1){
    fill(0,214,8);
    rect(260, 60, 35, 25);
  }
  else if(e2==0){
    fill(234,0,8);
    rect(260, 60, 35, 25);
  }
  fill(0,0,0);
  text("E2", 270, 79);
  
  
  if(s1==1){
    fill(0,214,8);
    circle(212, 212, 35);
  }
  else if(s1==0){
    fill(234,0,8);
    circle(212, 212, 35);
  }
  fill(0,0,0);
  text("L1" , 203, 218);
  
  if(s2==1){
    fill(0,214,8);
    circle(272, 212, 35);
  }
  else if(s2==0){
    fill(234,0,8);
    circle(272, 212, 35);
  }
  fill(0,0,0);
  text("L2" , 263, 218);
  
  if(s1==0){
    s1out="x0E";
  }
  else if(s1==1){
    s1out="x1E";
  }
  
  if(s2==0){
    s2out="z0E";
  }
  else if(s2==1){
    s2out="z1E";
  }
  
  myport.write(s1out);
  myport.write(s2out);
  
  println(s1out);
  //println(s2out);
  
  //delay(2000);
}

void mouseClicked(){
  if((mouseX>194.5 && mouseX<229.5) && (mouseY>194.5 && mouseY<229.5)){
    println("Click L1");
    if(s1i==0){
      s1=1;
      //s1out="x1E";
    }
    else if(s1i==1){
      s1=0;
      //s1out="x0E";
    }
  }
  if((mouseX>254.5 && mouseX<289.5) && (mouseY>194.5 && mouseY<229.5)){
    println("Click L2");
    if(s2==0){
      s2=1;
    }
    else if(s2==1){
      s2=0;
    }
  }
}
