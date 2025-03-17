class bird
{
  float g, Vbirdy, birdx, birdy;
  PImage birdp;
  
  
  bird()
  {
    birdx = 100;
    birdy = 50;  
    g = 0.5;
    
  }
  
  float getX()
  {
    return this.birdx;
  }
  
  float getY()
  {
    return this.birdy;
  }
  
  PImage getImage()
  {
    return this.birdp;
  }
  
  
  
  void birdMove()
{
  image(birdp, birdx, birdy);
  birdy = birdy + Vbirdy;
  Vbirdy = Vbirdy + g;
  if(birdy > height || birdy < 0)
  {
    gameState = -1;
    die.play();
  }
}

}
