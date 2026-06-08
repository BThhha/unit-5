void drawIntro() {
  background(bgColor);
  
  if (!theme.isPlaying()) {
    theme.play();
    theme.loop();
  }
  float titleY = height/3 + random(-4,4);
  fill(textColor);
  textSize(60);
  textAlign(CENTER, CENTER);
  text("PONG", width/2, titleY);
  

  
  if (mouseX > width/2 - 130 && mouseX < width/2 - 10 &&
      mouseY > height/2 + 80 && mouseY < height/2 + 130) {
    fill(#FF6666);
    strokeWeight(4);
  } else {
    fill(#FF0000);
    strokeWeight(1);
  }
  stroke(255);
  rect(width/2 - 130, height/2 + 80, 120, 50, 10);
  fill(255);
  textSize(18);
  text("1 PLAYER", width/2 - 70, height/2 + 105);
  
  if (mouseX > width/2 + 10 && mouseX < width/2 + 130 &&
      mouseY > height/2 + 80 && mouseY < height/2 + 130) {
    fill(#6666FF);
    strokeWeight(4);
  } else {
    fill(#0000FF);
    strokeWeight(1);
  }
  stroke(255);
  rect(width/2 + 10, height/2 + 80, 120, 50, 10);
  fill(255);
  text("2 PLAYER", width/2 + 70, height/2 + 105);
  
 
}

void clickIntro() {
  if (mouseX > width/2 - 130 && mouseX < width/2 - 10 &&
      mouseY > height/2 + 80 && mouseY < height/2 + 130) {
    vsAI = true;
    gameType = 1;
    startGame();
  }
  if (mouseX > width/2 + 10 && mouseX < width/2 + 130 &&
      mouseY > height/2 + 80 && mouseY < height/2 + 130) {
    vsAI = false;
    gameType = 2;
    startGame();
  }
}

void startGame() {
  mode = GAME;
  resetPositions();
  resetBall();
  leftScore = 0;
  rightScore = 0;
  ballMoving = false;
  ballWait = 60;
  ballSpeed = 5;
  
  theme.pause();
}
