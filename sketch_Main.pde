//Main class
//*****************************Bug******************************
//if you press any other key than 'a' or 'd' it throws error ArrayIndexOutOfBoundsException: 1 => solution I made another method just to display the default image and called it inside input function
//Not able to control both the players at once
//*****************************Bug******************************



//create another class for images

//boolean for movement of players
//boolean right = false, left = false, d = false, a = false;

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

  playerImg = loadImage("images/pl1.png");
  playerImgL1 = loadImage("images/plleft1.png");
  playerImgL2 = loadImage("images/plleft2.png");
  playerImgR1 = loadImage("images/plright1.png");
  playerImgR2 = loadImage("images/plright2.png");


  player1 = new Player(width/2, 600, playerImg, playerImgL1, playerImgL2, playerImgR1, playerImgR2);
  player2 = new Player(100, 600, playerImg, playerImgL1, playerImgL2, playerImgR1, playerImgR2);
  
  
  enemy = new Enemy[10];
  
  for(int i=0; i<enemy.length;i++){
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
//  println((int)keyCode);
//  println(keyCode);
  
//  //37 left, 39 right
//  //65 left, 68 right


//  //if (keyCode == LEFT)
//  //{
//  //  left = true;
//  //}
//  //if (keyCode == RIGHT)
//  //{
//  //  right = true;
//  //}
//  //if (key == 'a')
//  //{
//  //  a=true;
//  //}
//  //if (key == 'd' )
//  //{
//  //  d=true;
//  //}
//}

////if key is released movement of player will stop
//void keyReleased()
//{
//  if (keyCode == LEFT)
//  {
//    left = false;
//  }
//  if (keyCode==RIGHT)
//  {
//    right = false;
//  }
//  if (key=='a')
//  {
//    a=false;
//  }
//  if (key=='d')
//  {
//    d=false;
//  }
//}



void draw() {
  clear();
  background(0);

  //To display the players
  //player1.display(player1.playerDefault);
  //player2.display(player2.playerDefault);

  //calling the direction function which contains keypress
  player1.inputPlayer();
  player2.inputPlayer();
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

  for(int i=0;i<enemy.length;i++){
    enemy[i].Eanimate();
    enemy[i].update();
  }

  //translate is used because i want the stars animation from center.
  translate(width/2, height/2);

  for (int i=0; i<stars.length; i++) {
    stars[i].change();
    stars[i].animate();
  }


}
