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

    // Draw the skin image
    if (skinReady && skins[i] != null) {
      // Resize and crop image to fit circle
      PImage img = skins[i].copy();
      img.resize((int)(circleRadius * 2), (int)(circleRadius * 2));
      imageMode(CENTER);
      image(img, cx, cy);
    } 
    // Draw small number
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

  // Option 1 (left)
  float cx1 = startX;
  if (dist(mouseX, mouseY, cx1, circleY) < circleRadius) {
    currentSkin = 0;
    if (coin != null) {
      coin.rewind();
      coin.play();
    }
  }

  // Option 2 (middle)
  float cx2 = startX + spacing;
  if (dist(mouseX, mouseY, cx2, circleY)< circleRadius) {
    currentSkin = 1;
    if (coin != null) {
      coin.rewind();
      coin.play();
    }
  }

  // Option 3 (right)
  float cx3 = startX + spacing * 2;
  if ( dist(mouseX, mouseY, cx3, circleY)< circleRadius) {
    currentSkin = 2;
    if (coin != null) {
      coin.rewind();
      coin.play();
    }
  }
}
