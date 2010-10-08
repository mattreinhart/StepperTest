// Adafruit Motor shield library
// copyright Adafruit Industries LLC, 2009
// this code is public domain, enjoy!

#include <AFMotor.h>

AF_Stepper motor(48, 2);

void setup() {
  Serial.begin(115200);    // set up Serial library at 115200 bps
  Serial.println("Step to the beat!");

  motor.setSpeed(30);  // 100 rpm   
}

char val;

void loop() {
if(Serial.available())
  {
    val = Serial.read();
  
    if(val == 'R'){
      motor.step(1, FORWARD, SINGLE);
      Serial.println("Stepping right.");
    
    } else if(val == 'L'){
      motor.step(1, BACKWARD, SINGLE);
      Serial.println("Stepping left.");
    }
    
  } else {
    motor.release();
  }
}
