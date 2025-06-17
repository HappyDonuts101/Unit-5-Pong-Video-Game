// COLORS
color darkblue = #064780;
color black = #000000;
color white = #FFFFFF; 
color pink = #ef7a85;
color purple = #b298dc;
color red = #b23a48;
color lightblue = #ADD8E6; 
color orange = #FFA500;
color green = #00FF00;

// Brick variables
int[] x, y;
int brickd; 
int n; 
int tempx, tempy; 
int[] rowIndex;

// Game variables
int rows = 5; // Now properly set to 5 rows
int cols = 7; // Changed from 10 to 7 to match your brick spacing
float brickWidth;
float brickHeight = 30;
boolean[][] bricks;




// Game state
int lives = 3;
int score = 0;
final int INTRO = 0;
final int GAME = 1;
final int GAMEOVER = 2;
final int WIN = 3; 
final int PAUSE = 4; 
int mode = INTRO;

// Font
PFont waltograph;
float TextSize = 195; 
boolean growing = true;

// Paddle position - moved higher (old: 900, new: 800)
float paddleX, paddleY = 800; // Now visible with good spacing
float paddleWidth = 100;
float paddleHeight = 100;

// Ball
float ballx, bally, balld = 30;
float vx, vy; 

// Player controls
boolean wkey, akey, skey, dkey;
boolean upkey, leftkey, downkey, rightkey;

void setup() {
  size(920, 1000); 
  waltograph = createFont("waltograph42.otf", TextSize);
  textAlign(CENTER, CENTER);
  
  // Initialize game elements
  paddleX = width/2; 
  ballx = width/2;
  bally = height/2;
  vx = -2;
  vy = 2;
  //Initalize row index
  rowIndex = new int[n];

  // Initialize bricks
  brickWidth = width/cols;
  bricks = new boolean[rows][cols];
  for (int r = 0; r < rows; r++) {
    for (int c = 0; c < cols; c++) {
      bricks[r][c] = true;
    }
  }
  
  // Setup circular bricks
  brickd = 50;
  n = 42; 
  x = new int[n];
  y = new int[n];
  
 // Initialize bricks (now only 5 rows)
  tempx = 100;
  tempy = 150; // Start higher (old: 100, new: 150)
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


void draw() {
  background(darkblue);
  
  switch(mode) {
    case INTRO: introScreen(); break;
    case GAME: gameScreen(); break;
    case GAMEOVER: gameOverScreen(); break;
    case WIN: winScreen(); break;
    case PAUSE: 
      gameScreen(); // Draw game first
      pauseScreen(); // Then overlay pause
      break;
  }
}

void introScreen() {
  if (growing) {
    TextSize += 1;
    if (TextSize > 195) growing = false;
  } else {
    TextSize -= 1;
    if (TextSize < 150) growing = true;
  }
  
  waltograph = createFont("waltograph42.otf", TextSize);
  fill(black);
  textFont(waltograph);
  text("Breakout!", width/2, height/3);
  
  textSize(50);
  fill(black);
  text("Click anywhere to start", width/2, height/1.75);
}
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
  bally = paddleY - 150; // Start higher above paddle
  vx = random(-3, 3);
  vy = 4; // Moderate initial speed
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
}void gameOverScreen() {
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
}void keyPressed() {
  if (key == 'w' || key == 'W') wkey = true;
  if (key == 'd' || key == 'D') dkey = true;
  if (keyCode == LEFT) leftkey = true;
  if (keyCode == RIGHT) rightkey = true;
  

  if (keyCode == ESC && mode == GAME) {
    mode = PAUSE;
  } else if (keyCode == ESC && mode == PAUSE) {
    mode = GAME; 
  }
}void pauseScreen() {
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
