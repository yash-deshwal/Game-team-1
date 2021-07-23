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

Button play;
Button controls;
Button quit;

PVector playButton;
PVector controlsButton;
PVector quitButton;

int buttonWidth;
int buttonHeight;

ArrayList bullets;
ArrayList enemies;
ArrayList enemies2;
ArrayList enemies3;
//Enemy[] enemy;

Player player1;
Player player2;

Star[] stars;

PImage playerImg;
PImage playerImgL1;
PImage playerImgL2;
PImage playerImgR1;
PImage playerImgR2;

PImage player2Img;
PImage player2ImgL1;
PImage player2ImgL2;
PImage player2ImgR1;
PImage player2ImgR2;

PImage myImage; 
PImage myImage1; 
PImage myImage2; 
PImage myImage3;

PImage newEn1; 
PImage newEn2; 
PImage newEn3; 
PImage newEn4;

PImage imgEn1; 
PImage imgEn2; 
PImage imgEn3; 
PImage imgEn4;

PVector loc;
void setup() {
  size(800, 800);
  //initial value of stage 
  stage=1;

  bullets = new ArrayList();
  //initialising the enemy array
  enemies = new ArrayList();
  enemies2 = new ArrayList();
  enemies3 = new ArrayList();

  //loading images for players here.
  playerImg = loadImage("images/pl1.png");
  playerImgL1 = loadImage("images/plleft1.png");
  playerImgL2 = loadImage("images/plleft2.png");
  playerImgR1 = loadImage("images/plright1.png");
  playerImgR2 = loadImage("images/plright2.png");

  player2Img = loadImage("images/d.png");
  player2ImgL1 = loadImage("images/pll1.png");
  player2ImgL2 = loadImage("images/pl12.png");
  player2ImgR1 = loadImage("images/plr1.png");
  player2ImgR2 = loadImage("images/plr2.png");


  // loading all 4 images for enemy animation
  myImage = loadImage("images/e1.png"); 
  myImage1 = loadImage("images/e2.png");
  myImage2 = loadImage("images/e3.png");
  myImage3 = loadImage("images/e4.png");

  newEn1 = loadImage("images/en1.png"); 
  newEn2 = loadImage("images/en2.png");
  newEn3 = loadImage("images/en3.png");
  newEn4 = loadImage("images/en4.png");
  
  imgEn1 = loadImage("images/ene1.png"); 
  imgEn2 = loadImage("images/ene2.png");
  imgEn3 = loadImage("images/ene3.png");
  imgEn4 = loadImage("images/ene4.png");
  
  //37 left(LEFT), 39 right(RIGHT)
  //65 left(a), 68 right(d)
  int [] playerControl1 = {37, 39};
  int [] playerControl2 = {65, 68};

  //Creating 2 new objects of player.
  player1 = new Player(width/2, 600, playerImg, playerImgL1, playerImgL2, playerImgR1, playerImgR2, playerControl1);
  player2 = new Player(100, 600, player2Img, player2ImgL1, player2ImgL2, player2ImgR1, player2ImgR2, playerControl2);



  //initialising the stars array
  stars = new Star[1000];

  //creating new objects of stars
  for (int i=0; i<stars.length; i++) {
    stars[i] = new Star();
  }


  playButton = new PVector(width/2-60, height/2-100);
  controlsButton = new PVector(width/2-60, height/2);
  quitButton = new PVector(width/2-60, height/2+100);

  buttonWidth = 150;
  buttonHeight = 70;
  // calling enemy create function
  createEnemy();
  createEnemy2();
  createEnemy3();
}


void draw() {
  //stage = 1 so that it starts from the menu.
  if (stage == 1) {
    clear();
    background(0);

    menu();

    //for displaying stars in the background.
    displayStars();

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
    player1.inputPlayer();
    player2.inputPlayer();

    //for displaying bullets
    displayBullets();

    //for displaying enemies
    displayEnemies();
    displayEnemies2();
    displayEnemies3();


    //for displaying stars in the background.
    displayStars();
  }
  if (stage == 4) {
    exit();
  }
}

//for displaying bullets
void displayBullets() {
  for (int i = 0; i < bullets.size(); i++) {
    Bullet b = (Bullet) bullets.get(i);
    b.move();
    b.display();
  }
}

//for displaying enemies
void displayEnemies() {
  for (int i=0; i<enemies.size(); i++) {
    Enemy e = (Enemy) enemies.get(i); 
    //calling class function
    e.update();
    e.shootE();
    e.hitCheck();
  }
}
//creating 10 enemies in arraylist
void createEnemy() {
  for (int i=0; i<1; i++) {
    loc = new PVector(random(600), random(-200, -100)); 
    enemies.add(new Enemy(loc, myImage, myImage1, myImage2, myImage3));
  }
}

//for displaying enemies
void displayEnemies2() {
  for (int i=0; i<enemies2.size(); i++) {
    Enemy2 e2 = (Enemy2) enemies2.get(i); 
    //calling class function
    e2.update();
    e2.shootE();
    e2.hitCheck();
  }
}
//creating 10 enemies in arraylist
void createEnemy2() {
  for (int i=0; i<1; i++) {
    loc = new PVector(random(600), random(-200, -100)); 
    enemies2.add(new Enemy2(loc, newEn1, newEn2, newEn3, newEn4));
  }
}


//for displaying enemies
void displayEnemies3() {
  for (int i=0; i<enemies3.size(); i++) {
    Enemy3 e3 = (Enemy3) enemies3.get(i); 
    //calling class function
    e3.update();
    e3.shootE();
    e3.hitCheck();
  }
}
//creating 10 enemies in arraylist
void createEnemy3() {
  for (int i=0; i<1; i++) {
    loc = new PVector(random(600), random(-200, -100)); 
    enemies3.add(new Enemy3(loc, imgEn1, imgEn2, imgEn3, imgEn4));
  }
}


//for displaying stars
void displayStars() {
  //translate is used because we want the stars animation from center.
  translate(width/2, height/2);

  for (int i=0; i<stars.length; i++) {
    stars[i].change();
    stars[i].animate();
  }
}



void menu() {

  textAlign(CENTER);
  int textsize = 50;
  textSize(textsize);
  fill(255);
  text("GALAXY SHOOTER", 400, 150);

  //creating new object of button
  play = new Button("Play", playButton, buttonWidth, buttonHeight);
  play.drawButton();

  controls = new Button("Controls", controlsButton, buttonWidth, buttonHeight);
  controls.drawButton();

  quit = new Button("Quit", quitButton, buttonWidth, buttonHeight);
  quit.drawButton();
}


//For shooting the bullets, why keyReleased coz if we put inside keyPressed and we hold the key for shooting then creating a straight line.
void keyReleased() {
  if ( keyCode == LEFT||keyCode ==RIGHT) {
    player1.shoot();
  }  

  if ( key == 'w') {
    player2.shoot();
  }
}
