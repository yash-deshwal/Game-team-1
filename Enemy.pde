//Yashwant enemy class code here!
class Enemy{
  
PImage myImage;
PVector loc;
float vel;
int x;
boolean isDead;
public Enemy() {
  myImage = loadImage("images/e1.png"); 

 
  
  loc = new PVector(random(800),random(-200,-100));
  vel=random(1.5,3);
  isDead = false;
  
  x=0;
}


public void Eanimate(){
 
 if(frameCount%1==0){
   x++;
   image(myImage,loc.x,loc.y);
   //if (x>pimage.length-1) {
   //     x=0;
   //   }
   
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
