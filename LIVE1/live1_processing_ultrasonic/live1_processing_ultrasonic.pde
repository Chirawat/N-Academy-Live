// Example by N Academy
// Apr 16, 2020

import processing.serial.*;

Serial myPort;  // The serial port
float x = 0;
float y = 100;

void setup() {
  
    
  size(800, 100);
  background(153);


  // List all the available serial ports:
  printArray(Serial.list());
  // Open the port you are using at the rate you want:
  myPort = new Serial(this, Serial.list()[0], 9600);
}

void draw() {
  background(0);
  stroke(255);
  line(0,31,1000,31);
  for(int i=0; i<1000; i=i+100){
    text(i, i, 30);
  }
  text("Measure distance by ultrasonic sensor     unit: mm", 10, 70);
  text("Developed by N Academy", 10, 80);
  
  while (myPort.available() > 0) {
    String inBuffer = myPort.readStringUntil('\n');   
    if (inBuffer != null) {
      x = float(inBuffer);
      println( x );
      //println(x);
    }
  }
    
   rect(x,35,20,20);
   text(x, x+25, 50);  

}
