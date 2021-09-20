// Variables
boolean mouse = false;
boolean yes = false;
boolean no = false;
boolean yesColor = false;
boolean noColor = false;

void mousePressed() {  // 
  
  if (mouseX < width/2 && mouseY > height/2) yesColor = true;  // Color indicator
  if (mouseX > width/2 && mouseY > height/2) noColor = true;
}

void mouseReleased() {
  mouse = false;  // Intro click
  
  //yes = false;
  //no = false;
  yesColor = false;
  noColor = false;
}

void mouseClicked() {
  mouse = true;  // Intro click
  if (mouseX < width/2 && mouseY > height/2) yes = true;  // Game clicks
  if (mouseX > width/2 && mouseY > height/2) no = true;
}


void keyPressed() {
  if (key == CODED) {
    switch(keyCode){
      case LEFT: yes = true; yesColor = true; break;
      case RIGHT: no = true; noColor  = true; break;
    }
  }
}

void keyReleased() {
  if (key == CODED) {
    switch(keyCode){
      case LEFT: yes = false; yesColor = false; break;
      case RIGHT: no = false; noColor  = false; break;
    }
  }
}
