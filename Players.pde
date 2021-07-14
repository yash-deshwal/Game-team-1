//Rudra write your code here!
class Player{
  PImage playerImg;
  //PImage playerImg2;
  
  PVector position;
  
  public Player(float x, float y){
    //Loading image here
    playerImg = loadImage("player1.jpg");
    playerImg.resize(100,100);
    
    position = new PVector(x,y);
  }
  
  public void display(){
    
    image(playerImg, position.x,position.y);
    
  }
  
  
  
}
