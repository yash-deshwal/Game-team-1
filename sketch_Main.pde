//Main class

//boolean for movement of players
boolean right = false, left = false, d = false, a = false;

Enemy enemy;
Player player1;
Player player2;
Star[] stars;

void setup(){
  size(800,800);
  
  //players = new Player[2];
  
  player1 = new Player(width/2,600);
  player2 = new Player(100,600);
  enemy = new Enemy(); 
  stars = new Star[1000];
  
  for (int i=0; i<stars.length; i++){
    stars[i] = new Star();
  }
}


//if key is pressed everything will be true so that they move 
void keyPressed()
{
  if (keyCode == LEFT)
  {
    left = true;
  }
  if (keyCode == RIGHT)
  {
    right = true;
  }
  if (key == 'a')
  {
    a=true;
  }
  if (key == 'd' )
  {
    d=true;
  }
}

//if key is released movement of player will stop
void keyReleased()
{
  if (keyCode == LEFT)
  {
    left = false;
  }
  if (keyCode==RIGHT)
  {
    right = false;
  }
  if (key=='a')
  {
    a=false;
  }
  if (key=='d')
  {
    d=false;
  }
}

void draw(){
  clear();
  background(0);
  
  //To display the players
  player1.display(player1.playerUp);
  player2.display(player2.playerUp);

  //calling the direction function which contains keypress
  //player1.direction();
  //player2.direction();
  
  //movemet code.
      if (left==true)
    {
      player1.moveLeft();
    }
    if (right==true)
    {
      player1.moveRight();
    }
    if (a==true)
    {
      player2.moveLeft();
    }
    if (d==true)
    {
      player2.moveRight();
    }
  
  

//translate is used because i want the stars animation from center.
  translate(width/2,height/2);
  
  for (int i=0; i<stars.length; i++){
    stars[i].change();
    stars[i].animate();
  }
  
enemy.Eanimate();
enemy.update();   

}
