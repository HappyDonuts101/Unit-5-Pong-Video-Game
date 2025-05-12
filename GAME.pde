void gameClicks() {
  mode=GAME;
}

void game() {
  // Setup frame
  background(255);
  strokeWeight(5);

  // Constrain all objects to screen bounds
  constrainObjects();

  // Draw all game objects
  drawObjects();

  // Handle all movement
  handleMovement();

  // Handle all collisions
  handleCollisions();
}

void constrainObjects() {
  // Players
  p1x = constrain(p1x, p1d/2, width-p1d/2);
  p1y = constrain(p1y, p1d/2, height-p1d/2);
  p2x = constrain(p2x, p2d/2, width-p2d/2);
  p2y = constrain(p2y, p2d/2, height-p2d/2);
  
  // Ball
  ballx = constrain(ballx, balld/2, width-balld/2);
  bally = constrain(bally, balld/2, height-balld/2);
}

void drawObjects() {
  // Players
  fill(0);
  circle(p1x, p1y, p1d);
  fill(255);
  circle(p2x, p2y, p2d);
  
  // Ball
  fill(255, 0, 0);
  circle(ballx, bally, balld);
}

void handleMovement() {
  // Player 1
  if (wkey) p1y -= 15;
  if (akey) p1x -= 15;
  if (skey) p1y += 15;  
  if (dkey) p1x += 15;

  // Player 2
  if (upkey) p2y -= 15;
  if (downkey) p2y += 15;
  if (leftkey) p2x -= 15;
  if (rightkey) p2x += 15;

  // Ball
  ballx += vx;
  bally += vy;
}

void handleCollisions() {
  // Wall collisions
  if (bally <= balld/2 || bally >= height-balld/2) {
    vy *= -1.3;
    limitBallSpeed();
  }
  if (ballx <= balld/2 || ballx >= width-balld/2) {
    vx *= -1.3;
    limitBallSpeed();
  }

  // Player collisions
  if (dist(p2x, p2y, ballx, bally) <= p2d/2 + balld/2) {
    handlePaddleCollision(p2x, p2y);
  }
  if (dist(p1x, p1y, ballx, bally) <= p1d/2 + balld/2) {
    handlePaddleCollision(p1x, p1y);
  }
}

void handlePaddleCollision(float px, float py) {
  ballx += (ballx - px) * 0.1;
  bally += (bally - py) * 0.1;
  vx = (ballx - px)/10;
  vy = (bally - py)/10;
  limitBallSpeed();
}

void limitBallSpeed() {
  float currentSpeed = sqrt(vx*vx + vy*vy);
  if (currentSpeed > MAX_BALL_SPEED) {
    float scaleFactor = MAX_BALL_SPEED/currentSpeed;
    vx *= scaleFactor;
    vy *= scaleFactor;
  }
}
