void gameOver() {
  
  background(0);
  
  String text = "";  // Changes text based on win or loss
  if(win) text = "You won!";
  else    text = "You lost!";
  
  textSize(100);
  textAlign(CENTER);
  fill(255);
  text("gAMe ovEr!", width/2,height/2);  // Title text
  
  textSize(50*scaleY);
  text(text, width/2,height/2+100*scaleY);  // You won/lost text
}
