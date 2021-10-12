// Brendan Chen
// 2021/10/01 
// Programming 12 Asteroids Project
// Uses some code from my utilities repository: https://github.com/anventia/ProcessingUtilities


// Core Variables //
int mode;  // Mode Framework
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;

PFont MMD;  // Fonts

color[] smokeColors;


// Game Variables //
int score;
int goal;
int lives;
boolean win;

Ship myShip;
ArrayList<gameObject> myObjects;

final int bigAsteroid = 200;  // Asteroids
final int medAsteroid = 125;
final int smlAsteroid = 75;
final int tnyAsteroid = 50;

final int numAsteroids = 1;
final int numSizes = 4;


void setup() {
  // Setup //
  mode = INTRO;
  size(1000,700);
  background(0);
  surface.setResizable(true);
  surface.setTitle("Asteroids");
   
  
  // Font //
  MMD = createFont("MajorMonoDisplay-Regular.ttf", 100);
  textFont(MMD);
  
  // Colors //
  smokeColors = new color[]{
    #FF1717,
    #FF7417, 
    #FFB617, 
    #FFE817,
    #EFFF17
  };
  
  
  // Game //
  score = 0;
  goal = int(numAsteroids * (pow(2, numSizes)-1));  // Calculates total number of asteroids that will appear
  
  myShip = new Ship();  // Ship
  myObjects = new ArrayList<gameObject>();
  myObjects.add(myShip);
  
  int i = 0;
  while(i < numAsteroids) {  // Add asteroids
    myObjects.add(new Asteroid(bigAsteroid, random(0-bigAsteroid/2, width+bigAsteroid/2), random(0-bigAsteroid/2, height+bigAsteroid/2)));
    i++;
  }
}

void draw() {
  // Core functions //
  scaleWindow();
  switch(mode) {
    case INTRO:    intro();    break;
    case GAME:     game();     break;
    case GAMEOVER: gameOver(); break;
  }
}