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


  
 
