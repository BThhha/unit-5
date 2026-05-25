int mode;
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;

// ========== GAME TYPE ==========
int gameType = 1; // 1 = vs AI, 2 = two player
boolean vsAI = true;

// ========== PADDLE VARIABLES ==========
float leftPaddleY, rightPaddleY;
float paddleW = 15;
float paddleH = 100;
float paddleSpeed = 7;

// AI variables
float aiSpeed = 3.5;

// Keyboard booleans for two player
boolean upPressed = false;
boolean downPressed = false;
boolean wPressed = false;
boolean sPressed = false;

// ========== BALL VARIABLES ==========
float ballX, ballY;
float ballSize = 20;
float ballVx, ballVy;
float ballSpeed = 5;

// ========== SCORES ==========
int leftScore = 0;
int rightScore = 0;
int winScore = 3;
