//Fonts 
PFont  font;

//Colors
color darkblue= #5833ff;
color purple = #7600c7;
color mango = #C7C100;
color orange = #c78300;
color green = #00c71c;
color white = #FFFFFF;
color black = #000000;

//Mode Variables
int mode;

final int INTRO = 1;
final int GAME = 2;
final int PAUSE = 3;
final int GAMEOVER = 4;

//intro GUI
float a;

//Game entities
float bx, by, bd, vx, vy, px, py, pd;

//Keyboard variables
boolean akey, dkey;

void setup() {
  size(800,800);
  font= loadFont("TwCenMT40.vlw");
  textFont(font);

}

void draw() {
 background(102);
 text("something clever", 26, 30);
  
}
