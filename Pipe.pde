class pipe
{
  int[] pipeX, pipeY;
  PImage upPipe, downPipe;
  int score;
  
  pipe()
  {
  pipeX = new int[4]; 
  pipeY = new int[pipeX.length];
  }
  
  void pipeMove()
  {
    for(int i=0; i<pipeX.length; i++){
    pipeX[i] = 400 + 300*i; //after loop 400px, the first pipe will appear. And the distance between two pipes is 300px (horizontal)
    pipeY[i]= (int)random(-250, 0); //generate random length which will be deducted by the original pipe length
    }
  }
  
  void setPipes(){
    
    for(int i=0; i<pipeX.length; i++){
    image(downPipe, pipeX[i], pipeY[i]);
    image(upPipe, pipeX[i], 450 + pipeY[i]); //450 is the distance between up pipes and down pipes
    pipeX[i]-=speed; //moving backward speed of pipes
        if(pipeX[i] < -300){ //when the previous pipe go out of the screen at the left side, we generate a new one at the right side
        pipeX[i] = width;
        }
        if(bird1.birdx + 40 > pipeX[i] && bird1.birdx < pipeX[i] + 98) //98 is width of pipes, +40 is to check if the right side of bird collide the pipe
        {
            // if bird is not in the gap of two pipes (up pipe and down pipe)
            if(!(bird1.birdy > pipeY[i] + 300 && bird1.birdy + 36 < pipeY[i] + 300 + 150)){ 
              gameState=-1; //lose the game
              die.play();
            }
            else if (bird1.birdx==pipeX[i]){
            win.play();
            score++;
            }
         }
      } 
  }
  
  
  PImage getDown()
  {
    return this.downPipe;
  }
  
  PImage getUp()
  {
    return this.upPipe;
  }
  
  int getScore()
  {
    return this.score;
  }
  
}
