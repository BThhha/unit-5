void drawPause() {
  background(80, 80, 120);
  fill(255);
  textSize(50);
  text("PAUSED", 400, 300);
  textSize(20);
  text("Click to resume", 400, 400);
  text("Press R to restart", width/2, height/2 + 100);
}

void clickPause() {
  gameMode = MODE_GAME;
  if (theme != null) theme.play();
}
