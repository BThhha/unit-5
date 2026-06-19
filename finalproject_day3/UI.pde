void drawHUD(int score, int lives, int combo) {

  fill(0);
  textSize(18);

  text("Score: " + score, 20, 30);
  text("Lives: " + lives, 20, 55);
  text("Combo: " + combo, 20, 80);
}

void drawMenu() {

  background(180, 220, 255);

  fill(0);
  textAlign(CENTER);

  textSize(40);
  text("POLICE VS THIEF", width/2, 180);

  textSize(20);
  text("Press ENTER to start", width/2, 240);

  textAlign(LEFT);
}

void drawWinScreen(int score) {

  background(120, 255, 120);

  fill(0);
  textAlign(CENTER);

  textSize(40);
  text("YOU WIN", width/2, 200);

  textSize(20);
  text("Score: " + score, width/2, 250);

  text("Press R to restart", width/2, 300);

  textAlign(LEFT);
}

void drawLoseScreen(int score) {

  background(255, 120, 120);

  fill(0);
  textAlign(CENTER);

  textSize(40);
  text("GAME OVER", width/2, 200);

  textSize(20);
  text("Score: " + score, width/2, 250);

  text("Press R to restart", width/2, 300);

  textAlign(LEFT);
}

void drawDistanceBar(Player p) {

  fill(220);
  rect(250, 20, 500, 12);

  float ratio = constrain(p.distance / 1000.0, 0, 1);

  fill(0, 0, 255);
  rect(250, 20, 500 * (1 - ratio), 12);

  fill(255, 0, 0);
  rect(250 + 500 * (1 - ratio), 20, 500 * ratio, 12);
}
