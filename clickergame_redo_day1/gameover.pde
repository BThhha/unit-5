void drawGameOver() {
  background(120, 30, 30);  // dark red
  fill(255);
  textSize(50);
  text("GAME OVER", width/2, height/2 - 100);
  textSize(30);
  text("Score: " + playerScore, width/2, height/2 - 20);
  textSize(20);
  text("Click to play again", width/2, height/2 + 80);
}

void clickGameOver() {
  gameMode = MODE_INTRO;
}
