// Brendan Chen
// 2021/09/16
// Programming 12 Color Game

// TO DO: Make things (triangles) scale with window size) 1440 x 900
// x: /1440*width  y: /900*height

// Variables //
int mode;  // Mode Framework
final int INTRO    = 0;
final int GAME     = 1;
final int GAMEOVER = 2;

PFont Montserrat;  // Fonts
PFont GilroyLight;

float textLarge;
float largeStroke;

String[] words;  // Color arrays
color[] colors;
color red = #FF9090;
color orange = #FFB990;
color yellow = #FDFF90;
color green = #90FF9C;
color blue = #909AFF;
color purple = #B390FF;

int score = 0;  // Scoring


void setup() {
  background(255);  // Scene initialization
  fullScreen();
  //size(400,400);
  mode = INTRO;  // Start with the Intro mode
  
  Montserrat = createFont("Montserrat-Regular.ttf", 100);  // Initialize Font
  GilroyLight = createFont("Gilroy-Light.otf", 100);
  textFont(GilroyLight);
  
  textLarge = height/9;
  largeStroke = height/35;
  
  words = new String[6];  // Create lists
  colors = new color[6];
  
  words[0] = "red";  // Words
  words[1] = "orange";
  words[2] = "yellow";
  words[3] = "green";
  words[4] = "blue";
  words[5] = "purple";
  
  colors[0] = red;  // Colors
  colors[1] = orange;
  colors[2] = yellow;
  colors[3] = green;
  colors[4] = blue;
  colors[5] = purple;
  
  initPuzzle();
}

void draw() {
  switch(mode) {  // Mode Framework  
    case INTRO:     intro();     break;
    case GAME:      game();      break;
    case GAMEOVER:  gameover();  break;
  }
}
