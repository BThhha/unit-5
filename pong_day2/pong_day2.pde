int mode;
final int INTRO = 0;
final int GAME = 1;

// ========== BALL VARIABLES ==========
float ballX, ballY;
float ballSize = 20;
float ballVx, ballVy;
float ballSpeed = 5;

// ========== COLORS ==========
color bgColor = color(0, 0, 40);
color ballColor = color(255, 200, 100);
color textColor = color(255);

void setup() {
  size(800, 600);
  mode = INTRO;
}

void draw() {
  if (mode == INTRO) {
    drawIntro();
  } else if (mode == GAME) {
    drawGame();
  }
}

// ========== INTRO MODE ==========
void drawIntro() {
  background(bgColor);
  
  float titleY = height/3 + sin(frameCount * 0.03) * 10;
  fill(textColor);
  textSize(60);
  textAlign(CENTER, CENTER);
  text("PONG", width/2, titleY);
  
  textSize(20);
  text("Click to start", width/2, height/2 + 100);
  
  textSize(14);
  fill(200);
  text("Day 1 - Ball only", width/2, height - 40);
}

void clickIntro() {
  mode = GAME;
  startGame();
}

void startGame() {
  ballX = width/2;
  ballY = height/2;
  
  float angle = random(-PI/3, PI/3);
  ballVx = ballSpeed * cos(angle);
  ballVy = ballSpeed * sin(angle);
  
  if (random(1) > 0.5) ballVx = -ballVx;
}

// ========== GAME MODE ==========
void drawGame() {
  background(bgColor);
  
  // Draw center line
  stroke(255, 100);
  strokeWeight(2);
  for (int i = 0; i < height; i += 20) {
    line(width/2, i, width/2, i + 10);
  }
  
  // Draw ball
  fill(ballColor);
  noStroke();
  circle(ballX, ballY, ballSize);
  
  // Move ball
  ballX += ballVx;
  ballY += ballVy;
  
  // Bounce off top and bottom
  if (ballY - ballSize/2 <= 0 || ballY + ballSize/2 >= height) {
    ballVy = -ballVy;
  }
  
  // Reset ball when it goes off left or right
  if (ballX + ballSize/2 <= 0 || ballX - ballSize/2 >= width) {
    startGame();
  }
  
  // Score display (placeholder)
  fill(textColor);
  textSize(48);
  textAlign(CENTER, CENTER);
  text("0", width/4, 60);
  text("0", width * 3/4, 60);
  
  textSize(12);
  fill(150);
  text("Click to pause", width/2, height - 15);
}

// ========== MOUSE HANDLING ==========
void mouseReleased() {
  if (mode == INTRO) {
    clickIntro();
  } else if (mode == GAME) {
    mode = INTRO;
  }
}
