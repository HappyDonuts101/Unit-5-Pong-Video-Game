color white = #FFFFFF;
color black = #000000;
color red = #ff0000;

//mode variables
int mode;

final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
int GAMEOVER = 3;
final float MAX_BALL_SPEED = 15;  // Maximum speed the ball can reach


// Player variables
float p1x, p1y, p1d;
float p2x, p2y, p2d;

boolean wkey, akey, skey, dkey;
boolean upkey, leftkey, downkey, rightkey;

// Ball variables
float ballx, bally, balld;
float vx, vy; 

void setup() {
  size(1300, 1200, P2D);

  // Initialize player positions
  p1x = 75;  
  p1y = height / 2;
  p1d = 150;  

  p2x = width - 75;  
  p2y = height / 2;
  p2d = 150;  

  // Initialize ball position and velocity
  ballx = width / 2;
  bally = height / 2;
  balld = 80;  

  vx = 3;
  vy = 5;
  
  mode=GAME;
}

void draw() {
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == GAMEOVER) {
    gameOver();
  } else {
    println("Error, mode is " + mode);
  }
}
