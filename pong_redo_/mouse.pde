void mouseReleased() {
  if (mode == INTRO) {
    clickIntro();
  } else if (mode == GAME) {
    mode = PAUSE;
  } else if (mode == PAUSE) {
    mode = GAME;
  } else if (mode == GAMEOVER) {
    mode = INTRO;
    resetGame();
  }
}
