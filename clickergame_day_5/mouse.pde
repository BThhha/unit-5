void mouseReleased() {
  if (gameMode == MODE_INTRO) clickIntro();
  else if (gameMode == MODE_GAME) clickGame();
  else if (gameMode == MODE_PAUSE) clickPause();
  else if (gameMode == MODE_GAMEOVER) clickGameOver();
  else if (gameMode == MODE_OPTIONS) clickOptions();
  else if (gameMode == MODE_SETTINGS) clickSettings();
}
void keyPressed() {
  if (key == 'p' || key == 'P') {
    if (gameMode == MODE_GAME) gameMode = MODE_PAUSE;
    else if (gameMode == MODE_PAUSE) gameMode = MODE_GAME;
  }
  if (key == 'o' || key == 'O') {
    if (gameMode == MODE_GAME || gameMode == MODE_INTRO) gameMode = MODE_OPTIONS;
  }
  if (key == 's' || key == 'S') {
    if (gameMode == MODE_GAME || gameMode == MODE_INTRO) gameMode = MODE_SETTINGS;
  }
  if (key == 'r' || key == 'R') gameMode = MODE_INTRO;
  if (key == 'q' || key == 'Q') {
    if (gameMode == MODE_OPTIONS || gameMode == MODE_SETTINGS) gameMode = MODE_INTRO;
  }
  
  if (gameMode == MODE_OPTIONS) {
    if (keyCode == UP) {
      maxMisses = maxMisses + 1;
      if (maxMisses > 10) maxMisses = 10;
    }
    if (keyCode == DOWN) {
      maxMisses = maxMisses - 1;
      if (maxMisses < 2) maxMisses = 2;
    }
  }
}
