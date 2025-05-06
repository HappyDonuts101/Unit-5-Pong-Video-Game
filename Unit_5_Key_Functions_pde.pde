color white = #FFFFFF;
color black = #000000;
color red = #ff0000;

//mode variables
int mode;

final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
int GAMEOVER = 3;


// Player variables
float p1x, p1y, p1d;
float p2x, p2y, p2d;

boolean wkey, akey, skey, dkey;
boolean upkey, leftkey, downkey, rightkey;

// Ball variables
float ballx, bally, balld;
float vx, vy; 

void setup() {
  size(600, 600, P2D);

  // Initialize player positions
  p1x = 50;
  p1y = height / 2;
  p1d = 100;

  p2x = width - 50;
  p2y = height / 2;
  p2d = 100;

  // Initialize ball position and velocity
  ballx = width / 2;
  bally = height / 2;
  balld = 50;

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
