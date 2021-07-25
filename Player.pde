//Rudra write your code here!
class Player {

  //new pimage arrays
  PImage playerDefault;
  PImage [] playerLeft;
  PImage [] playerRight;

  PVector position;

  String playerLabel;
  
  String playerHealthLabel;
  
  PVector healthBarLabelLoc;


  //for direction
  //put array of size 2 inside constructor and call 37,39 for player1 and 65 and 68 for player 2
  int[] keyCodes;
  //= {37, 39, 65, 68, 32};

  //size of the space shooter
  int size;

  // for incrementing the position
  int index;

  //for frameCount
  int count;
  int health =0;
  boolean hithealth=false;
  float velocity;
  PVector HealthBarloc;

  public Player(float x, float y, PImage plImg, PImage plImgLeft1, PImage plImgLeft2, PImage plImgRight1, PImage plImgRight2, int [] keys, PVector HealthLoc, String text) {

    playerLabel = text;


    //Initialising the arrays of pimage for animation
    playerLeft = new PImage[2];
    playerRight = new PImage[2];

    //assigning images to arrays
    playerLeft[0] = plImgLeft1;
    playerLeft[1] = plImgLeft2;
    playerRight[0] = plImgRight1;
    playerRight[1] = plImgRight2;


    //Default image without any animation
    playerDefault =  plImg;

    //size of the space shooter
    size = 100;
    velocity=5;

    HealthBarloc = HealthLoc;


    //resizing the images
    playerDefault.resize(100, 100);
    playerLeft[0].resize(100, 100);
    playerLeft[1].resize(100, 100);
    playerRight[0].resize(100, 100);
    playerRight[1].resize(100, 100);

    //for direction
    keyCodes = new int[2];

    //assigning keys array to keycodes for movement.
    keyCodes = keys;

    // for incrementing the position
    index=0;

    //for frameCount
    count=20;
    health=10;
    //for position of the player
    position = new PVector(x, y);
  }

  //for displaying the default image if no keys are pressed
  public void defaultImage(PImage pimage) {
    image(pimage, position.x, position.y);
    displayPlayerText();
  }

  //for animatiom 
  public void display(PImage[] pimage) {
    //Displaying the image
    image(pimage[index], position.x, position.y);
    //for smooth animation
    if (frameCount%count==0) {
      //incrementing index so that it moves to next image
      index++;
      //if statement to return index back to 0 i.e 1st image so that it animates.
      if (index>pimage.length-1) {
        index=0;
      }
    }
  }

  public void displayPlayerText() {
    textSize(15);
    fill(180);
    text(playerLabel, position.x + 50, position.y+120);
  }

  //for movement
  public void inputPlayer() {
    //if (keyPressed){
    if (keyCode == keyCodes[0]) {
      display(playerLeft);
      position.x -= velocity;
      displayPlayerText();
    } else if (keyCode == keyCodes[1]) {
      display(playerRight);
      position.x += velocity;
      displayPlayerText();
    } else {
      defaultImage(playerDefault);
    }
    //}

    checkBounds();
  }

  //if player moves out of the screen in right direction it reappears from left side of the screen
  public void checkBounds() {
    if (position.x > width) {
      //changing the position to so that it reappears from left, 
      //why -size? you can give 0 as well but to look good here we are giving the size of the player
      position.x = -size;
    }
    if (position.x < -size) {
      //changing the position to so that it reappears from right, 
      //why width? you can give any value after width as well but to look good here we are giving the width of the screen
      position.x = width;
    }
  }


  public void shoot() {
    // creating new object of bullet at player location and changing color as well giving velocity
    Bullet bullet = new Bullet(position.x+50, position.y, -5, true);
    bullets.add(bullet);
  }

  void drawPlayerHealthBar(String text, PVector textLoc) {

    // Change color
    if (health < 3)
    {
      fill(255, 0, 0);
    } else if (health < 6)
    {
      fill(255, 200, 0);
    } else
    {
      fill(0, 255, 0);
    }
    noStroke();
    rect(HealthBarloc.x, HealthBarloc.y, map(health, 0, 10, 0, 200), 19);

    noFill();
    stroke(255);
    rect(HealthBarloc.x, HealthBarloc.y, 200, 19);
    
    playerHealthLabel = text;
    healthBarLabelLoc = textLoc;
    
    textSize(15);
    fill(180);
    text(playerHealthLabel, healthBarLabelLoc.x, healthBarLabelLoc.y);
  }
  
  //public void 

  void hitCheck() {
    for (int i = 0; i < bullets.size(); i++) {
      Bullet b = (Bullet) bullets.get(i);
      //float distBetween = dist(b.x, b.y, position.x, position.y);
      //// if (this.loc.y+40> b.x && this.loc.x+40> b.y && this.loc.y+40> b.y && this.loc.x+40> b.y
      //if ( distBetween < 100 && b.velocity > -2) 
      if (this.position.x+size >= b.x && b.x + 1 >= this.position.x && this.position.y + 1 >= b.y && b.y + 5 >= this.position.y && b.velocity > 0)
      {

        health--;
        //println(health);
        health=constrain(health, 0, 10);
        if (health==0) {
          this.position.x=-100;
          velocity=0;
        }
      }
    }
  }
}
