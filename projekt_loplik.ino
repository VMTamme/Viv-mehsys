#include <OneWire.h>
#include <DallasTemperature.h>

#define ONE_WIRE_BUS 7

OneWire oneWire(ONE_WIRE_BUS);

DallasTemperature sensors(&oneWire);
int ventikas = 3;
float T = 25;
float Celcius=0;
int sisendBait;
 
void setup(void){
  Serial.begin(9600);
  sensors.begin();
}

void loop(void){ 
  sensors.requestTemperatures(); 
  Celcius = sensors.getTempCByIndex(0);
  Serial.println(Celcius);
  delay(100);
  if(Serial.available()>0){
    sisendBait = Serial.read();
    if(sisendBait == 'A'){
      T = 23.5;
    } else if(sisendBait == 'B'){
      T = 24;
    } else if(sisendBait == 'C'){
      T = 24.5;
    } else if(sisendBait == 'D'){
      T = 25;
    } else if(sisendBait == 'E'){
      T = 25.5;
    } else if(sisendBait == 'F'){
      T = 26;
    }
    
    if (Celcius > T){
      analogWrite (ventikas,255);
    } else {
      analogWrite (ventikas,1);
    }
  }
}
