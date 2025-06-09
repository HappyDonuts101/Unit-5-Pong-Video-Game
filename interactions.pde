void keyPressed() {
  if (key == 'w' || key == 'W') wkey = true;
  if (key == 'd' || key == 'D') dkey = true;
  if (keyCode == LEFT) leftkey = true;
  if (keyCode == RIGHT) rightkey = true;
  

  if (keyCode == ESC && mode == GAME) {
    mode = PAUSE;
  } else if (keyCode == ESC && mode == PAUSE) {
    mode = GAME; 
  }
}
