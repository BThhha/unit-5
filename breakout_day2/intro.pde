void drawIntro() {
  background(darkblue);
  
  // Animated stars
  for (int i = 0; i < 50; i++) {
    float starX = (i * 79) % width;
    float starY = (i * 57 + frameCount) % height;
    fill(255, 255, 200, 150);
    circle(starX, starY, 2);
  }
  
  fill(white);
  textSize(60);
  textAlign(CENTER, CENTER);
  text("BREAKOUT", width/2, height/2 - 100);
  
  textSize(20);
  text("You have 3 lives", width/2, height/2 + 70);
  
  textSize(16);
  fill(200);
  text("Click anywhere to start", width/2, height - 60);
  
  // Draw animated GIF
  if (gifFrames[0] != null) {
    gifIndex = (gifIndex + 1) % gifFrames.length;
    image(gifFrames[gifIndex], width/2 - 80, height - 200, 160, 120);
  }
  
  // Play intro music
  if (introMusic != null && !introMusic.isPlaying()) {
    introMusic.loop();
  }
}

void clickIntro() {
 
}
