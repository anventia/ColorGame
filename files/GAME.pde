String puzzle;
color pColor;
boolean match;
float timer;
float timerX;
String[] displayList;
String display;
float selection;
float prevValue = 0;
int blink = 0;
boolean reverse = false;

void initPuzzle() {  // Initializes puzzle
  timer = countdown;
  timerX = width;
  match = false;
  yes = false;
  no = false;
  selection = 2.0;
  display = "";
  prevValue = 0;
  
  int a = int(random(0,6));  // Random word
  int b = int(random(1,11));  // Match or do not match
  if (b > 5) match = true;
  puzzle = words[a];  // Pick a random word
  if (match) {pColor = colors[a];} else {pColor = colors[( a + (int)random(1,6)) % 6];} 
}


void drawPuzzle() {  // Draws out the word, letter by letter.
  int letters = puzzle.length();  // Number of letters in puzzle
  displayList = new String[letters];  // List of letters
  int i = 0;
  prevValue = floor(selection);  // Selection is incremented by decimals, this detects when it goes from 3.xxxx to 4.xxxx
  
  if(floor(selection) != letters+2) selection += 1.0/5;  // Only increases if all letters not drawn yet  // 1.0/x determines the speed
  if(floor(selection) != prevValue) {  // If selection changes from 3.xxxx to 4.xxxx
    display = "";  
    while(i < floor(selection)-2) {  // Adds letters to display string one by one, 
      displayList[i] = ""+puzzle.charAt(i);
      display += displayList[i];
      i += 1;
    }
  }
  textAlign(LEFT);
  textFont(GilroyBold); 
  textSize(textLarge);  // Draws the text.
  fill(pColor);  
      
  if (blink <= 10)               text("> "+display+"_", width/7, height/4+15*scaleY+strokeLarge);  // Makes | character blink
  if (blink > 10 && blink <= 25) text("> "+display,     width/7, height/4+15*scaleY+strokeLarge);  // ^
  
  if(blink == 25) reverse = true;  // Makes blink go from 0-20 then 20-0...
  if (blink == 0) reverse = false;
  if (reverse == true) blink -= 1; else blink += 1;
}


void ColorGame() {
  background(250);
  
  //fill(100);  // Dividing lines
  //stroke(100);
  //strokeWeight(2);
  //line(width/2,height/2, width/2,height);
  //line(0,height/2, width,height/2);  
  
  if(focused == false) {mode=PAUSE;} 
  
  // Background rectangles //
  fill(50);
  noStroke();
  rect(width/2,height*0.25-strokeLarge*-0.25, width-strokeLarge*2,height/2-strokeLarge*1.5, strokeLarge);  // Display
  noStroke();
  if (trueColor) {fill(#90FF9C, 150);} else {noFill();}  // Highlight
  rect(width*0.25+strokeLarge*0.5, height*0.75+strokeLarge*-0.25, width/2-strokeLarge, height/2-strokeLarge*1.5, strokeLarge,0,0,strokeLarge);  // true 
  if (falseColor) {fill(#FF9090, 150);} else {noFill();}  // Highlight
  rect(width*0.75-strokeLarge*0.5, height*0.75+strokeLarge*-0.25, width/2-strokeLarge, height/2-strokeLarge*1.5, 0,strokeLarge,strokeLarge,0);  // false
  noFill();
  strokeWeight(5*scaleX);
  stroke(50);
  rect(width/2,height*0.75+strokeLarge*-0.25, width-strokeLarge*2-5*scaleX,height/2-strokeLarge*1.5-5*scaleX, strokeLarge);  // Buttons
  
  if (mouseX < width/2 && mouseY > height/2) trueColor = true; else trueColor = false; // Color indicator highlights
  if (mouseX > width/2 && mouseY > height/2) falseColor  = true; else falseColor  = false;
  
  // True / False text //
  fill(250);
  noStroke();
  triangle(width/2-50*scaleY,height*0.75, width/2,height*0.75-50*scaleY, width/2,height*0.75+50*scaleY);  // Left arrow background 
  triangle(width/2+50*scaleY,height*0.75, width/2,height*0.75-50*scaleY, width/2,height*0.75+50*scaleY);  // Right arrow background

  textAlign(CENTER);
  textFont(GilroyLight);  
  textSize(textLarge);
  fill(100); 
  stroke(100);
  strokeWeight(strokeLarge);
  text("True", width/4, height*0.75+textLarge*0.3);  // True
  noStroke();
  if (trueColor) {fill(#FF9090, 150);} else {fill(#90FF9C, 150);}  // Highlight
  triangle(width/2-50*scaleY,height*0.75, width/2,height*0.75-50*scaleY, width/2,height*0.75+50*scaleY);  // Left arrow
  
  fill(100);
  stroke(100);
  strokeWeight(strokeLarge);
  text("False", width/4*3, height*0.75+textLarge*0.3);  // False
  noStroke();
  if (falseColor) {fill(#90FF9C, 150);} else {fill(#FF9090, 150);}  // Highlight
  triangle(width/2+50*scaleY,height*0.75, width/2,height*0.75-50*scaleY, width/2,height*0.75+50*scaleY);  // Right arrow
  
  // if (trueColor == true && falseColor == false) {fill(#FF9090);} else if(falseColor == true && trueColor == false) {fill(#90FF9C);} else {fill(#FF9090);} // Highlight
  drawPuzzle();  // Draws the puzzle.
  
  // Timer bar //
  strokeWeight(strokeLarge);
  stroke(pColor);
  line(strokeLarge*2,height/2-strokeLarge*1.5, timerX,height/2-strokeLarge*1.5);
  timer -= 1.0/60;  // Timer decrease by 1 every second
  timerX = map(timer, 0,countdown, strokeLarge*2,width-strokeLarge*2);
  if (timerX <= strokeLarge*2) {mode = GAMEOVER;}  // Ran out of time!
  
  if (match) {  // Color matches word
    if (yes) {initPuzzle(); score += 1;} else if(no) {mode = GAMEOVER;}
  } else {  // Color does not match word
    if (yes) {mode = GAMEOVER;} else if(no) {initPuzzle(); score += 1;}
  }
  if (score > highscore) highscore = score;  // Update highscore
}
