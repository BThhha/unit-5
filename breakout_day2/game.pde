void drawGame() {
  background(darkblue);
 
  }
  
  // Draw bricks with different colors per row
  float startX = (width - (cols * brickd) - (cols - 1) * 5) / 2;
  float startY = 80;
  float gapX = 5;
  float gapY = 5;
  
  // Draw paddle
  fill(white);
  circle(px, py, pd);
  
  // Draw ball
  fill(white);
  circle(bx, by, bd);
  
  // Draw UI
  fill(white);
  textSize(20);
  textAlign(LEFT);
  text("Score: " + score, 20, 40);
  text("Lives: ", 20, 70);
  for (int i = 0; i < lives; i++) {
    fill(red);
    circle(100 + i * 25, 62, 12);
  }
  
  // Instructions
  textSize(12);
  fill(200);
  textAlign(CENTER);
  text("Click to pause", width/2, height - 15);
  
  // Move paddle
  if (leftPressed && px - pd/2 > 0) px -= paddleSpeed;
  if (rightPressed && px + pd/2 < width) px += paddleSpeed;
  
  // Move ball
  bx += vx;
  by += vy;
  
  // Ball collision with walls
  if (bx - bd/2 <= 0 || bx + bd/2 >= width) {
    vx = -vx;
    playBounce();
  }
  if (by - bd/2 <= 0) {
    vy = -vy;
    playBounce();
  }
  
  // Ball collision with paddle
  if (dist(bx, by, px, py) < bd/2 + pd/2 && vy > 0) {
    float angle = map(bx - px, -pd/2, pd/2, -PI/3, PI/3);
    float speed = sqrt(vx*vx + vy*vy);
    vx = sin(angle) * speed;
    vy = -cos(angle) * speed;
    if (abs(vx) < 2) vx = vx > 0 ? 2 : -2;
    playBounce();
  }
     
  
  // Check win
  if (totalBricks == 0 && !gameWon) {
    gameWon = true;
    playWin();
    mode = GAMEOVER;
  }
  
 
}

void resetBallPosition() {
  bx = width/2;
  by = height - 100;
  vx = random(-3, 3);
  vy = -ballSpeed;
  if (abs(vx) < 1) vx = 2;
  px = width/2;
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
