void gameScreen() {
fill(255); // White
  arc(paddleX, paddleY, paddleWidth, paddleHeight, PI, TWO_PI, CHORD); // CHORD makes it filled

  
  // Simple movement (add to existing keyPressed)
  if (keyPressed) {
    if (keyCode == LEFT) paddleX -= 8;
    if (keyCode == RIGHT) paddleX += 8;
  }
  
  // Keep paddle on screen
  paddleX = constrain(paddleX, paddleWidth/2, width-paddleWidth/2);
 
 
 
}void mousePressed() {
  if (mode == INTRO) {
    mode = GAME; 
  }
}
