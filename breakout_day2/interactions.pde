void mousePressed() {
  if (mode == INTRO) {
    clickIntro();
  } else if (mode == GAME) {
    mode = PAUSE;
  } else if (mode == PAUSE) {
    mode = GAME;
  } else if (mode == GAMEOVER) {
    clickGameOver();
  }
}

void keyPressed() {
  if (mode == GAME) {
    if (key == 'a' || key == 'A') leftPressed = true;
    if (key == 'd' || key == 'D') rightPressed = true;
  }
}

void keyReleased() {
  if (mode == GAME) {
    if (key == 'a' || key == 'A') leftPressed = false;
    if (key == 'd' || key == 'D') rightPressed = false;
  }
}
