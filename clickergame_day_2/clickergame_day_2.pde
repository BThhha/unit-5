int gameMode;
final int MODE_INTRO = 0;
final int MODE_GAME = 1;
final int MODE_PAUSE = 2;
final int MODE_GAMEOVER = 3;
final int MODE_OPTIONS = 4;
final int MODE_SETTINGS = 5;

float targetX, targetY;
float targetVx, targetVy;
float targetSize = 100;

int playerScore = 0;
int missCount = 0;
int maxMisses = 5;   // ← declared only ONCE

void setup() {
  size(800, 800);
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  gameMode = MODE_INTRO;
}

void draw() {
  if (gameMode == MODE_INTRO) drawIntro();
  else if (gameMode == MODE_GAME) drawGame();
  else if (gameMode == MODE_PAUSE) drawPause();
  else if (gameMode == MODE_GAMEOVER) drawGameOver();
  else if (gameMode == MODE_OPTIONS) drawOptions();
  else if (gameMode == MODE_SETTINGS) drawSettings();
}
