 void resetGame() {
  // reset target pos
  targetX = width/2;
  targetY = height/2;
  // random speed
  targetVx = random(-4, 4);
  targetVy = random(-4, 4);
  // fix slow speed
  if (abs(targetVx) < 1) targetVx = 2;
  if (abs(targetVy) < 1) targetVy = 2;
  // reset size
  targetSize = 100;
  // reset score
  playerScore = 0;
  // reset misses
  missCount = 0;
  
  // play theme music
  if (theme != null) {
    theme.rewind(); // restart song
    theme.play();   // start playing
  }
}

void drawGame() {
  // green background
  background(30, 100, 30);
  
  // move target
  targetX = targetX + targetVx;
  targetY = targetY + targetVy;
  
  // bounce off walls
  if (targetX < targetSize/2 || targetX > width - targetSize/2) targetVx = targetVx * -1;
  if (targetY < targetSize/2 || targetY > height - targetSize/2) targetVy = targetVy * -1;
  
  // keep inside screen
  targetX = constrain(targetX, targetSize/2, width - targetSize/2);
  targetY = constrain(targetY, targetSize/2, height - targetSize/2);
  
  // draw white circle
  fill(255);
  stroke(0);
  strokeWeight(4);
  circle(targetX, targetY, targetSize);
  
  // draw red cross
  stroke(255, 0, 0);
  strokeWeight(3);
  line(targetX - 25, targetY, targetX + 25, targetY);
  line(targetX, targetY - 25, targetX, targetY + 25);
  
  // show score text
  fill(255);
  noStroke();
  textSize(24);
  text("Score: " + playerScore, 70, 50);
  text("Misses: " + missCount + "/" + maxMisses, width - 100, 50);
  textSize(14);
  text("P = pause", width/2, height - 30);
  
  // draw selected skin
  if (skinReady && skins[currentSkin] != null) {
    imageMode(CENTER);
    PImage skinToDraw = skins[currentSkin].copy();
    skinToDraw.resize((int)targetSize, (int)targetSize);
    image(skinToDraw, targetX, targetY);
  } else {
    // draw default ball
    fill(255);
    stroke(0);
    strokeWeight(4);
    circle(targetX, targetY, targetSize);
    
    // draw default cross
    stroke(255, 0, 0);
    strokeWeight(3);
    line(targetX - 25, targetY, targetX + 25, targetY);
    line(targetX, targetY - 25, targetX, targetY + 25);
  }
}

void clickGame() {
  // check click distance
  float distance = dist(mouseX, mouseY, targetX, targetY);
  
  // hit the target
  if (distance < targetSize/2 + 15) {
    playerScore = playerScore + 10;   // add score
    targetSize = targetSize - 5;      // shrink target
    if (targetSize < 30) targetSize = 30; // min size
    targetVx = targetVx * 1.1;        // speed up x
    targetVy = targetVy * 1.1;        // speed up y
    float angle = atan2(mouseY - targetY, mouseX - targetX);
    targetVx = targetVx + cos(angle) * 2; // push away x
    targetVy = targetVy + sin(angle) * 2; // push away y
    
    // play coin sound
    if (coin != null) {
      coin.rewind(); // reset sound
      coin.play();   // play hit sound
    }
  } else {
    // missed the target
    missCount = missCount + 1;
    
    // play bump sound
    if (bump != null) {
      bump.rewind(); // reset sound
      bump.play();   // play miss sound
    }
    // game over check
    if (missCount >= maxMisses) {
      gameMode = MODE_GAMEOVER;  // switch mode
      if (gameover != null) {
        gameover.rewind();       // reset sound
        gameover.play();         // play gameover
      }
      // stop theme music
      if (theme != null) {
        theme.pause();  // stop music
        theme.rewind(); // rewind song
      }
    }
  }
}
