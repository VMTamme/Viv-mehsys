import processing.serial.*;

boolean mouseOverBox = false;

float Temp = 24.5;
float output;

Serial port;
String val;
float nr = 0;

void settings(){
  size(1000, 750);
}

void setup(){
  rectMode(CORNER);
  
  port = new Serial(this, Serial.list()[4], 9600);
  
}

void draw(){
  background(80); //üldine tausta värv
  color c_box = color(215, 215, 215); //helehall
  fill(c_box);
  rect(150, 50, 200, 200, 7);
  rect(400, 50, 200, 200, 7);
  rect(650, 50, 200, 200, 7);
  rect(150, 300, 200, 200, 7);
  rect(400, 300, 200, 200, 7);
  rect(650, 300, 200, 200, 7);
  //c_box = color(255, 225, 130); //helekollane
  //c_box = color(220, 255, 175); //heleroheline
  c_box = color(220, 255, 250); //helesinine
  fill(c_box);
  rect(200, 550, 600, 150, 7);
  
  /*
  Ülemised kastid on A (23.5), B (24), C (24.5)
  Alumised kastid on D (25), E (25.5), F (26)
  Sulgudes on märgitud temperatuur
  */
  
  // tekst kastides
  textSize(40);
  fill(65);
  textAlign(CENTER, CENTER);
  text("23.5", 250, 150);
  textAlign(CENTER, CENTER);
  text("24", 500, 150);
  textAlign(CENTER, CENTER);
  text("24.5", 750, 150);
  textAlign(CENTER, CENTER);
  text("25", 250, 400);
  textAlign(CENTER, CENTER);
  text("25.5", 500, 400);
  textAlign(CENTER, CENTER);
  text("26", 750, 400);
  textSize(34);
  fill(0, 100, 125);
  textAlign(LEFT, CENTER);
  text("Temperatuur: ", 250, 600); 
  
  
  if (port.available() > 0) {
  val = port.readStringUntil('\n');
  }
  
  if (val != null){
    val = trim(val);
    nr = float(val);
    println(val);
    textAlign(RIGHT, CENTER);
    text(val, 750, 600);
  }
  
  textAlign(LEFT, CENTER);
  text("Max temp: ", 250, 650); 
  textAlign(RIGHT, CENTER);
  text(Temp, 750, 650);

  
  if (mouseX > 150 && mouseX < 350){
    if(mouseY > 50 && mouseY < 250){
      mouseOverBox = true;
      Temp = 23.5;
      port.write('A');
    } else if (mouseY > 300 && mouseY < 500){
      mouseOverBox = true;
      Temp = 25;
      port.write('D'); 
    }
    
  } else if (mouseX > 400 && mouseX < 600){
    if (mouseY > 50 && mouseY < 250){
      mouseOverBox = true;
      Temp = 24;
      port.write('B'); 
    } else if (mouseY > 300 && mouseY < 500){
      mouseOverBox = true;
      Temp = 25.5;
      port.write('E'); 
    }
    
  } else if (mouseX > 650 && mouseX < 850){
    if (mouseY > 50 && mouseY < 250){
      mouseOverBox = true;
      Temp = 24.5;
      port.write('C');
    } else if (mouseY > 300 && mouseY < 500){
      mouseOverBox = true;
      Temp = 26;
      port.write('F');
    }
  }  

}
