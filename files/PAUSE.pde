void paused() {
  background(240);
  fill(100);
  textAlign(CENTER);
  textFont(GilroyBold);
  textSize(textLarge);
  text("pause();", width/2, height/2+15*scaleY);
  textFont(GilroyLight);
  textSize(textLarge/3);
  text("switch back to this window to resume", width/2, height/2+50*scaleY);
  
  if(focused) {mode=GAME;}
}
