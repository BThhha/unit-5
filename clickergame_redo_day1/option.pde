void drawOptions() {
  background(50, 50, 80);
  fill(255);
  textSize(40);
  text("OPTIONS", width/2, 100);
  textSize(20);
  text("Current max misses: " + maxMisses, width/2, 280);
  textSize(16);
  fill(200, 255, 200);
  text("Press UP to increase misses", width/2, 380);
  text("Press DOWN to decrease misses", width/2, 430);
  text("Press Q to go back", width/2, 500);
  
  float circleY = 600;
  float circleRadius = 60;
  float spacing = 180;
  float startX = width/2 - spacing;
  
  for (int i = 0; i < 3; i++) {
    float cx = startX + i * spacing;
    float cy = circleY;
    
    // Draw circle background
    if (i == currentSkin) {
      fill(255, 200, 100, 200);
      stroke(255, 255, 0);
      strokeWeight(4);
    } else {
      fill(100);
      stroke(200);
      strokeWeight(2);
    }
    ellipse(cx, cy, circleRadius * 2, circleRadius * 2);
    
    // Draw the skin image (if loaded)
    if (skinReady && skins[i] != null) {
      // Resize and crop image to fit circle
      PImage img = skins[i].copy();
      img.resize((int)(circleRadius * 2), (int)(circleRadius * 2));
      imageMode(CENTER);
      image(img, cx, cy);
    } else {
      // Fallback if image missing
      fill(150);
      textSize(20);
      text("?", cx, cy);
    }
    
    // Draw small number label below each circle (optional – minimal)
    fill(200);
    textSize(16);
    text(i+1, cx, cy + circleRadius + 15);
  }
}

void clickOptions() {
  float circleY = 600;
  float circleRadius = 60;
  float spacing = 180;
  float startX = width/2 - spacing;
  
  for (int i = 0; i < 3; i++) {
    float cx = startX + i * spacing;
    float distToCenter = dist(mouseX, mouseY, cx, circleY);
    
    if (distToCenter < circleRadius) {
      currentSkin = i;
      // Optional: play a click sound
      if (coin != null) {
        coin.rewind();
        coin.play();
      }
      break;
    }
  }
}
