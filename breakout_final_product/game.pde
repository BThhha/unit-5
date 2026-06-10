void drawGame() {
  background(darkblue);
  
  // Gradient background
  for (int i = 0; i < height; i++) {
    stroke(lerpColor(darkblue, lightblue, map(i, 0, height, 0, 0.3)));
    line(0, i, width, i);
  }
  
  // Draw bricks
  float bbX = (width - (cols * bbr) - (cols - 1) * 5) / 2;
  float bbY = 80;
  float gX = 5;
  float gY = 5;
  
  for (int row = 0; row < rows; row++) {
    for (int col = 0; col < cols; col++) {
      if (bricks[row][col] == 1) {
        if (row == 0) fill(red);
        else if (row == 1) fill(orange);
        else if (row == 2) fill(yellow);
        else if (row == 3) fill(green);
        else fill(blue);
        
        circle(bbX + col * (bbr + gX), bbY + row * (bbr + gY), bbr);
      }
    }
  }
  
  // Draw paddle
  fill(white);
  circle(px, py, pd);
  
  // Draw ball
  fill(white);
  circle(bx, by, bd);
  
  // UI
  fill(white);
  textSize(20);
  textAlign(LEFT);
  text("Score: " + score, 20, 40);
  text("Lives: ", 20, 70);
  for (int i = 0; i < lives; i++) {
    fill(red);
    circle(100 + i * 25, 60, 10);
  }
  
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
  
  // Wall collision 
  if (bx - bd/2 <= 0 || bx + bd/2 >= width) {
    vx = vx * -1;
    if (bounceSound != null) {
      bounceSound.rewind();
      bounceSound.play();
    }
  }
  if (by - bd/2 <= 0) {
    vy = vy * -1;
    if (bounceSound != null) {
      bounceSound.rewind();
      bounceSound.play();
    }
  }
  
  // Paddle collision 
  if (dist(bx, by, px, py) < bd/2 + pd/2 && vy > 0) {
    vx = (bx - px) / 1;
    vy = (by - py) / 1;
    
    // moves up after hitting paddle
    if (vy > 0) vy = -vy;
    
    // doesn't go too slow 
    if (abs(vx) < 1) {
      if (vx > 0) vx = 2;
      else vx = -2;
    }
    
    if (bounceSound != null) {
      bounceSound.rewind();
      bounceSound.play();
    }
  }
  
  // Brick collision (SIMPLE)
  for (int row = 0; row < rows; row++) {
    for (int col = 0; col < cols; col++) {
      if (bricks[row][col] == 1) {
        float brickX = bbX + col * (bbr + gX);
        float brickY = bbY + row * (bbr + gY);
        
        if (dist(bx, by, brickX, brickY) < bd/2 + bbr/2) {
          bricks[row][col] = 0;
          totalBricks--;
          score += 10;
          
          // Simple bounce: reverse both directions a little
          vx = (bx - brickX) / 5;
          vy = (by - brickY) / 5;
          
          
          if (scoreSound != null) {
            scoreSound.rewind();
            scoreSound.play();
          }
          if (bounceSound != null) {
            bounceSound.rewind();
            bounceSound.play();
          }
        }
      }
    }
  }
  
  // Check win
  if (totalBricks == 0 && !gameWon) {
    gameWon = true;
    if (winSound != null) {
      winSound.rewind();
      winSound.play();
    }
    mode = GAMEOVER;
  }
  
  // Ball falls off bottom
  if (by + bd/2 >= height) {
    lives--;
    if (loseSound != null) {
      loseSound.rewind();
      loseSound.play();
    }
    if (lives <= 0) {
      mode = GAMEOVER;
    } else {
      // Reset ball position
      bx = width/2;
      by = height - 100;
      vx = random(-3, 3);
      vy = -ballSpeed;
      if (abs(vx) < 1) vx = 2;
      //px = width/2;
    }
  }
}
