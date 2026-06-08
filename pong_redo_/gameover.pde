void drawGameOver() {
  background(bgColor);
  
  fill(textColor);
  textSize(40);
  textAlign(CENTER, CENTER);
  
  String winner = "";
  if (leftScore >= winScore) {
    winner = "LEFT PLAYER WINS!";
  } else {
    winner = gameType == 1 ? "AI WINS!" : "RIGHT PLAYER WINS!";
  }
  
  text(winner, width/2, height/2 - 80);
  
  textSize(30);
  text("Score: " + leftScore + " - " + rightScore, width/2, height/2);
  

}
