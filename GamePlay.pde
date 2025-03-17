import processing.sound.*;

PImage bg, start;
PFont font;
int bgx, bgy, speed;
bird bird1 = new bird();
pipe Pipe = new pipe();
int gameState=1;
SoundFile win;
SoundFile die;


void setup()
{
  size(900,500);
  start = loadImage("start.png");
  bg = loadImage("FlappyBirdBG.png");
  bird1.birdp = loadImage("bird2.png");
  Pipe.downPipe= loadImage("pipeDown.png");
  Pipe.upPipe= loadImage("pipe.png");
  Pipe.pipeMove();
  win = new SoundFile(this, "Point.mp3");
  die = new SoundFile(this, "die.mp3");

}


void draw()
{
  if(gameState==1){
    startScreen();
  }
  if(gameState==0)
  {
  setBg();
  Pipe.setPipes();
  bird1.birdMove();
  score();
  }
  if(gameState==-1)
  {
    textSize(50);
    text("YOU LOSE!", 320, 250);
  }
  }


void startScreen(){
  image(start,0,0);
  textSize(40);
  font = loadFont("Chalkboard-Bold-30.vlw");
  textFont(font);
  text("Click a for difficult level and start", 200, 400);
  text("Click b for easy level and start", 200, 450);
}
  
 void score()
{
  textSize(30);
  text("Score: " + Pipe.score, width - 170, 50);
  font = loadFont("Chalkboard-Bold-30.vlw");
  textFont(font);
}

void keyPressed(){
  if(key == ' '){
    bird1.Vbirdy = -7;
  }
  if(key=='a'){
    speed=5;
    gameState=0;
  }
  if(key=='b'){
    speed=2;
    gameState=0;
  }
  
}


void setBg()
{
  image(bg, bgx, bgy);
  image(bg, bgx + bg.width, bgy);
  bgx = bgx -1;
  if(bgx < -bg.width)
  {
    bgx = 0; //reset it once first image is done
  }
}
