class Game {

  final int MENU = 0;
  final int PLAYING = 1;
  final int WIN = 2;
  final int LOSE = 3;

  int state = MENU;

  Player player;
  WordManager wm;

  int score = 0;
  int lives = 6;
  int combo = 0;

  float roadOffset = 0;

  int fft= 0;
  color ffc;

  Game() {
    player = new Player();
    wm = new WordManager(this);
  }

  void update() {
    if (state != PLAYING) return;player.update();roadOffset -= (player.ppS + player.ttS) * 0.5;

    checkWinLose();
  }

  void render() {

    background(180, 220, 255);

    if (state == MENU) {drawMenu();return;
    }

    if (state == PLAYING) {drawRoad(roadOffset);if (fft > 0) {fill(ffc, 80);rect(0, 0, width, height);
        fft--;
      }

     

      drawHUD(score, lives, combo);

      return;
    }

    if (state == WIN) {drawWinScreen(score);return;
    }

    if (state == LOSE) {drawLoseScreen(score);return;
    }
  }

  void keyPressed() {

    if (state == MENU) {if (key == ENTER || key == RETURN) {state = PLAYING;
      }
      return;
    }


 
  
  
}
