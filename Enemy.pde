//Yashwant enemy class code here!
class Enemy{
PImage myImage1; 
PVector loc;
float vel;
int x=0;
boolean isDead;
public Enemy() {
  myImage1 = loadImage("images/enemy.gif"); 
  loc = new PVector(-350,-350);
  vel=3;
  isDead = false;
}


public void Eanimate(){
 if(frameCount%1==0){
   x++;
   image(myImage1,loc.x,loc.y);
 } 
}

public void update(){
    loc.y += vel;
    if(loc.y > height){
      isDead = true;
    }
}
}
