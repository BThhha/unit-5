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
