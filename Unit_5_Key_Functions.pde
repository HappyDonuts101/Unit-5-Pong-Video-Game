//Color Palleete-------
color white=#FFFFFF;
color black=#000000;

// Player 1 Variables
float x, y, d;
int points;

//Player 2 Variables
float x2,y2,d2;

// Keyboard Variables
boolean wKey, sKey, aKey, dKey, upKey, downKey, leftKey, rightKey;

void setup() {
  size(600, 600, P2D);
  white = color(255);
  black = color(0);
  x = width / 2;
  y = height / 2;
   d = 100;
   
   x2= width/2;
   y2= height/2;
   d2=100;
}

void draw() {
  background(white);

  // Player 1
  strokeWeight(5);
  stroke(black);
  fill(white);
  circle(x, y, d);

strokeWeight(5);
  stroke(white);
  fill(black);
  circle(x2, y2, d2);
  // Movement
  if (wKey) y = y-5;
  if (sKey) y = y+5;
  if (aKey) x = x-5;
  if (dKey) x = x+5;
  
  if(upKey) y2=y2-5;
  if(downKey) y2=y2+5;
  if(leftKey) x2=x2-5;
  if(rightKey) x2=x2+5;
}

void keyPressed() {
  if (key == 'w') wKey = true; //Non character keys
  if (key == 's') sKey = true;
  if (key == 'a') aKey = true;
  if (key == 'd') dKey = true; 
  if(keyCode == UP) upKey=true;
  if(keyCode == DOWN) downKey=true;
  if(keyCode == LEFT) leftKey=true;
  if(keyCode == RIGHT) rightKey=true;
}

void keyReleased() {
  if (key == 'w') wKey = false;
  if (key == 's') sKey = false;
  if (key == 'a') aKey = false;
  if (key == 'd') dKey = false;
  if(keyCode == UP) upKey=false;
  if(keyCode == DOWN) downKey=false;
  if(keyCode == LEFT) leftKey=false;
  if(keyCode == RIGHT) rightKey=false;
  
}
