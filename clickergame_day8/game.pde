void drawGame() {
  background(30, 100, 30);
  circlephoto=skins[currentSkin];
  // Move target
  tgX = tgX + tgVx;
  tgY = tgY + tgVy;
  
  // Bounce off walls 
  if (tgX < targetSize/2 || tgX > 800 - targetSize/2) {
    tgVx = tgVx * -1;  
  }
  // Bounce off walls
  if (tgY < targetSize/2 || tgY > 800 - targetSize/2) {
    tgVy = tgVy * -1;   
  }
  
  // Keep target
  tgX = constrain(tgX, targetSize/2, 800 - targetSize/2);
  tgY = constrain(tgY, targetSize/2, 800 - targetSize/2);
  
  // Draw target 
  fill(255);
  stroke(0);
  strokeWeight(4);
  //circle(targetX, targetY, targetSize);
  //
  image(circlephoto, tgX, tgY, targetSize, targetSize);
  
 
  
  // Show score and misses
  fill(255);
  noStroke();
  textSize(24);
  text("Score: " + playerScore, 70, 50);
  text("Misses: " + missCount + "/" + maxMisses, 700, 50);
  text("High Score: " + highScore, 70, 90);
  textSize(14);
  text("P = pause", 800/2, 800 - 30);
}


void clickGame() {
  float distance = dist(mouseX, mouseY, tgX, tgY);
  
  
  if (distance < targetSize/2 + 25) {
    playerScore = playerScore + 10;
    targetSize = targetSize - 5;
    if (targetSize < 30) targetSize = 30;
    
    
    // Speed up 
    //targetVx = targetVx * 1.1;
    //targetVy = targetVy * 1.1;
    
    // Push target away from click 
    if (mouseX > tgX) tgVx = tgVx + 2;
    else tgVx = tgVx - 2;
    
    if (mouseY > tgY) tgVy = tgVy + 2;
    else tgVy = tgVy - 2;
    
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
      updateHighScore();
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
