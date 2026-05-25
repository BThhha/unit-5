void mouseReleased() {
  if (gameMode == MODE_INTRO) clickIntro();
  else if (gameMode == MODE_GAME) clickGame();
  else if (gameMode == MODE_PAUSE) clickPause();
  else if (gameMode == MODE_GAMEOVER) clickGameOver();
  else if (gameMode == MODE_OPTIONS) clickOptions();
  else if (gameMode == MODE_SETTINGS) clickSettings();
}
