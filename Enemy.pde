//Yashwant enemy class code here!
class Enemy{
PImage myImage1; 
PVector loc;
float vel;
//int x=0;
boolean isDead;
public Enemy() {
  myImage1 = loadImage("images/enemy.gif"); 
  loc = new PVector(random(800),random(-200,-100));
  vel=random(1.5,3);
  isDead = false;
}


public void Eanimate(){
 if(frameCount%1==0){
   //x++;
   image(myImage1,loc.x,loc.y);
 } 
}

public void update(){
    loc.y += vel;
    if(loc.y > height){
      loc = new PVector(random(800),random(-200,-100));
      vel=random(1.5,3);
      isDead = true;
    }
}
}
