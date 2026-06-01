int mode;
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;

//type
int gameType = 1;
boolean vsAI = true;

//paddle
float leftPaddleY, rightPaddleY;
float paddleSize = 100;
float paddleSpeed = 7;

float aiSpeed = 3.5;

boolean upPressed = false;
boolean downPressed = false;
boolean wPressed = false;
boolean sPressed = false;

//ball
float ballX, ballY;
float ballSize = 20;
float ballVx, ballVy;
float ballSpeed = 5;

//score
int leftScore = 0;
int rightScore = 0;
int winScore = 3;

//game
int ballWait = 0;
boolean ballMoving = false;

//color
color bgColor = color(0, 0, 40);
color paddleColor = color(255, 0, 0);  // RED
color ballColor = color(255, 200, 100);
color textColor = color(255);

void setup() {
  size(800, 600);
  mode = INTRO;
  resetGame();
}

void draw() {
  if (mode == INTRO) {
    drawIntro();
  } else if (mode == GAME) {
    drawGame();
  } else if (mode == PAUSE) {
    drawPause();
  } else if (mode == GAMEOVER) {
    drawGameOver();
  }
}
