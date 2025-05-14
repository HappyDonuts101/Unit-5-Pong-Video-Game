color white = #FFFFFF;
color black = #000000;
color red = #ff0000;


//mode variables
int mode;
int player1Score = 0;
int player2Score = 0;

final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
int GAMEOVER = 3;
final float MAX_BALL_SPEED = 15;  // Maximum speed the ball can reach

float goalWidth = 30; 
float goalHeight;     
float leftGoalX;       
float rightGoalX;     
float goalY;          

// Player variables
float p1x, p1y, p1d;
float p2x, p2y, p2d;

boolean wkey, akey, skey, dkey;
boolean upkey, leftkey, downkey, rightkey;

// Ball variables
float ballx, bally, balld;
float vx, vy; 

void setup() {
  size(2000, 1700, P2D);
  goalHeight = height / 2.2;      
  leftGoalX = 0;                
  rightGoalX = width-goalWidth ;  
  goalY = (height - goalHeight) / 2.2; 

  // Initialize player positions
  p1x = 75;  
  p1y = height / 2;
  p1d = 200;  

  p2x = width - 75;  
  p2y = height / 2;
  p2d = 200;  


  ballx = width / 2;
  bally = height / 2;
  balld = 125;  

  vx = -2;
  vy = 2;
  
  mode=INTRO;
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

void mouseReleased() {
  if (mode == INTRO) {
    mode = GAME; 
  } 
  else if (mode == GAME) {
    mode = PAUSE; 
  }
  else if (mode == PAUSE) {
    mode = GAME; 
  }
  else if (mode == GAMEOVER) {
    mode = INTRO; 
   
    player1Score = 0;
    player2Score = 0;
    resetBall();
  }
}
