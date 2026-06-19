Game game;


void setup() {
  size(1000, 500);textFont(createFont("Arial", 16));
   

  game = new Game();
}

void draw() {
  game.update();game.render();
}

void keyPressed() {
  game.keyPressed();
}
