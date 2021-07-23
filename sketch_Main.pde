//Main class
//*****************************Bug******************************
//if you press any other key than 'a' or 'd' it throws error ArrayIndexOutOfBoundsException: 1 => solution We made another method just to display the default image and called it inside input function
//Not able to control both the players at once
//Animation is not upto the mark it overlaps when we move left or right => solution We used else statement inside the input function instead of directly displaying it to main function
//Enemies are overlapping.
//Change enemies to arraylist
//So the movement works fine but only 1 player can move at a time shooting works fine
//if we move left or right and then fire it goes back to default image(space shooter)
//if we keep pressing space bar then it creates a line effect (bullets) => solution We used keyReleased instead of keyPress.
//after inheritance the child class copies the parent but it doesn't show up immediately as soon as we kill enemy the new enemy starts popping.
//*****************************Bug******************************

//***********************************Changes****************************************
//inherit enemy class to one another enemy
//change enemy class to oop
//input of speed using arrays in the constructor => done!
//update the movement code and add boolean array so that both the players move together. refer to the video that was shared.

//for switching the screen
int stage;

PVector playButton;
PVector controlsButton;
PVector quitButton;

int buttonWidth;
int buttonHeight;

GamePlay gamePlay;

PVector loc;

void setup() {
  size(800, 800);

  gamePlay = new GamePlay();
  
  //initial value of stage 
  stage=1;

  playButton = new PVector(width/2-60, height/2-100);
  controlsButton = new PVector(width/2-60, height/2);
  quitButton = new PVector(width/2-60, height/2+100);

  buttonWidth = 150;
  buttonHeight = 70;
  // calling enemy create function
  gamePlay.createEnemy();
  gamePlay.createEnemy2();
  gamePlay.createEnemy3();
}


void draw() {
  //stage = 1 so that it starts from the menu.
  if (stage == 1) {
    clear();
    background(0);

    gamePlay.menu();

    //for displaying stars in the background.
    gamePlay.displayStars();

    //stage = 2 is the actual gameplay
    if (mousePressed) {
      //this is a sort of collision detection with button's width and height to mouse pointer.
      if (playButton.x + buttonWidth >= mouseX && playButton.y + buttonHeight >= mouseY) {
        stage = 2;
      } else if (quitButton.x + buttonWidth >= mouseX && quitButton.y + buttonHeight >= mouseY) {
        stage = 4;
      }
    }
  }
  //stage = 2 is the actual gameplay
  if (stage ==2) {
    clear();
    background(0); 
    //println((int)keyCode);
    //println(keyCode);

    //calling the inputPlayer class for movement as well as for animation.
    gamePlay.player1.inputPlayer();
    gamePlay.player2.inputPlayer();

    //for displaying bullets
    gamePlay.displayBullets();

    //for displaying enemies
    gamePlay.displayEnemies();
    gamePlay.displayEnemies2();
    gamePlay.displayEnemies3();


    //for displaying stars in the background.
    gamePlay.displayStars();
  }
  if (stage == 4) {
    exit();
  }
}


//For shooting the bullets, why keyReleased coz if we put inside keyPressed and we hold the key for shooting then creating a straight line.
void keyReleased() {
  if ( keyCode == LEFT||keyCode ==RIGHT) {
    gamePlay.player1.shoot();
  }  

  if ( key == 'a' || key == 'd') {
    gamePlay.player2.shoot();
  }
}
