void drawGameOver() {
  background(120, 30, 30);
  fill(255);
  textSize(50);
  text("GAME OVER", width/2, height/2 - 100);
  textSize(30);
  text("Score: " + playerScore, width/2, height/2 - 20);
  textSize(20);
  text("Click to play again", width/2, height/2 + 80);
  text("Press R for main menu", width/2, height/2 + 130);
}

void clickGameOver() {
  gameMode = MODE_INTRO;
}
