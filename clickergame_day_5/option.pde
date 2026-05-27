void drawOptions() {
  background(50, 50, 80);
  fill(255);
  textSize(40);
  text("OPTIONS", width/2, 100);
  textSize(20);
  text("Hit area bonus: +15px", width/2, 200);
  text("Current max misses: " + maxMisses, width/2, 280);
  textSize(16);
  fill(200, 255, 200);
  text("Press UP to increase misses", width/2, 380);
  text("Press DOWN to decrease misses", width/2, 430);
  text("Press Q to go back", width/2, 500);
}

void clickOptions() {}
