//minim import
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer theme, coin, bump, gameover;


//game modes
int gameMode;
final int MODE_INTRO = 0;
final int MODE_GAME = 1;
final int MODE_PAUSE = 2;
final int MODE_GAMEOVER = 3;
final int MODE_OPTIONS = 4;
final int MODE_SETTINGS = 5;


//target variables
float targetX, targetY;
float targetVx, targetVy;
float targetSize = 100;


//score, miss
int playerScore = 0;
int missCount = 0;
int maxMisses = 5;   


//image selection
PImage[] skins = new PImage[3];
  int currentSkin = 0; // 0, 1, or 2
  boolean skinReady = false;


//intro page
void setup() {
  size(800, 800);
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  gameMode = MODE_INTRO;
  
  //audio files
  minim = new Minim(this);
  theme = minim.loadFile("theme.mp3");
  coin = minim.loadFile("coin.mp3");
  bump = minim.loadFile("bump.mp3");
  gameover = minim.loadFile("gameover.mp3");
  
  gameMode = MODE_INTRO; 
  
  //images
  skins[0] = loadImage("https://i.kym-cdn.com/entries/icons/original/000/055/728/baby-covering-mouth.jpg");
  skins[1] = loadImage("https://i.kym-cdn.com/entries/icons/facebook/000/041/895/AALIYAH_WROTE_JAY_AN_APOLOGY_LETTER%F0%9F%93%83__MARK_WANT_DESIREE_AND_HANNAH!%F0%9F%98%B1_4-32_screenshot_(1).jpg");
  skins[2] = loadImage("https://wallpapers.com/images/hd/goofy-ahh-picture-biwjh823lu8kx09j.jpg");
  
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
