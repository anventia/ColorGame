
void intro() {
  //background(240);  // This will be replaced with an Animated Gif background!
  imageMode(CENTER);
  image(gif[loadFrame], width/2,height/2, width,width*(0.75));  // width,width*(0.75) scales the gif to the screen width, while keeping the original aspect ratio (800x600) (1x0.75)
  loadFrame += 1;
  if (loadFrame == 72) loadFrame += 1;  // Skip frame 72 because it broke
  if (loadFrame == frames) loadFrame = 0;
  
  rectMode(CENTER);
  fill(255,50);
  rect(width/2,height/2, width,height);  // Background blur over GIF
  
  fill(0, 75);  // Box
  noStroke();
  rect(width/2,height/2, width,textLarge*1.8);
  rect(width/2,height-((50+strokeLarge)*scaleY), 500*scaleX,100*scaleY, strokeLarge/2);
  
  fill(255);  // Title
  textAlign(CENTER);
  textFont(GilroyBold);
  textSize(textLarge);
  text("colorGame();", width/2, height/2+15*scaleY);
  textFont(GilroyLight);
  textSize(textLarge/3);
  text("[space] -> start", width/2, height/2+50*scaleY);
  text("controls:\n[left arrow] / [click] / [right arrow]", width/2, height-textLarge);
  
  if (space) {space = false; mode = GAME;}  // Checks for space press to start game
  
}
