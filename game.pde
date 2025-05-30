void gameScreen() {
fill(255);
  arc(paddleX, paddleY, paddleWidth, paddleHeight, PI, TWO_PI, CHORD); 
  
  if (keyPressed) {
    if (keyCode == LEFT) paddleX -= 7;
    if (keyCode == RIGHT) paddleX += 7;
  }
  
  paddleX = constrain(paddleX, paddleWidth/2, width-paddleWidth/2);
 //Paddle
  if (wkey) paddleX -= 8;
  if (dkey) paddleX += 8;
  
  textSize(70);
 
  fill(red);
  text("score:", width/4.9, height/1.55);
  
  textSize(70);
  fill(red);
  text("lives:", width/1.2, height/1.55);
  
  //ball
  strokeWeight(5);
fill(white);
circle(ballx, bally, balld);

  //ball movement
   ballx= ballx + vx;
   bally= bally+vy;
  
  if(bally<=0) vy = vy *-15;
   if(bally>=height) vy = vy *-15;
   if(ballx<=0) vx = vx *-15;
   if(ballx>=width) vx = vx *-15;
   
  if (dist(paddleX, paddleY, ballx, bally) <= paddleWidth/2 + balld/2) {
    
    
  }
 
}void mousePressed() {
  if (mode == INTRO) {
    mode = GAME; 
  }
}
