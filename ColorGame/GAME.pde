String puzzle;
color pColor;
boolean match;

void initPuzzle() {
  yes = false;
  no = false;
  
  int a = int(random(0,6));
  int b = int(random(0,6));
  puzzle = words[a];  // Pick a random word
  pColor = colors[b];  // Pick a random color (WILL MAKE 50/50 LATER)
  if (a == b) {match = true;} else {match = false;}  // Detects if color matches word or not
}


void game() {
  background(240);
  
  fill(100);  // Dividing lines
  stroke(height/9);
  strokeWeight(largeStroke);
  line(width/2,height/2, width/2,height);
  line(0,height/2, width,height/2);  
  
  textSize(textLarge);  // Yes / No text
  
  if (yesColor) fill(#90FF9C); else fill(100);  // Highlight
  strokeWeight(largeStroke);
  text("YES", width/4, height/4*3+textLarge*0.6);
  strokeJoin(ROUND);  // Arrow indicators
  strokeWeight(largeStroke/4);
  triangle(width/2-109,height-200, width/2-40,height-240, width/2-40,height-160);  // Left
  
  if (noColor) fill(#FF9090); else fill(100);  // Highlight
  strokeWeight(largeStroke);
  text("NO", width/4*3, height/4*3+textLarge*0.6);
  strokeJoin(ROUND);  // Arrow indicators
  strokeWeight(largeStroke/4);
  triangle(width/2+109,height-200, width/2+40,height-240, width/2+40,height-160);  // Right
  
  
  // Draw puzzle // (Will be replaced with animation later)
  textSize(textLarge);
  fill(pColor);
  text(puzzle, width/2,height/4+textLarge*0.6);
  
  if (match) {  // Color matches word
    if (yes) {initPuzzle(); score += 1;} else if(no) {mode = GAMEOVER;}
  } else {  // Color does not match word
    if (yes) {mode = GAMEOVER;} else if(no) {initPuzzle(); score += 1;}
  }
}
