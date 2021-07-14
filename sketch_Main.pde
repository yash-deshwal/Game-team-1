//Main class
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
  
  player1.display(player1.playerUp);
  player2.display(player2.playerUp);

  //calling the direction function which contains keypress
  //player1.direction();
  //player2.direction();
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
  
  

  translate(width/2,height/2);
  
  for (int i=0; i<stars.length; i++){
    stars[i].change();
    stars[i].animate();
  }
  
enemy.Eanimate();
enemy.update();   

}
