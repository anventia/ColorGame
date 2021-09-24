void gameover() {
  background(240);
  fill(100);
  textAlign(CENTER);
  textFont(GilroyBold);
  textSize(textLarge);
  text("Game Over!", width/2, height/3+textLarge);
  textFont(GilroyLight);
  textSize(textLarge/2);
  text("Score: "+score, width/2, height/2+textLarge/4);
  text("Highscore: "+highscore, width/2, height/2+textLarge/2+textLarge/4);
  textSize(textLarge/3);
  text("[space] -> main menu", width/2, height/3*2);
  
  if (space) {space = false; score = 0; initPuzzle(); mode = INTRO;} // Checks for space press to return to main menu
}
