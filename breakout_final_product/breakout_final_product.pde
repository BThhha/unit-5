// Modes
int mode;
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;

// Colors
color darkblue = color(10, 20, 50);
color lightblue = color(50, 100, 200);
color white = color(255);
color red = color(255, 50, 50);
color orange = color(255, 150, 50);
color yellow = color(255, 255, 50);
color green = color(50, 255, 50);
color blue = color(50, 150, 255);

// Paddle
float px, py;
float pd = 150;
float paddleSpeed = 8;

// Ball
float bx, by;
float bd = 16;
float vx, vy;
float ballSpeed = 5;

// Bricks
int rows = 5;
int cols = 7;
float bbr = 45;
float[][] bricks;
int totalBricks = 0;
int score = 0;

// Lives
int lives = 3;
int maxLives = 3;

// Game state
boolean leftPressed = false;
boolean rightPressed = false;
boolean gameWon = false;

// Sound files
import ddf.minim.*;
Minim minim;
AudioPlayer introMusic;
AudioPlayer bounceSound;
AudioPlayer scoreSound;
AudioPlayer winSound;
AudioPlayer loseSound;

void setup() {
  size(800, 700);
  mode = INTRO;
  
  bricks = new float[rows][cols];
  
  minim = new Minim(this);
  introMusic = minim.loadFile("intro.mp3");
  bounceSound = minim.loadFile("bounce.mp3");
  scoreSound = minim.loadFile("score.mp3");
  winSound = minim.loadFile("win.mp3");
  loseSound = minim.loadFile("lose.mp3");
  
  resetGame();
}

void resetGame() {
  py=700;
  px=400;
  
  bx = 400;
  by = 600;
  vx = random(-3, 3);
  vy = -5;
  
  
  totalBricks = 0;
  for (int row = 0; row < rows; row++) {
    for (int col = 0; col < cols; col++) {
      bricks[row][col] = 1;
      totalBricks++;
    }
  }
  
  score = 0;
  lives = maxLives;
  gameWon = false;
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
