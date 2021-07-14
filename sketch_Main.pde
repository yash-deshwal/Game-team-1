//Main class
Enemy enemy;
Player player;
Star[] stars;

void setup(){
  size(800,800);
  
  //players = new Player[2];
  
  player = new Player(width/2,600);
  enemy = new Enemy(); 
  stars = new Star[1000];
  
  for (int i=0; i<stars.length; i++){
    stars[i] = new Star();
  }
}

void draw(){
  clear();
  background(0);
  

  //calling the direction function which contains keypress
  player.direction();

  translate(width/2,height/2);
  
  for (int i=0; i<stars.length; i++){
    stars[i].change();
    stars[i].animate();
  }
  
enemy.Eanimate();
enemy.update();   

}
