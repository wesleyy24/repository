int value = 0;
int X = 0;
int Y = 0;
void draw() {
  if (X != 0 & Y != 0){
  square(X, Y, 10);
  }
}
void mouseMoved(){
  X = mouseX;
  Y = mouseY;
  println(mouseX, mouseY);
}
