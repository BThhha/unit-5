import ddf.minim.*;
Minim minim;
AudioPlayer theme, coin, bump, gameover;


int gameMode;
final int MODE_INTRO = 0;
final int MODE_GAME = 1;
final int MODE_PAUSE = 2;
final int MODE_GAMEOVER = 3;
final int MODE_OPTIONS = 4;
final int MODE_SETTINGS = 5;


float targetX, targetY;      
float targetVx, targetVy;    
float targetSize = 100;      


int playerScore = 0;
int missCount = 0;
int maxMisses = 5;

PImage[] skins = new PImage[4];
int currentSkin = 0;
boolean skinReady = false;


int hoverButton = 0;

void setup() {
  size(800, 800);
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  
  // Load sounds
  minim = new Minim(this);
  theme = minim.loadFile("theme.mp3");
  coin = minim.loadFile("coin.mp3");
  bump = minim.loadFile("bump.mp3");
  gameover = minim.loadFile("gameover.mp3");
 
  skinReady = false; 
  
  gameMode = MODE_INTRO;
  
  skins[0] = loadImage("baby meme");
  skins[1] = loadImage("shocked guy meme");
  skins[2] = loadImage("cat meme");
  
  if (skins[0] != null) skinReady = true;
}


void draw() {
  if (gameMode == MODE_INTRO) drawIntro();
  else if (gameMode == MODE_GAME) drawGame();
  else if (gameMode == MODE_PAUSE) drawPause();
  else if (gameMode == MODE_GAMEOVER) drawGameOver();
  else if (gameMode == MODE_OPTIONS) drawOptions();
  else if (gameMode == MODE_SETTINGS) drawSettings();
}


void resetGame() {
  targetX = width/2;                    // center X
  targetY = height/2;                   // center Y
  targetVx = random(-4, 4);             // random X speed
  targetVy = random(-4, 4);             // random Y speed
  
  // Make sure speed is not too slow
  if (abs(targetVx) < 1) targetVx = 2;
  if (abs(targetVy) < 1) targetVy = 2;
  
  targetSize = 100;                     
  playerScore = 0;                      
  missCount = 0;                       
  // Play background music
  if (theme != null) {
    theme.rewind();
    theme.play();
  }
}
