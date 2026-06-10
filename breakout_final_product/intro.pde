void drawIntro() {
  background(darkblue);
  
  // Animated stars
  for (int i = 0; i < 50; i++) {
    float starX = random(0, 800);
    float starY = random(0, 700);
    fill(255, 255, 200, 150);
    circle(starX, starY, 4);
  }
  
  fill(white);
  textSize(60);
  textAlign(CENTER, CENTER);
  text("BREAKOUT", 400, 250);
  
  textSize(16);
  fill(200);
  text("Click anywhere to start", 400, 630);
  
 
  
}

void clickIntro() {
 
}
