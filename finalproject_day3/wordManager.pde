class WordManager {

  String story;

  int index = 0;        // typing position
  Game game;

  WordManager(Game g) {

    game = g;

    // Little Red Riding Hood story 
    story =
      "Once upon a time, there was a little girl called Little Red Riding Hood. " +
      "She lived in a village near the forest. " +
      "One day, her mother asked her to bring food to her grandmother. " +
      "But in the forest, a wolf was watching her silently.";
  }

  void render() {

    fill(255);
    stroke(0);
    rect(100, 50, 800, 140);

    textSize(18);

    float x = 120;
    float y = 90;

    for (int i = 0; i < story.length(); i++) {char c = story.charAt(i);

      // already typed
      if (i < index) {fill(0, 200, 0);

      // current character
      } else if (i == index) {fill(255, 150, 0);

      // not typed yet
      } else {fill(0);
      }
      text(c, x, y);

      x += textWidth(c);

      // line wrap
      if (x > 850) {x = 120;y += 25;
      }
    }
  }

  void handleInput() {

    // BACKSPACE
    if (key == BACKSPACE) {if (index > 0) {index--;
      }

      return;
    }

    // normal character input
    if (key >= 32 && key <= 126) {char expected = story.charAt(index);if (key == expected) {
      index++;game.onType();game.onCorrect();
      } else {
        game.onWrong();

      // finished story
      if (index >= story.length()) {

        game.onCorrect();
        index = 0;   
      }
    }
  }

  
  
}
