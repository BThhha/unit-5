void drawGame() {
  background(darkblue);
 
}


void resetBallPosition() {
  
}

void playBounce() {
  if (bounceSound != null) {
    bounceSound.rewind();
    bounceSound.play();
  }
}

void playScore() {
  if (scoreSound != null) {
    scoreSound.rewind();
    scoreSound.play();
  }
}

void playWin() {
  if (winSound != null) {
    winSound.rewind();
    winSound.play();
  }
}

void playLose() {
  if (loseSound != null) {
    loseSound.rewind();
    loseSound.play();
  }
}
