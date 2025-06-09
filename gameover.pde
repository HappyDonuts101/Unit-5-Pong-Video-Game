void gameOverScreen() {
  background(0);
  textSize(80);
  fill(255);
  text("GAME OVER", width/2, height/2 - 50);
  textSize(40);
  text("Final Score: " + score, width/2, height/2 + 50);
  text("Click to restart", width/2, height/2 + 150);
}

void winScreen() {
  background(darkblue);
  textSize(80);
  fill(white);
  text("YOU WIN!", width/2, height/2 - 50);
  textSize(40);
  text("Final Score: " + score, width/2, height/2 + 50);
  text("Click to play again", width/2, height/2 + 150);
}
