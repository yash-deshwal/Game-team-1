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
//*****************************Bug******************************

//***********************************Changes****************************************
//inherit enemy class to one another enemy
//input of speed using arrays in the constructor => done!

//for switching the screen
int stage;

ArrayList bullets;

Enemy[] enemy;

Player player1;
Player player2;

Star[] stars;

PImage playerImg;
PImage playerImgL1;
PImage playerImgL2;
PImage playerImgR1;
PImage playerImgR2;

void setup() {
  size(800, 800);
  //initial value of stage 
  stage=1;

  bullets = new ArrayList();

  //loading images for players here.
  playerImg = loadImage("images/pl1.png");
  playerImgL1 = loadImage("images/plleft1.png");
  playerImgL2 = loadImage("images/plleft2.png");
  playerImgR1 = loadImage("images/plright1.png");
  playerImgR2 = loadImage("images/plright2.png");

  //37 left(LEFT), 39 right(RIGHT)
  //65 left(a), 68 right(d)
  int [] playerControl1 = {37, 39};
  int [] playerControl2 = {65, 68};

  //Creating 2 new objects of player.
  player1 = new Player(width/2, 600, playerImg, playerImgL1, playerImgL2, playerImgR1, playerImgR2, playerControl1);
  player2 = new Player(100, 600, playerImg, playerImgL1, playerImgL2, playerImgR1, playerImgR2, playerControl2);

  //initialising the enemy array
  enemy = new Enemy[7];

  //creating new objects of enemies
  for (int i=0; i<enemy.length; i++) {
    enemy[i] = new Enemy();
  }

  //initialising the stars array
  stars = new Star[1000];

  //creating new objects of stars
  for (int i=0; i<stars.length; i++) {
    stars[i] = new Star();
  }
}


void draw() {
  //stage = 1 so that it starts from the menu.
  if (stage == 1) {
    clear();
    background(0);

    textAlign(CENTER);
    int textsize = 40;
    textSize(textsize);
    fill(255);
    text("GALAXY SHOOTER", 400, 350);
    text("Press any key to start game", 400, 400);

    //for displaying stars in the background.
    displayStars();

    if (keyPressed == true) {
      stage = 2;
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

    //for displaying stars in the background.
    displayStars();
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
  for (int i=0; i<enemy.length; i++) {
    enemy[i].Eanimate();
    enemy[i].update();
    enemy[i].shootE();
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
  if ( keyCode == UP) {
    player1.shoot();
  }  

  if ( key == 'w') {
    player2.shoot();
  }
}
