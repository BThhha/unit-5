Game game;
import ddf.minim.*; import ddf.minim.analysis.*; import ddf.minim.effects.*; import ddf.minim.signals.*; import ddf.minim.spi.*; import ddf.minim.ugens.*;

Minim minim; 
AudioPlayer theme, correct, wrong, win, lose;

void setup() {
  size(1000, 500);textFont(createFont("Arial", 16));
   minim = new Minim(this);

  theme = minim.loadFile("theme.mp3");
  correct = minim.loadFile("correct.mp3");
  wrong = minim.loadFile("wrong.mp3");
  win = minim.loadFile("win.mp3");
  lose = minim.loadFile("lose.mp3");
  
  theme.loop();

  game = new Game();
}

void draw() {
  game.update();game.render();
}

void keyPressed() {
  game.keyPressed();
}
