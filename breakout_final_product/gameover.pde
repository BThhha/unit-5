void drawGameOver() {
  background(darkblue);
  
  for (int i = 0; i < 50; i++) {
    fill(random(255), random(255), random(255), 50);
    circle(random(width), random(height), random(20, 40));
  }
  
  fill(white);
  textSize(50);
  textAlign(CENTER, CENTER);
  
  if (gameWon) {
    text("YOU WIN!", width/2, height/2 - 80);
    textSize(30);
    text("Final Score: " + score, width/2, height/2 - 20);
  } else {
    text("GAME OVER", width/2, height/2 - 80);
    textSize(30);
    text("Final Score: " + score, width/2, height/2 - 20);
  }
  
  textSize(20);
  text("Click to play again", width/2, height/2 + 80);
}
