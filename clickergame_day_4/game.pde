void resetGame() {
  targetX = width/2;
  targetY = height/2;
  targetVx = random(-4, 4);
  targetVy = random(-4, 4);
  if (abs(targetVx) < 1) targetVx = 2;
  if (abs(targetVy) < 1) targetVy = 2;
  targetSize = 100;
  playerScore = 0;
  missCount = 0;
}
void drawGame() {
  background(30, 100, 30);
  
  targetX = targetX + targetVx;
  targetY = targetY + targetVy;
  
  if (targetX < targetSize/2 || targetX > width - targetSize/2) targetVx = targetVx * -1;
  if (targetY < targetSize/2 || targetY > height - targetSize/2) targetVy = targetVy * -1;
  
  targetX = constrain(targetX, targetSize/2, width - targetSize/2);
  targetY = constrain(targetY, targetSize/2, height - targetSize/2);
  
  fill(255);
  stroke(0);
  strokeWeight(4);
  circle(targetX, targetY, targetSize);
  
  stroke(255, 0, 0);
  strokeWeight(3);
  line(targetX - 25, targetY, targetX + 25, targetY);
  line(targetX, targetY - 25, targetX, targetY + 25);
  
  fill(255);
  noStroke();
  textSize(24);
  text("Score: " + playerScore, 70, 50);
  text("Misses: " + missCount + "/" + maxMisses, width - 100, 50);
  textSize(14);
  text("P = pause", width/2, height - 30);
}


  
 
