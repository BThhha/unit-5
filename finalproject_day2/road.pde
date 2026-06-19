void drawRoad(float offset) {

  fill(120);
  rect(0, 300, width, 200);

  fill(255);

  for (int i = -60; i < width + 60; i += 50) {float x = i + (offset % 50);rect(x, 370, 30, 5);
  }
}
