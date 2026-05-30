void drawIntro() {
  background(50, 80, 120);
  fill(255);
  textSize(50);
  text("CLICKER GAME", width/2, height/2 - 150);
  textSize(20);
  
  fill(200, 255, 200);
  text("Press O for Options", width/2, height/2 + 150);
  text("Press S for Settings", width/2, height/2 + 180);
  text("Click anywhere to start", width/2, height/2 + 230);
}

void clickIntro() {
  gameMode = MODE_GAME;
  resetGame();
}
