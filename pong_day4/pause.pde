void drawPause() {
  background(bgColor);
  fill(textColor);
  textSize(50);
  textAlign(CENTER, CENTER);
  text("PAUSED", width/2, height/2);
  textSize(20);
  text("Click to resume", width/2, height/2 + 60);
}
