void drawIntro() {
  background(50, 80, 120);  // dark blue
  
  fill(255);
  textSize(50);
  text("CLICKER GAME", 400, 150);
  
  
  // START button
  tactileButton(400, 500, 160, 50, 1);
  fill(255);
  textSize(18);
  text("START", 400, 505);
  
  // OPTIONS button 
  tactileButton(400,  570, 160, 50, 2);
  fill(255);
  text("OPTIONS", 400, 575);
  
  // SETTINGS button 
  tactileButton(400, 640, 160, 50, 3);
  fill(255);
  text("SETTINGS", 400, 645);
  
  textSize(14);
  fill(200, 255, 200);
  text("Press R to restart anytime", 400, 700);
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
