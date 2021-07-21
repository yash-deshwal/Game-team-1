//Main class
//*****************************Bug******************************
//if you press any other key than 'a' or 'd' it throws error ArrayIndexOutOfBoundsException: 1 => solution I made another method just to display the default image and called it inside input function
//Not able to control both the players at once
//Animation is not upto the mark it overlaps when we move left or right.
//Enemies are overlapping.
//Change enemies to arraylist
//So the movement works fine but only 1 player can move at a time shooting works fine
//if we move left or right and then fire it goes back to default image(space shooter)
//if we keep pressing space bar then it creates a line effect (bullets) => solution Yashwant used keyReleased instead of keyPress.
//*****************************Bug******************************

//***********************************Changes****************************************
//inherit enemy class to one another enemy
//input of speed using arrays in the constructor


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
  stage=1;

  bullets = new ArrayList();

  playerImg = loadImage("images/pl1.png");
  playerImgL1 = loadImage("images/plleft1.png");
  playerImgL2 = loadImage("images/plleft2.png");
  playerImgR1 = loadImage("images/plright1.png");
  playerImgR2 = loadImage("images/plright2.png");
  
  //37 left, 39 right
  //65 left, 68 right
  int [] playerControl1 = {37,39};
  int [] playerControl2 = {65,68};


  player1 = new Player(width/2, 600, playerImg, playerImgL1, playerImgL2, playerImgR1, playerImgR2,playerControl1);
  player2 = new Player(100, 600, playerImg, playerImgL1, playerImgL2, playerImgR1, playerImgR2,playerControl2);

  //startScreen = loadImage("images/bg1.jpg");
  //startScreen.resize(800,800);

  //image(startScreen,0,0);

  enemy = new Enemy[7];

  for (int i=0; i<enemy.length; i++) {
    enemy[i] = new Enemy();
  }

  stars = new Star[1000];

  for (int i=0; i<stars.length; i++) {
    stars[i] = new Star();
  }
}


//if key is pressed everything will be true so that they move 
//void keyPressed()
//{
//  //println((int)key);
//  //println(key);
  



void draw() {
  if (stage == 1) {
    clear();
    background(0);

    textAlign(CENTER);
    int textsize = 40;
    textSize(textsize);
    fill(255);
    text("GALAXY SHOOTER", 400, 350);
    text("Press any key to start game", 400, 400);

    //translate is used because i want the stars animation from center.
    translate(width/2, height/2);

    for (int i=0; i<stars.length; i++) {
      stars[i].change();
      stars[i].animate();
    }

    if (keyPressed == true) {
      stage = 2;
    }
  }
  if (stage ==2) {
    clear();
    background(0); 

    //To display the players
    //player1.display(player1.playerDefault);
    //player2.display(player2.playerDefault);

    //calling the direction function which contains keypress
    println((int)keyCode);
    println(keyCode);
    player1.inputPlayer();
    player2.inputPlayer();
    
    //for displaying bullets
    for (int i = 0; i < bullets.size(); i++) {
      Bullet b = (Bullet) bullets.get(i);
      b.move();
      b.display();
    }
    //player2.inputPlayer();
    //player2.direction();

    //movemet code.
    //  if (left==true)
    //{
    //  player1.moveLeft();
    //}
    //if (right==true)
    //{
    //  player1.moveRight();
    //}
    //if (a==true)
    //{
    //  player2.moveLeft();
    //}
    //if (d==true)
    //{
    //  player2.moveRight();
    //}

    for (int i=0; i<enemy.length; i++) {
      enemy[i].Eanimate();
      enemy[i].update();
      enemy[i].shootE();
    }
 

    //translate is used because i want the stars animation from center.
    translate(width/2, height/2);

    for (int i=0; i<stars.length; i++) {
      stars[i].change();
      stars[i].animate();
    }
  }
}


void keyReleased(){
if( keyCode == UP){
player1.shoot();
}  
  
if( key == 'w'){
player2.shoot();
}


}
