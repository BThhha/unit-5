void drawSettings() {
  background(40, 60, 70);
  fill(255);
  textSize(40);
  text("SETTINGS", width/2, 100);
  textSize(20);
  text("Ball speed: " + abs(round(targetVx)), width/2, 200);
  text("Circle size: " + round(targetSize), width/2, 260);
  text("Score: " + playerScore, width/2, 320);
  textSize(16);
  fill(200, 255, 200);
  text("Press Q to go back", width/2, 450);
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
