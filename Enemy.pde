//Yashwant enemy class code here!
class Enemy {

  PImage[] enemy;

  PImage myImage;
  PImage myImage1;
  PImage myImage2;
  PImage myImage3;
  PVector loc;
  float vel;
  int x;
  boolean isDead;
  public Enemy() {
    enemy = new PImage[4];

    myImage = loadImage("images/e1.png"); 
    myImage1 = loadImage("images/e2.png");
    myImage2 = loadImage("images/e3.png");
    myImage3 = loadImage("images/e4.png");

    enemy[0] = myImage;
    enemy[1] = myImage1;
    enemy[2] = myImage2;
    enemy[3] = myImage3;

    loc = new PVector(random(800), random(-200, -100));
    vel=random(1.5, 3);
    isDead = false;

    x=0;
  }


  public void Eanimate() {

    image(enemy[x], loc.x, loc.y);
    if (frameCount%10==0) {
      x++;

      if (x>enemy.length-1) {
        x=0;
      }
    }
  }

  public void update() {
    loc.y += vel;
    if (loc.y > height) {
      loc = new PVector(random(800), random(-200, -100));
      vel=random(1.5, 3);
      isDead = true;
    }
  }
}
