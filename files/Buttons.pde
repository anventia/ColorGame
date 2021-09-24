// Variables
boolean space = false;
boolean yes = false;
boolean no = false;
boolean trueColor = false;
boolean falseColor = false;

void mousePressed() {
  
}

void mouseReleased() {

}

void mouseClicked() {
  if (mode == GAME) {
    if (mouseX < width/2 && mouseY > height/2) yes = true;  // Game clicks
    if (mouseX > width/2 && mouseY > height/2) no = true;
  }
}


void keyPressed() {
  if (key == CODED) {  // Detects left and right arrows
    switch(keyCode){
      case LEFT: yes = true; trueColor = true; break; 
      case RIGHT: no = true; falseColor  = true; break;
    }
  }
}

void keyReleased() {
  if (key == CODED) {
    switch(keyCode){
      case LEFT: yes = false; trueColor = false; break;
      case RIGHT: no = false; falseColor  = false; break;
    }
  }
  if (key == ' ') space = true;
}
