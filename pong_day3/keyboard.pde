void keyPressed() {
  if (mode == GAME) {
    if (key == 'w' || key == 'W') wPressed = true;
    if (key == 's' || key == 'S') sPressed = true;
    if (keyCode == UP) upPressed = true;
    if (keyCode == DOWN) downPressed = true;
  }
}

void keyReleased() {
  if (mode == GAME) {
    if (key == 'w' || key == 'W') wPressed = false;
    if (key == 's' || key == 'S') sPressed = false;
    if (keyCode == UP) upPressed = false;
    if (keyCode == DOWN) downPressed = false;
  }
}
