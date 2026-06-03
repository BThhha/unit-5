void stop() {
  if (introMusic != null) introMusic.close();
  if (bounceSound != null) bounceSound.close();
  if (scoreSound != null) scoreSound.close();
  if (winSound != null) winSound.close();
  if (loseSound != null) loseSound.close();
  if (minim != null) minim.stop();
}
