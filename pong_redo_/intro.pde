void drawIntro() {
  background(bgColor);
  
  if (!theme.isPlaying()) {
    theme.play();
    theme.loop();
  }
  
  titleY += as;if(titleY<20||titleY>height-20)as*=-1;
  fill(textColor);
  textSize(60);
  textAlign(CENTER, CENTER);
  text("PONG", 400, titleY);
  

  if (mouseX > 270 && mouseX < 390 && mouseY > 380 && mouseY < 430) {
    fill(#FF6666);
    strokeWeight(4);
  } else {
    fill(#FF0000);
    strokeWeight(1);
  }
  stroke(255);
  rect(270, 380, 120, 50, 10);
  fill(255);
  textSize(18);
  text("1 PLAYER", 330, 405);
  
  if (mouseX > 410 && mouseX < 530 && mouseY > 380 && mouseY < 430) { fill(#6666FF); strokeWeight(4);
  } else { fill(#0000FF); strokeWeight(1);
  }
  stroke(255); rect(410, 380, 120, 50, 10); fill(255);text("2 PLAYER", 470, 405);


  
 
}

void clickIntro() {if (mouseX > 270 && mouseX < 390 && mouseY > 380 && mouseY < 430) {vsAI = true;gameType = 1;startGame();
  }
  if (mouseX > 410 && mouseX < 530 && mouseY > 380 && mouseY < 430) {vsAI = false;gameType = 2;startGame();
  }
}

void startGame() {
  mode = GAME;
  resetPositions();
  resetBall();
  leftScore = 0;
  rightScore = 0;
  ballMoving = false;
  ballWait = 60;
  ballSpeed = 5;
  
  theme.pause();
}
