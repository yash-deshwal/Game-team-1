//Main class
Enemy enemy;
Star[] stars;

void setup(){
  size(800,800);
  
  enemy = new Enemy(); 
  stars = new Star[1000];
  
  for (int i=0; i<stars.length; i++){
    stars[i] = new Star();
  }
}

void draw(){
  clear();
  
  background(0);
  
  translate(width/2,height/2);
  
  for (int i=0; i<stars.length; i++){
    stars[i].change();
    stars[i].animate();
    
 
    
  }
enemy.Eanimate();
enemy.update();   

}
