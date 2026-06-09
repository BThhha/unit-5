void tactileButton(int x, int y, int w, int h, int id) {
  if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
    hoverButton = id;
    fill(150);
    strokeWeight(4);
  } else {
    if (hoverButton == id) hoverButton = 0;
    fill(100);
    strokeWeight(1);
  }
  stroke(255);
  rect(x, y, w, h, 10);
}
