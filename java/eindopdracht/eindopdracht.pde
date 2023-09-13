boolean gameStarted = false;
int targetX, targetY;
int score = 0;
int totalTime = 0;      // Totaaltijd per ronde
int startTime = 0;
int lifeTime = 20000;   // Lengte minigame in milliseconden
int personalRecord = 0; // Persoonlijk record
Boolean outoftime = false;
int elapsedTime = 0;
int lastRecord = 0;
Boolean firstTime = true;
String difficulty = "Normal";
Boolean refreshUI = false;
Boolean endScreen = false;

void setLifetime(){
  if (difficulty == "Easy"){
    lifeTime = 30000;
  } else if (difficulty == "Normal"){
    lifeTime = 20000;
  } else if (difficulty == "Hard"){
    lifeTime = 10000;
  } 
}


void setup() {
  size(800, 600);
  background(255);
  targetX = width / 2;
  targetY = height / 2;
   cursor(CROSS);
}

void draw() {
  if (refreshUI) {
     background(255);
    refreshUI = false;
    println("refresh");
   } else if (!gameStarted) {
     background(255);
    displayStartScreen();
  } else {
    background(255);
    displayTarget();
    displayScore();
    checkClick();
  }
}

void keyPressed() {
  println(keyCode);
    if (keyCode == 69 && endScreen) {
    firstTime = true;
    endScreen = false;
    background(255);
    displayStartScreen();
    return;
  }
  if (keyCode == 69 && !gameStarted) {
    changeDifficulty();
  }
  if (key == 32 && !gameStarted) {
    startNewLevel();
  }
}

void changeDifficulty(){
  println("Change difficulty, current: " + difficulty);
  if (difficulty == "Easy"){
    difficulty = "Normal";
  } else if (difficulty == "Normal"){
    difficulty = "Hard";
  } else if (difficulty == "Hard"){
    difficulty = "Easy";
  }
  refreshUI = true;
}

void startNewLevel() {
  firstTime = false;
  println("should start game");
  if (!gameStarted) {
   gameStarted = true;
      score = 0;
      totalTime = 0;
     startTime = millis();
     outoftime = false;
     setLifetime();
    newTarget();
   
  }
}

void displayStartScreen() {
  fill(0);
  textAlign(CENTER, CENTER);
  
  if (score > 0 & !firstTime){
      text("Je score: " + score, width / 2, height / 2.6);
  }
  if (personalRecord > lastRecord & !firstTime){
      text("Nieuw record! " + personalRecord, width / 2, height / 2.3);
  }
  if (firstTime) {
    textSize(50);
        text("USO", width / 2, height / 2.6);
        textSize(25);
    text("Druk op 'E' om moeilijkheid te veranderen.", width / 2, height / 1.7);
    text("Moeilijkheid: " + difficulty, width / 2, height / 1.4);
    text("Druk op 'Spatie' om te beginnen", width / 2, height / 2);
  } else {
    text("Druk op 'Spatie' om opnieuw te spelen op moeilijkheid " + difficulty, width / 2, height / 2);
    text("Druk op 'E' om naar beginscherm te gaan.", width / 2, height / 1.7);
  }
    
}

int R = 255;
int G = 0;
int B = 0;

void generateRandomColor(){
  float randomNum = round(random(1,5));
  println(randomNum);
  if (randomNum == 1){
    R = 255;
    G = 0;
    B = 0;
  } else if (randomNum == 2){
    R = 0;
    G = 0;
    B = 255;
  } else if (randomNum == 3){
    R = 0;
    G = 255;
    B = 0;
  } else if (randomNum == 4){
    R = 255;
    G = 0;
    B = 255;
  } else if (randomNum == 5){
    R = 0;
    G = 255;
    B = 255;
  }
}

void displayTarget() {
  println(R,G,B);
  fill(R, G, B);
  ellipse(targetX, targetY, 50, 50);
}

void displayScore() {
  fill(0);
  textSize(24);
  text("Score: " + score, 70, 30);
  int remainingTime =  lifeTime - elapsedTime;
  text("Tijd: " + remainingTime / 1000 + " s", 70, 60);
  text("Persoonlijk Record: " + personalRecord + " s", width - 200, 30);
}

void newTarget() {
   generateRandomColor();
  targetX = int(random(50, width - 50));
  targetY = int(random(50, height - 50));
}

void checkClick() {
  float distance = dist(mouseX, mouseY, targetX, targetY);
  updateTimer();
  if (distance < 25) {
    if (!outoftime) {
      score++;
      newTarget();
    } else {
      gameStarted = false;
    }
  }
}

void updateTimer() {
    int currentTime = millis();
    elapsedTime = (currentTime - startTime);
     if (elapsedTime >= lifeTime) {
       elapsedTime = 0;
       gameStarted = false;
       endScreen = true;
       lastRecord = personalRecord;
  if ( score > personalRecord) {
        personalRecord = score;
   }
    displayStartScreen();
  }
}
