
void gameScreen() {
  // Draw paddle
  fill(255);
  arc(paddleX, paddleY, paddleWidth, paddleHeight, PI, TWO_PI, CHORD); 
  
  // Paddle movement
  if (keyPressed) {
    if (keyCode == LEFT) paddleX -= 8;
    if (keyCode == RIGHT) paddleX += 8;
  }
  if (wkey) paddleX -= 8;
  if (dkey) paddleX += 8;
  paddleX = constrain(paddleX, paddleWidth/2, width-paddleWidth/2);
  
  for (int i = 0; i < n; i++) {
    manageBrick(i);
  }
  
 
  
  // Draw score and lives
  textSize(70);
  fill(red);
  text("score: " + score, width/4.9, height/1.55);
  text("lives: " + lives, width/1.2, height/1.55);
  
  // Ball movement and collisions
  updateBall();
}

void manageBrick(int i) {
  // Set brick colors - using new lightblue for bottom row
  if (y[i] == 100) fill(pink);
else if (y[i] == 200) fill(purple);
else if (y[i] == 300) fill(red);
else if (y[i] == 400) fill(lightblue);
else if (y[i] == 500) fill(orange);

else fill(white);
  
  circle(x[i], y[i], brickd);
  
  // Brick collision
  if (dist(ballx, bally, x[i], y[i]) < balld/2 + brickd/2) {
    vx = (ballx - x[i])/3;
    vy = (bally - y[i])/3;
    y[i] = -1000; // Remove brick
    score += 1;
    
    //Check for win condition
    if(score>=42) {
      mode=WIN;
    }
  }
}

void updateBall() {
  // Draw ball
  strokeWeight(5);
  fill(white);
  circle(ballx, bally, balld);
  
  // Move ball
  ballx += vx;
  bally += vy;
  
  //Wall Collison
if (bally <= 0) vy *= -1;
if (ballx <= 0 || ballx >= width) vx *= -1;
  
  // Paddle collision
  if (bally + balld/2 > paddleY - paddleHeight/2 && 
      bally - balld/2 < paddleY + paddleHeight/2 &&
      ballx > paddleX - paddleWidth/2 - balld/2 &&
      ballx < paddleX + paddleWidth/2 + balld/2) {
    float hitPos = (ballx - paddleX) / (paddleWidth/2);
    vx = hitPos * 5;
    vy = -8;
    bally = paddleY - paddleHeight/2 - balld/2;
  }
  
  // Bottom collision
  if (bally - balld/2 > height) {  
    lives--;
    if (lives <= 0) {
      mode = GAMEOVER;
    } else {
      resetBall();
    }
  }
}

void resetBall() {
  ballx = width/2;
  bally = height/2;
  vx = random(-3, 3);
  vy = 4;
}

void mousePressed() {
  if (mode == INTRO || mode == GAMEOVER) {
    // Reset game state
    mode = GAME;
    lives = 3;
    score = 0;
    resetBall();
    
    // Reset bricks
    for (int r = 0; r < rows; r++) {
      for (int c = 0; c < cols; c++) {
        bricks[r][c] = true;
      }
    }
    
    // Reset circular bricks
    tempx = 100;
    tempy = 100;
    for (int i = 0; i < n; i++) {
      x[i] = tempx;
      y[i] = tempy;
      tempx += 120;
      if (tempx > width-100) {
        tempx = 100;
        tempy += 100; 
      }
    }
  }
}
