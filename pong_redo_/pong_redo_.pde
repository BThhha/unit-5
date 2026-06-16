import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer theme, coin, bump, gameover;

int mode;
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;

//type
int gameType = 1;
boolean vsAI = true;

//paddle 
float leftPaddleX = 10;
float leftPaddleY;
float rightPaddleX;
float rightPaddleY;
float paddleRadius = 30;
float paddleSpeed = 7;

float aiSpeed = 3.5;

boolean upPressed = false;
boolean downPressed = false;
boolean wPressed = false;
boolean sPressed = false;

//ball
float ballX, ballY;
float ballRadius = 10;
float ballVx, ballVy;
float ballSpeed = 5;


float titleY = 200;
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

float as= 10;

void setup() {
  size(800, 600);
  rightPaddleX = width - 10;
  mode = INTRO;
  resetGame();
  
  minim = new Minim(this);
  theme = minim.loadFile("theme1.mp3");
  coin = minim.loadFile("coin1.mp3");
  bump = minim.loadFile("bump1.mp3");
  gameover = minim.loadFile("gameover1.mp3");
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
