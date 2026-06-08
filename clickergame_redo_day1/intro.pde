void drawIntro() {
  background(50, 80, 120);  // dark blue
  
  fill(255);
  textSize(50);
  text("CLICKER GAME", width/2, height/2 - 200);
  
  
  // START button (tactile)
  tactileButton(400, 500, 160, 50, 1);
  fill(255);
  textSize(18);
  text("START", width/2, height/2 + 105);
  
  // OPTIONS button (tactile)
  tactileButton(400,  570, 160, 50, 2);
  fill(255);
  text("OPTIONS", width/2, height/2 + 175);
  
  // SETTINGS button (tactile)
  tactileButton(400, 640, 160, 50, 3);
  fill(255);
  text("SETTINGS", width/2, height/2 + 245);
  
  textSize(14);
  fill(200, 255, 200);
  text("Press R to restart anytime", width/2, height/2 + 320);
}

void clickIntro() {
  if (hoverButton == 1) {
    gameMode = MODE_GAME;
    resetGame();
  }
  if (hoverButton == 2) {
    gameMode = MODE_OPTIONS;
  }
  if (hoverButton == 3) {
    gameMode = MODE_SETTINGS;
  }
}
