void game() {
   background(255);
  strokeWeight(5);

  
  p1x = constrain(p1x, p1d / 2, width - p1d / 2);
  p1y = constrain(p1y, p1d / 2, height - p1d / 2);
  p2x = constrain(p2x, p2d / 2, width - p2d / 2);
  p2y = constrain(p2y, p2d / 2, height - p2d / 2);
ballx = constrain(ballx, balld / 2, width - balld / 2);
bally = constrain(bally, balld / 2, height - balld / 2);

  // Draw players
  fill(0);
  circle(p1x, p1y, p1d);

  fill(255);
  circle(p2x, p2y, p2d);

  // Draw ball
  fill(255, 0, 0);
  circle(ballx, bally, balld);

  // Player 1 movement
  if (wkey) p1y -= 10;
  if (akey) p1x -= 10;
  if (skey) p1y += 10;  
  if (dkey) p1x += 10;

  // Player 2 movement
  if (upkey) p2y -= 10;
  if (downkey) p2y += 10;
  if (leftkey) p2x -= 10;
  if (rightkey) p2x += 10;

  // Ball movement
  ballx += vx;
  bally += vy;

// Keep the ball inside screen bounds
ballx = constrain(ballx, balld / 2, width - balld / 2);
bally = constrain(bally, balld / 2, height - balld / 2);


  
  if (bally <= balld / 2 || bally >= height - balld / 2) {
    vy *= -1;
  }

 
  if (ballx <= balld / 2 || ballx >= width - balld / 2) {
    vx *= -1;
  }


  // Player 2 collision (simplified)
if (dist(p2x, p2y, ballx, bally) <= p2d / 2 + balld / 2) {
  // Push the ball slightly away from the player
  ballx += (ballx - p2x) * 0.1;
  bally += (bally - p2y) * 0.1;

  // Reverse direction
  vx = (ballx - p2x) / 10;
  vy = (bally - p2y) / 10;
}

// Player 1 collision (simplified)
if (dist(p1x, p1y, ballx, bally) <= p1d / 2 + balld / 2) {
  ballx += (ballx - p1x) * 0.1;
  bally += (bally - p1y) * 0.1;

  vx = (ballx - p1x) / 10;
  vy = (bally - p1y) / 10;
}
}
