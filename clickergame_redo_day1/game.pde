void drawGame() {
  background(30, 100, 30);
  
  // Move target
  targetX = targetX + targetVx;
  targetY = targetY + targetVy;
  
  // Bounce off walls 
  if (targetX < targetSize/2 || targetX > 800 - targetSize/2) {
    targetVx = targetVx * -1;  
  }
  // Bounce off walls
  if (targetY < targetSize/2 || targetY > 800 - targetSize/2) {
    targetVy = targetVy * -1;   
  }
  
  // Keep target inside screen (0 to 800)
  targetX = constrain(targetX, targetSize/2, 800 - targetSize/2);
  targetY = constrain(targetY, targetSize/2, 800 - targetSize/2);
  
  // Draw target (circle with cross)
  fill(255);
  stroke(0);
  strokeWeight(4);
  circle(targetX, targetY, targetSize);
  
 
  
  // Show score and misses
  fill(255);
  noStroke();
  textSize(24);
  text("Score: " + playerScore, 70, 50);
  text("Misses: " + missCount + "/" + maxMisses, 800 - 100, 50);
  textSize(14);
  text("P = pause", 800/2, 800 - 30);
}

// ========== CLICK ON TARGET (called when mouse is clicked) ==========
void clickGame() {
  float distance = dist(mouseX, mouseY, targetX, targetY);
  
  // Check if click is inside target (with extra 15px help area)
  if (distance < targetSize/2 + 15) {
    playerScore = playerScore + 10;
    targetSize = targetSize - 5;
    if (targetSize < 30) targetSize = 30;
    
    // Speed up 
    targetVx = targetVx * 1.1;
    targetVy = targetVy * 1.1;
    
    // Push target away from click 
    if (mouseX > targetX) targetVx = targetVx + 2;
    else targetVx = targetVx - 2;
    
    if (mouseY > targetY) targetVy = targetVy + 2;
    else targetVy = targetVy - 2;
    
    // Play hit sound
    if (coin != null) {
      coin.rewind();
      coin.play();
    }
  } else {
    missCount = missCount + 1;
    
    // Play miss sound
    if (bump != null) {
      bump.rewind();
      bump.play();
    }
    
    // Check game over
    if (missCount >= maxMisses) {
      gameMode = MODE_GAMEOVER;
      if (gameover != null) {
        gameover.rewind();
        gameover.play();
      }
      if (theme != null) {
        theme.pause();
        theme.rewind();
      }
    }
  }
}
