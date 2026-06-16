import ddf.minim.*;
Minim minim;
AudioPlayer theme, coin, bump, gameover;

PImage circlephoto;
int gameMode;
final int MODE_INTRO = 0;
final int MODE_GAME = 1;
final int MODE_PAUSE = 2;
final int MODE_GAMEOVER = 3;
final int MODE_OPTIONS = 4;
final int MODE_SETTINGS = 5;


float tgX, tgY;      
float tgVx, tgVy;    
float targetSize = 100;      


int playerScore = 0;
int missCount = 0;
int maxMisses = 5;
int highScore = 0;  

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
  
  skins[0] = loadImage("baby meme.png");
  skins[1] = loadImage("shocked guy meme.png");
  skins[2] = loadImage("cat meme.png");
  
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
  tgX = 400;                    
  tgY = 350;                   
  tgVx = random(-4, 4);       
  tgVy = random(-4, 4);             
  
  
  targetSize = 100;                     
  playerScore = 0;                      
  missCount = 0;                       
  // background music
  if (theme != null) {
    theme.rewind();
    theme.play();
  }
}
