import processing.sound.*;

SoundFile file;

void setup() {
  file = new SoundFile(this, "arcade.wav");
  file.rate(2);
  file.amp(0.5);
  file.play();
}    
