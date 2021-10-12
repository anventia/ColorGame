


void game() {   
  
  background(0);
  
  // GameObjects //
  int i = 0;
  while(i < myObjects.size()) {
    gameObject obj = myObjects.get(i);
    int l = obj.lives;
    obj.show();
    obj.act();
    
    if(l == 0) myObjects.remove(i);  // die
    else i++;
  }
  
  
  // Score //
  fill(255);
  textAlign(RIGHT);
  textSize(35*scaleY);
  text(score+" / "+goal, width-10*scaleX, height-20*scaleY);
  
  if(score == goal) {  // Game over, will add fade effect later
    win = true;
    mode = GAMEOVER;
  }
  
  
  // Fade In // 
  if(fade) {
    rectMode(CORNER);
    fill(0,map(fadeCount, 0,59,255,0));
    noStroke();
    rect(0,0, width,height);
    int j = 0;
    while(j < myObjects.size()) {  // Draw ship over fade in rectangle, so it doesn't fade in
      gameObject obj = myObjects.get(j);
      if(obj instanceof Ship) {
        obj.show();
      }
      j++;
    }
      
    fadeCount++;
    if(fadeCount == 60) {fade = false;}
  }
  
  
  
  
}
