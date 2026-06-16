void drawSettings() {
  background(40, 60, 70);
  fill(255);
  textSize(40);
  text("SETTINGS", 400, 100);
  textSize(20);
  text("Ball speed: " + abs(round(tgVx)), 400, 200);
  text("Circle size: " + round(targetSize), 400, 260);
  text("Score: " + playerScore, 400, 320);
  textSize(16);
  fill(200, 255, 200);
  text("Press Q to go back", 400, 450);
}

void clickSettings() {}

void stop() {
  if (theme != null) {
    theme.close();
  }
  if (coin != null) {
    coin.close();
  }
  if (bump != null) {
    bump.close();
  }
  if (gameover != null) {
    gameover.close();
  }
  if (minim != null) {
    minim.stop();
  }
  super.stop();
}
