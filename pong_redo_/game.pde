void drawGame() {
  background(bgColor);
  
  
  noStroke();
  fill(paddleColor);
  
  // Left paddle 
  circle(leftPaddleX, leftPaddleY, 120);
  
  // Right paddle 
  circle(rightPaddleX, rightPaddleY, 120);
  
  fill(ballColor);
  circle(ballX, ballY, 20);
  
  textSize(48);
  fill(textColor);
  textAlign(CENTER, CENTER);
  text(leftScore, 200, 60);
  text(rightScore, 600, 60);
  
  if (ballMoving) {
    updateBall();
  } else {
    ballWait--;
    if (ballWait <= 0) {
      serveBall();
    }
  }
  
  updatePaddles();
  
  textSize(12);
  fill(150);
  text("Click to pause", 400, 585);
}

void updatePaddles() {
  // Left paddle 
  if (wPressed && leftPaddleY - 60 > 0) leftPaddleY -= paddleSpeed;
  if (sPressed && leftPaddleY + 60 < 600) leftPaddleY += paddleSpeed;
  
  // Right paddle
  if (gameType == 1) {
    // AI control
    if (ballMoving && ballVx > 0) {
      if (rightPaddleY < ballY) rightPaddleY += aiSpeed;
      if (rightPaddleY > ballY) rightPaddleY -= aiSpeed;
    }
    rightPaddleY = constrain(rightPaddleY, 30, 600 - 30);
  } else {
    // Two player
    if (upPressed && rightPaddleY - 30 > 0) rightPaddleY -= paddleSpeed;
    if (downPressed && rightPaddleY + 30 < 600) rightPaddleY += paddleSpeed;
  }
}

void updateBall() {
  ballX += ballVx;
  ballY += ballVy;
  
  // Wall collision 
  if (ballY - 10 <= 0 || ballY + 10 >= 600) {
    ballVy = ballVy * -1;
  }
  
  // Collision with left paddle
  float leftPaddleCenterX = leftPaddleX;  
  float d = dist(ballX, ballY, leftPaddleCenterX, leftPaddleY);
  
  if (d < 70) {  
    bump.play();
    // Bounce based on hit position
    ballVx = (ballX - leftPaddleX) / 4;
    ballVy = (ballY - leftPaddleY) / 4;
    
    
    //if (ballVx < 0) ballVx = -ballVx;
    
    // Speed up
    //ballSpeed = ballSpeed + 0.3;
    //ballVx = ballVx * (ballSpeed / 3);
    //ballVy = ballVy * (ballSpeed / 3);
  }
  
  // Collision with right paddle 
  float rightPaddleCenterX = rightPaddleX;  
  d = dist(ballX, ballY, rightPaddleCenterX, rightPaddleY);
  
  if (d < 70) {  
    bump.rewind();
    bump.play();
    
    // Bounce 
    ballVx = (ballX - rightPaddleX) / 4;
    ballVy = (ballY - rightPaddleY) / 4;
    
    //if (ballVx > 0) ballVx = -ballVx;
    
    // Speed up
    //ballSpeed = ballSpeed + 0.3;
    //ballVx = ballVx * (ballSpeed / 3);
    //ballVy = ballVy * (ballSpeed / 3);
  }
  
  // Score points
  if (ballX + 10 <= 0) {  
    rightScore++;coin.rewind();coin.play();resetBall();checkWin();
  }
  
  if (ballX - 10 >= 800) {
    leftScore++;coin.rewind();coin.play();resetBall();checkWin();
  }
}

void checkWin() {
  if (leftScore >= winScore || rightScore >= winScore) {gameover.rewind();gameover.play();mode = GAMEOVER;
  }
}

void serveBall() {
  ballMoving = true;
  ballX = 400;      
  ballY = 300;     
  ballSpeed = 5;
  
  // Random direction
  ballVx = random(2, 4);
  ballVy = random(-3, 3);
  
  //if (random(1) > 0.5) ballVx = -ballVx;
}

void resetBall() {
  ballMoving = false;
  ballWait = 60;
  ballX = 400;
  ballY = 300;
}

void resetPositions() {
  leftPaddleY = 300;   
  rightPaddleY = 300;  
}

void resetGame() {
  leftScore = 0;
  rightScore = 0;
  resetPositions();
  resetBall();
  ballSpeed = 5;
}
