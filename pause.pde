void pauseScreen() {
  // Semi-transparent overlay
  fill(0, 0, 0, 150);
  rect(0, 0, width, height);
  
  // Pause text
  textSize(100);
  fill(255);
  text("PAUSED", width/2, height/2 - 50);
  
  // Instructions
  textSize(40);
  text("Press ESC to continue", width/2, height/2 + 50);
  text("Score: " + score, width/2, height/2 + 120);
  text("Lives: " + lives, width/2, height/2 + 180);
}
