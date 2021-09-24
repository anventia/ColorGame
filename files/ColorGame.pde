// Brendan Chen
// 2021/09/16
// Programming 12 Color Game

// Variables //
float scaleX;
float scaleY;

int mode;  // Mode Framework
final int INTRO    = 0;
final int GAME     = 1;
final int GAMEOVER = 2;
final int PAUSE    = 3;

PFont GilroyLight;  // Fonts
PFont GilroyBold;

float textLarge;
float strokeLarge;

String[] words;  // Color arrays
color[] colors;
color red = #FF7D76;
color orange = #FFAD76;
color yellow = #FFFB76;
color green = #78FF76;
color blue = #76B9FF;
color purple = #DA76FF;

final int countdown = 2;  // How many seconds for each word

int score = 0;  // Scoring
int highscore = 0;

PImage[] gif;  // Background Gif
int frames;
int loadFrame;

void setup() {
  background(255);
  //fullScreen();    // Fullscreen
  size(1000,700);
  // Should work with any size(); although it might break if height > width, and larger sizes make the gif lag in INTRO mode
  surface.setTitle("Programming 12 | ColorGame();");  // Sets window title
  surface.setResizable(true);  // Allows window to be resized
  cursor(1);
  
  frames = 189;  // Initialize Gif
  gif = new PImage[frames];
  int i = 0;
  while (i < frames) {
    String k = ""+i;  // Converts to string
    if (i < 100) k = "0"+i;  // Automatically converts 7 into 007 and 56 into 056 (to match gif naming)
    if (i < 10) k = "00"+i;
    
    gif[i] = loadImage("frame_"+k+"_delay-0.04s.gif"); 
    i += 1;
    if (i == 72) i += 1;  // Skip frame 072 because for some reason it's out of place in the animation
  }  // When GIF was converted into image sequence, it glitched and now it has a 'glitch' effect because it actually glitched
  
  mode = INTRO;  // Start with the Intro mode
  
  // Window Scaling Variables //
  scaleX = 1.0/1000*width;  // Shapes coded for a 1000x700 display, multiply values by these to scale to other display sizes accordingly
  scaleY = 1.0/700*height;  // For some reason, 1/700 returns 0, 1.0/700 returns the actual quotient
  textLarge = height/9;
  strokeLarge = height/35;
  
  GilroyLight = createFont("Gilroy-Light.otf", 100);
  GilroyBold = createFont("Gilroy-ExtraBold.otf", 100);
  textFont(GilroyLight);
   
  words = new String[6];  // Create lists
  colors = new color[6];
  
  words[0] = "red";     colors[0] = red;  //  Words and colors
  words[1] = "orange";  colors[1] = orange;
  words[2] = "yellow";  colors[2] = yellow;
  words[3] = "green";   colors[3] = green;
  words[4] = "blue";    colors[4] = blue;
  words[5] = "purple";  colors[5] = purple;
  
  initPuzzle();
}

void draw() {
  switch(mode) {  // Mode Framework  
    case INTRO:     intro();      space = false; break;  // space = false; just in case space key is pressed when mode changes to intro or gameover
    case GAME:      ColorGame();       space = false; break;
    case GAMEOVER:  gameover();   space = false; break;
    case PAUSE:     paused();
  }
  // Updates Window Scaling Variables //
  scaleX = 1.0/1000*width;
  scaleY = 1.0/700*height;  
  textLarge = height/9;  
  strokeLarge = height/35;
}
