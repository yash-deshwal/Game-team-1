//Yashwant enemy class code here!
class Enemy {


  PImage [] enemy;


  // pimage for loading the images
  PImage myImage;
  PImage myImage1;
  PImage myImage2;
  PImage myImage3;
  //loc vector for x and y position
  PVector loc;
  //speed of enemy 
  float vel;
  //x for incremneting of animation
  int x;
  int coolingtime;

  public Enemy(PVector loc, PImage myImage, PImage myImage1, PImage myImage2, PImage myImage3) {


    //array for 4 images
    enemy = new PImage[4];


    //assinging the images
    enemy[0] = myImage;
    enemy[1] = myImage1;
    enemy[2] = myImage2;
    enemy[3] = myImage3;


    //resisizing the enemies

    enemy[0].resize(50, 50);
    enemy[1].resize(50, 50);
    enemy[2].resize(50, 50);
    enemy[3].resize(50, 50);
    //creating random position of enemy on screen
    //why random 800? to randmize the location of enemy in x direction and 800 is width
    //why random -200,-100? to randmize the location of enemy in y direction and it should from bit above as, it is like cooling time for new enmy.
    this.loc = loc;

    //for randomizing the speed of enemy so each enemy has different speed
    vel=random(1.5, 3);

    //for animation ++
    x=0;
    //initial vaue of coolingtime why 1? it doesn't have to be 1 it can be anyvalue since we are coolintiming 0 in bullet function
    coolingtime = 0;
  }


  public void Eanimate(PImage [] enemyImage) {
    //draw function of animation

    image(enemyImage[x], this.loc.x, this.loc.y);

    //for sess of animation

    if (frameCount%10==0) {
      x++;
      // to revert back to 0th image
      if (x>enemy.length-1) {
        x=0;
      }
    }
  }

  public void update() {

    Eanimate(enemy);

    //giving speed in y direction
    this.loc.y += vel;
    //if enemy go down new enemy will come from top with random position and speed
    //can do height/2 when all enemy is die
    if (loc.y > height) {
      loc = new PVector(random(800), random(-200, -100));
      vel=random(1.5, 3);
    }
  }

  public void shootE() {
    // creating new object of bullet at enemy location and changing color as weel giving velocity
    Bullet bullet = new Bullet(this.loc.x+24, this.loc.y+15, 5, false);
    //adding the bullet

    //incrimenting the value to coolingtime as coolingtimebecomes 0 after below condition
    coolingtime++;
    //if coolingtime > 60 it will go down to 0 and then start again till 60 and it can be ay value 
    // why 60? to increase the gap between bullets
    if (coolingtime>=100) {
      bullets.add(bullet);
      //to avoid the continuos firing of bullets as it creates straight line
      coolingtime=0;
    }
  }

  void hitCheck() {
    for (int i = 0; i < bullets.size(); i++) {
      Bullet b = (Bullet) bullets.get(i);
      float distBetween = dist(b.x, b.y, this.loc.x, this.loc.y);
      // if (this.loc.y+40> b.x && this.loc.x+40> b.y && this.loc.y+40> b.y && this.loc.x+40> b.y
      if (distBetween < 50 && b.velocity < 0) {

        enemies.remove(this);



        myImage = loadImage("images/e1.png"); 
        myImage1 = loadImage("images/e2.png");
        myImage2 = loadImage("images/e3.png");
        myImage3 = loadImage("images/e4.png");
        loc = new PVector(random(600), random(-200, -100)); 
        enemies.add(new Enemy(loc, myImage, myImage1, myImage2, myImage3));


      }
    }
  }
}
