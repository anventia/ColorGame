void intro() {
  background(240);  // This will be replaced with an Animated Gif background!
  
  fill(100);  // Title
  textAlign(CENTER);
  textSize(textLarge);
  text("colorGame();", width/2, height/2);
  textSize(textLarge/3);
  text("click to start", width/2, height/2+50);
  
  if (mouse) mode = GAME;  // Checks for mouse clock to start game
  
}
