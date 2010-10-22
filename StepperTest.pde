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

    int number = read_serial();
    
    if (number > 0){
      motor.step(number, FORWARD, SINGLE);
      Serial.println("Stepping right.");
    
    } else if (number < 0) {
      number *= -1;
      motor.step(number, BACKWARD, SINGLE);
      Serial.println("Stepping left.");
    }
    
    motor.release();
}

int read_serial(){
  if(Serial.available())
  {
    val = Serial.read();
  
    int number = 0;
    
    if(val == 'R'){
      
      do{
        if(Serial.available())
        {
          val = Serial.read();
          
          if (val != ';'){
            number *= 10;
            number += atoi(&val);
          }
        }
      } while (val != ';');
    
    } else if(val == 'L'){
            
      do{
        if(Serial.available())
        {
          val = Serial.read();
          
          if (val != ';'){
            number *= 10;
            number += atoi(&val);
          }
        }
      } while (val != ';');
    
    }
    
    return number;
    
  } else {
    return 0;
  }
}

