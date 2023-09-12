int value = 0;
void draw() {}
void keyPressed() {  
  if (keyCode == 32){
  if (millis() > 10000){println("stop met tellen, tijd afgelopen. aantal: ", value);return;}
  value++;
  println("spatie ingedrukt, nu:", value);
  }
}
