//for 2player movement try and use array of booleans
// assign menus and sound


//Rudra write your code here!
class Player {
  //new variable for images

  //PImage playerImg;
  //PImage playerImgL1;
  //PImage playerImgL2;
  //PImage playerImgR1;
  //PImage playerImgR2;

  //new pimage arrays
  PImage playerDefault;
  PImage [] playerLeft;
  PImage [] playerRight;

  PVector position;

  //for direction
  int[] keyCodes = {37, 39, 65, 68};
  
  //size of the space shooter
  int size;

  // for incrementing the position
  int index;

  //for frameCount
  int count;

  public Player(float x, float y, PImage plImg, PImage plImgLeft1, PImage plImgLeft2, PImage plImgRight1, PImage plImgRight2) {

    //Initialising the arrays of pimage
    //player = new PImage[5];
    playerLeft = new PImage[2];
    playerRight = new PImage[2];

    
    playerLeft[0] = plImgLeft1;
    playerLeft[1] = plImgLeft2;
    playerRight[0] = plImgRight1;
    playerRight[1] = plImgRight2;

    
    //Default image without any animation
    playerDefault =  plImg;
    
    //size of the space shooter
    size = 100;

    //resizing the images
    playerDefault.resize(100, 100);
    playerLeft[0].resize(100, 100);
    playerLeft[1].resize(100, 100);
    playerRight[0].resize(100, 100);
    playerRight[1].resize(100, 100);

  


    // for incrementing the position
    index=0;

    //for frameCount
    count=10;


    position = new PVector(x, y);
  }


  //public void direction() {

  //  if (keyCode==LEFT || key=='a') {
  //    display(playerLeft);

  //    //giving some speed to move left
  //    position.x -= 5;
  //  } else if (keyCode==RIGHT || key =='d') {
  //    display(playerRight);

  //    //giving some speed to move left
  //    position.x += 5;
  //  } else {
  //    display(playerDefault);
  //  }
  //}


  //public void moveLeft(){
  //  display(playerLeft);
  //  position.x -= 3;
  //}

  //public void moveRight(){
  //  display(playerRight);
  //  position.x += 3;
  //}

  public void defaultImage(PImage pimage){
     image(pimage, position.x, position.y);
  }

  public void display(PImage[] pimage) {

    //println(index);
    //Displaying the image
    image(pimage[index], position.x, position.y);

    if (frameCount%count==0) {
      //incrementing index so that it moves to next image
      index++;
      //if statement to return index back to 0 i.e 1st image so that it animates.
      if (index>pimage.length-1) {
        index=0;
      }
    }
  }

  public void inputPlayer() {
    //if (keyPressed){
    //if (keyCode == keyCodes[0]) {
    //  display(playerLeft);
    //  position.x -= 5;
    //} else if (keyCode == keyCodes[1]) {
    //  display(playerRight);
    //  position.x += 5;
    //}
     if (keyCode == keyCodes[2]) {
      display(playerLeft);
      position.x -= 5;
    } else if (keyCode == keyCodes[3]) {
      display(playerRight);
      position.x += 5;
    }
    
    else {
      defaultImage(playerDefault);
    }
    checkBounds();
  }

  //void inputPlayer2() {
  //  //if (keyPressed){
  //  if (key == keys[0]) {
  //    display(playerLeft);
  //    position.x -= 1;
  //  } else if (key == keys[1]) {
  //    display(playerRight);
  //    position.x += 1;
  //  }
  //  //} 
  //  else {
  //    defaultImage(playerDefault);
  //  }
  //}
  
  public void checkBounds(){
    if (position.x > width){
      position.x = -size;
    }
    if (position.x < -size){
      position.x = width;
    }
  }
  
  
}
