// Modes
int mode;
final int INTRO = 0, GAME = 1, PAUSE = 2, GAMEOVER = 3;


// Colors
color orangeyellow = color(20, 10, 35);
color darkblue = color(10, 20, 50);
color lightblue = color(50, 100, 200);
color white = color(255);
color red = color(255, 50, 50);
color orange = color(255, 150, 50);
color yellow = color(255, 255, 50);
color green = color(50, 255, 50);
color blue = color(50, 150, 255);
color purple = color(200, 50, 255);
color pink = color(255, 100, 150);

// Paddle
float px, py;
float pd = 40;
float paddleSpeed = 8;

// Ball
float bx, by;
float bd = 16;
float vx, vy;
float ballSpeed = 5;

// Bricks
int rows = 5;
int cols = 7;
float brickd = 45;
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

// GIF animation
PImage[] gifFrames;
int gifIndex = 0;


void setup() {
  size(800, 700);
  mode = INTRO;
  
  // Initialize bricks array
  bricks = new float[rows][cols];
  
  // Load sounds
  minim = new Minim(this);
  introMusic = minim.loadFile("intro.mp3");
  bounceSound = minim.loadFile("bounce.mp3");
  scoreSound = minim.loadFile("score.mp3");
  winSound = minim.loadFile("win.mp3");
  loseSound = minim.loadFile("lose.mp3");
  
  // Load GIF frames (put frame1.png, frame2.png etc in data folder)
  gifFrames = new PImage[8];
  for (int i = 0; i < 8; i++) {
    gifFrames[i] = loadImage("frame" + (i+1) + ".png");
  }
  
  resetGame();
}

void resetGame() {
  // Reset paddle
  px = width/2;
  py = height - 60;
  
  // Reset ball
  bx = width/2;
  by = height - 100;
  vx = random(-3, 3);
  vy = -ballSpeed;
  if (abs(vx) < 1) vx = 2;
  
  // Reset bricks
  float startX = (width - (cols * brickd) - (cols - 1) * 5) / 2;
  float startY = 80;
  float gapX = 5;
  float gapY = 5;
  totalBricks = 0;
  
  for (int row = 0; row < rows; row++) {
    for (int col = 0; col < cols; col++) {
      bricks[row][col] = 1;
      totalBricks++;
    }
  }
  
  // Reset score and lives
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
