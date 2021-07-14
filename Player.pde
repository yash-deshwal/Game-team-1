//Rudra write your code here!
class Player{
  //new variable for images
  PImage playerImg;
  PImage playerImg1;
  PImage playerImg2;
  
  //new pimage arrays
  PImage [] playerUp;
  
  PVector position;
  
  // for incrementing the position
  int index;
  
  //for frameCount
  int count;
  
  public Player(float x, float y){
    
    //Initialising the arrays of pimage
    playerUp = new PImage[2];
    
    //Loading image here
    
    playerImg1 = loadImage("images/pl1.png");
    playerImg2 = loadImage("images/pl2.png");
    //playerImg1.resize(100,100);
    
    //Giving arrays the image
      playerUp[0] = playerImg1;
      playerUp[1] = playerImg2;
      
      
    
    //resizing the images
    playerUp[0].resize(80,180);
    playerUp[1].resize(80,180);
    
    
    
    // for incrementing the position
   index=0;
   
   //for frameCount
   count=25;
    
    
    position = new PVector(x,y);
  }
  
  
  //public void direction(){
  
  //    if (keyCode==LEFT || key=='a') {
  //    display(playerUp);
      
  //    //giving some speed to move left
  //    position.x -= 3;
  //  }
      
  //    else if (keyCode==RIGHT || key =='d'){
  //      display(playerUp);
        
  //      //giving some speed to move left
  //      position.x += 3;
  //  }
      
  //    else {
  //      //default animation
  //      display(playerUp);
  //    }
  
  //}
  
  
  public void moveLeft(){
    display(playerUp);
    position.x -= 3;
  }
  
  public void moveRight(){
    display(playerUp);
    position.x += 3;
  }
  
  
  public void display(PImage[] pimage){
    
    //Displaying the image
    image(pimage[index], position.x,position.y);
    if (frameCount%count==0){
      //incrementing index so that it moves to next image
      index++;
      //if statement to return index back to 0 i.e 1st image so that it animates.
      if (index>pimage.length-1){
        index=0;
      }
    }
    
  }
  
  
  
}
