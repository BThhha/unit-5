void drawGame() {
  background(bgColor);
  
  stroke(255, 100);
  strokeWeight(2);
  for (int i = 0; i < height; i += 20) {
    line(width/2, i, width/2, i + 10);
  }
  
  noStroke();
  fill(paddleColor);
  
  arc(20 + paddleSize/2, leftPaddleY + paddleSize/2, paddleSize, paddleSize, -PI/2, PI/2);
  arc(width - 20 - paddleSize/2, rightPaddleY + paddleSize/2, paddleSize, paddleSize, PI/2, PI + PI/2);
  
  fill(ballColor);
  circle(ballX, ballY, ballSize);
  
  textSize(48);
  fill(textColor);
  textAlign(CENTER, CENTER);
  text(leftScore, width/4, 60);
  text(rightScore, width * 3/4, 60);
  
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
  text("Click to pause", width/2, height - 15);
}

void updatePaddles() {
  if (wPressed && leftPaddleY > 0) leftPaddleY -= paddleSpeed;
  if (sPressed && leftPaddleY < height - paddleSize) leftPaddleY += paddleSpeed;
  
  if (gameType == 1) {
    float aiTarget = ballY - paddleSize/2;
    if (ballMoving && ballVx > 0) {
      if (rightPaddleY < aiTarget) rightPaddleY += aiSpeed;
      if (rightPaddleY > aiTarget) rightPaddleY -= aiSpeed;
    }
    rightPaddleY = constrain(rightPaddleY, 0, height - paddleSize);
  } else {
    if (upPressed && rightPaddleY > 0) rightPaddleY -= paddleSpeed;
    if (downPressed && rightPaddleY < height - paddleSize) rightPaddleY += paddleSpeed;
  }
}

void updateBall() {
  ballX += ballVx;
  ballY += ballVy;
  
  if (ballY - ballSize/2 <= 0 || ballY + ballSize/2 >= height) {
    ballVy = -ballVy;
  }
  
  // Collision with left paddle
  if (ballX - ballSize/2 <= 20 + paddleSize && 
      ballX + ballSize/2 >= 20 &&
      ballY + ballSize/2 >= leftPaddleY && 
      ballY - ballSize/2 <= leftPaddleY + paddleSize) {
        
    bump.rewind();
    bump.play();
    
    float hitPos = (ballY - leftPaddleY) / paddleSize;
    float angle = map(hitPos, 0, 1, -PI/3, PI/3);
    float speed = sqrt(ballVx*ballVx + ballVy*ballVy);
    ballVx = abs(cos(angle) * speed);
    ballVy = sin(angle) * speed;
    ballVx = abs(ballVx);
    
    // Speed up during rally
    ballSpeed = ballSpeed + 0.3;
    float currentSpeed = sqrt(ballVx*ballVx + ballVy*ballVy);
    ballVx = (ballVx / currentSpeed) * ballSpeed;
    ballVy = (ballVy / currentSpeed) * ballSpeed;
  }
  
  // Collision with right paddle
  if (ballX + ballSize/2 >= width - 20 - paddleSize && 
      ballX - ballSize/2 <= width - 20 &&
      ballY + ballSize/2 >= rightPaddleY && 
      ballY - ballSize/2 <= rightPaddleY + paddleSize) {
    
    bump.rewind();
    bump.play();
    
    float hitPos = (ballY - rightPaddleY) / paddleSize;
    float angle = map(hitPos, 0, 1, -PI/3, PI/3);
    float speed = sqrt(ballVx*ballVx + ballVy*ballVy);
    ballVx = -abs(cos(angle) * speed);
    ballVy = sin(angle) * speed;
    
    // Speed up during rally
    ballSpeed = ballSpeed + 0.3;
    float currentSpeed = sqrt(ballVx*ballVx + ballVy*ballVy);
    ballVx = (ballVx / currentSpeed) * ballSpeed;
    ballVy = (ballVy / currentSpeed) * ballSpeed;
  }
  
  // Score points
  if (ballX - ballSize/2 <= 0) {
    rightScore++;
    coin.rewind();
    coin.play();
    resetBall();
    checkWin();
  }
  
  if (ballX + ballSize/2 >= width) {
    leftScore++;
    coin.rewind();
    coin.play();
    resetBall();
    checkWin();
  }
}

void checkWin() {
  if (leftScore >= winScore || rightScore >= winScore) {
    gameover.rewind();
    gameover.play();
    mode = GAMEOVER;
  }
}

void serveBall() {
  ballMoving = true;
  ballX = width/2;
  ballY = height/2;
  ballSpeed = 5;  
  
  float angle = random(-PI/4, PI/4);
  ballVx = ballSpeed * cos(angle);
  ballVy = ballSpeed * sin(angle);
  
  if (random(1) > 0.5) ballVx = -ballVx;
}

void resetBall() {
  ballMoving = false;
  ballWait = 60;
  ballX = width/2;
  ballY = height/2;
  // Speed will reset when serveBall() is called after the wait
}

void resetPositions() {
  leftPaddleY = height/2 - paddleSize/2;
  rightPaddleY = height/2 - paddleSize/2;
}

void resetGame() {
  leftScore = 0;
  rightScore = 0;
  resetPositions();
  resetBall();
  ballSpeed = 5;
}
