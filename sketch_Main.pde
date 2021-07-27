//Main class
//*****************************Bug******************************
//if you press any other key than 'a' or 'd' it throws error ArrayIndexOutOfBoundsException: 1 => solution We made another method just to display the default image and called it inside input function
//Not able to control both the players at once
//Animation is not upto the mark it overlaps when we move left or right => solution We used else statement inside the input function instead of directly displaying it to main function
//Enemies are overlapping.
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

import processing.sound.*;

SoundFile background;

////for switching the screen
int stage;
//creating instance of Menu class
Menu menu;
//creating arraylists of different classes
ArrayList bullets;
ArrayList enemies;
ArrayList enemies2;
ArrayList enemies3;
//creating objects of player class
Player player1;
Player player2;
//PVector for health Booster Location
PVector healthBoosterLoc;
//creating arraylist of healthBooster
ArrayList healthBooster;
//creating array of object of stars for background
Star[] stars;
//declaring PImage variables
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

PImage imgHb1; 
PImage imgHb2; 
PImage imgHb3; 
PImage imgHb4; 
//for enemy locations
PVector loc;
//for health bar locations
PVector locHealthBar1;
PVector locHealthBar2;
//for labels 
PVector locHealthBar1Label;
PVector locHealthBar2Label;
//checking the player 
boolean isdead;

String audio;
String path;

void setup() {
  size(800, 800);
  
  //initial value of stage for switching the menus
  stage=1;
  //new object of menu for displaying
  menu = new Menu();
  ////initialising the bullets arraylist
  bullets = new ArrayList();
  //initialising all three enemy arraylist
  enemies = new ArrayList();
  enemies2 = new ArrayList();
  enemies3 = new ArrayList();
  //initialising healthBooster arraylist
  healthBooster = new ArrayList();
  //loading images for players here.
  playerImg = loadImage("images/pl1.png");
  playerImgL1 = loadImage("images/plleft1.png");
  playerImgL2 = loadImage("images/plleft2.png");
  playerImgR1 = loadImage("images/plright1.png");
  playerImgR2 = loadImage("images/plright2.png");

  // loading all 4 images for enemy1,2,3 animation
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
  //loading images for health booster here.
  imgHb1 = loadImage("images/health1.png");
  imgHb2 = loadImage("images/health2.png");
  imgHb3 = loadImage("images/health3.png");
  imgHb4 = loadImage("images/health4.png");

  //37 left(LEFT), 39 right(RIGHT)
  //65 left(a), 68 right(d)
  int [] playerControl1 = {37, 39};
  int [] playerControl2 = {65, 68};
  //assigining values to player health bars
  locHealthBar1 = new PVector(10, 760);
  locHealthBar2 = new PVector(590, 760);
  //assigning nAME TO PLAYER Healthbar
  locHealthBar1Label = new PVector(110, 795);
  locHealthBar2Label = new PVector(690, 795);

  //Creating 2 new objects of player.
  player1 = new Player(this,width/2, 600, playerImg, playerImgL1, playerImgL2, playerImgR1, playerImgR2, playerControl1, locHealthBar1, "Player1");
  player2 = new Player(this,100, 600, playerImg, playerImgL1, playerImgL2, playerImgR1, playerImgR2, playerControl2, locHealthBar2, "Player2");

  //initialising the stars array
  stars = new Star[1000];

  //creating new objects of stars
  for (int i=0; i<stars.length; i++) {
    stars[i] = new Star();
  }

  // calling all the enemy create function
  createEnemy();
  createEnemy2();
  createEnemy3();
  createhealth();
  
  backgroundSound();
}

void draw() {
  // calling menu class function for switiching to differnt screens
  menu.switchingScreen();
}

//for poping healthbooster
void displayHealthBooster() {
  for (int i=0; i<healthBooster.size(); i++) {
    //for all the healthbooster in array list
    HealthBooster hb = (HealthBooster) healthBooster.get(i);
    hb.updateHealthBooster();
  }
}
//creating healthbooster for player
void createhealth() {
  for (int i=0; i<1; i++) {
    //creating at random position and adding it to arraylist
    healthBoosterLoc = new PVector(random(600), random(-2000, -1000));
    healthBooster.add(new HealthBooster( healthBoosterLoc, imgHb1, imgHb2, imgHb3, imgHb4));
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
//creating n enemies in arraylist
void createEnemy() {
  for (int i=0; i<1; i++) {
    //creating random position of enemy on screen
    //why random 800? to randmize the location of enemy in x direction and 800 is width
    //why random -200,-100? to randmize the location of enemy in y direction and it should from bit above as, it is like cooling time for new enmy.
    loc = new PVector(random(600), random(-200, -100)); 
    enemies.add(new Enemy(this, loc, myImage, myImage1, myImage2, myImage3));
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
//creating n enemies in arraylist
void createEnemy2() {
  for (int i=0; i<1; i++) {
    loc = new PVector(random(600), random(-200, -100)); 
    enemies2.add(new Enemy2(pApplet, loc, newEn1, newEn2, newEn3, newEn4));
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
//creating n enemies in arraylist
void createEnemy3() {
  for (int i=0; i<1; i++) {
    loc = new PVector(random(600), random(-200, -100)); 
    enemies3.add(new Enemy3(pApplet, loc, imgEn1, imgEn2, imgEn3, imgEn4));
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
//For shooting the bullets, why keyReleased coz if we put inside keyPressed and we hold the key for shooting then creating a straight line.
void keyReleased() {
  if ( keyCode == LEFT||keyCode ==RIGHT) {
    player1.shoot();
  }  

  if ( key == 'a' || key == 'd') {
    player2.shoot();
  }
  
  
}

void backgroundSound(){
  audio = "sounds/background/theme.mp3";
  path = sketchPath(audio);
  background = new SoundFile(this, path);
  background.loop(1, 0.3);
}
