void gameScreen() {
fill(255);
  arc(paddleX, paddleY, paddleWidth, paddleHeight, PI, TWO_PI, CHORD); 
  
  if (keyPressed) {
    if (keyCode == LEFT) paddleX -= 8;
    if (keyCode == RIGHT) paddleX += 8;
  }
  
  //BRICKS==============================================
//  circle(x[0],y[0],brickd);
 //circle(x[1],y[1],brickd);
 //circle(x[2],y[2],brickd);
  
  int i = 0;
  while(i<n) {
    circle(x[i],y[i],brickd);
     if(dist(ballx,bally,x[i],y[i]) < balld/2 + paddleWidth/2) {
   vx=(ballx-x[i])/10;
   vy=(bally-y[i])/10;
  }
    i= i+1;
    
  }
  
 
  
  
  
  paddleX = constrain(paddleX, paddleWidth/2, width-paddleWidth/2);
 //Paddle
  if (wkey) paddleX -= 8;
  if (dkey) paddleX += 8;
  
  textSize(70);
 
  fill(red);
  text("score: 0", width/4.9, height/1.55);
  
  textSize(70);
  fill(red);
  text("lives: 3", width/1.2, height/1.55);
  
  //ball
  strokeWeight(5);
fill(white);
circle(ballx, bally, balld);

  //ball movement
   ballx= ballx + vx;
   bally= bally+vy;
  
  if(bally<=0) vy = vy *-8;
   if(ballx<=0) vx = vx *-8;
   if(ballx>=width) vx = vx *-8;
   
// Paddle collision with ball
if (dist(paddleX, paddleY, ballx, bally) <= paddleWidth/2 + balld/2) {
  vx = (ballx - paddleX) / 10;  
  vy = -abs((bally - paddleY) / 10); 
  
    bally = paddleY - paddleHeight/2 - balld/2;
  
  
}
//Array function
for (int r = 0; r < rows; r++) {
  for (int c = 0; c < cols; c++) {
    if (bricks[r][c]) {
      float x = c * brickWidth + 5;         
      float y = r * (brickHeight + 10) + 60; 
      
      fill(brickColors[r % brickColors.length]); 
      stroke(white);
      rect(x, y, brickWidth - 10, brickHeight); 
    }
  }
}
for (int r = 0; r < rows; r++) {
  for (int c = 0; c < cols; c++) {
    if (bricks[r][c]) {
      float x = c * brickWidth + 5;
      float y = r * (brickHeight + 10) + 60;
      float w = brickWidth - 10;
      float h = brickHeight;

      if (ballx + balld/2 > x && ballx - balld/2 < x + w &&
          bally + balld/2 > y && bally - balld/2 < y + h) {
        bricks[r][c] = false;
        vy *= -1;
        break;
      }
    }
  }
}


// WALL Collisons
if (ballx < balld/2) {          // Left wall
  ballx = balld/2;
  vx = abs(vx);                 // Bounce right
}
if (ballx > width-balld/2) {    // Right wall
  ballx = width-balld/2;
  vx = -abs(vx);                // Bounce left
}
if (bally < balld/2) {          // Top wall
  bally = balld/2;
  vy = abs(vy);                 // Bounce down
}
if (bally - balld/2 > height) {  
  lives--;
  
  if (lives <= 0) {
    mode = GAMEOVER;
  } else {
    resetBall();
  }
}


}void mousePressed() {
  if (mode == INTRO) {
    mode = GAME; 
  }
}

void resetBall() {
  ballx = width / 2;
  bally = height / 2;
  vx = random(-3, 3);
  vy = 4;
}
