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

      drawDistanceBar(player);

      player.render();
      wm.render();

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

    if (state == PLAYING) {wm.handleInput();
    }

    if (state == WIN || state == LOSE) {if (key == 'r' || key == 'R') resetGame();
    }
  }

  void onType() {
    player.ppS += 0.08;
  }

  void onCorrect() {
    score += 10;
    combo++;

    player.ppS += 0.2 + combo * 0.02;
    player.ttS -= 0.1;

    ffc = color(0, 255, 0);
    fft = 8;
  }

  void onWrong() {
    lives--;
    combo = 0;

    player.ppS -= 0.2;
    player.ttS += 0.3;

    ffc = color(255, 0, 0);
    fft = 10;
  }

  void checkWinLose() {if (player.distance <= 10) state = WIN;
  if (player.distance >= 1000) state = LOSE;
  if (lives <= 0) state = LOSE;
  }

  void resetGame() {
    player = new Player();
    wm = new WordManager(this);

    score = 0;
    lives = 3;
    combo = 0;

    state = MENU;
  }
  
}
