//Yashwant enemy class code here!
class Enemy {
//image of enemy set in array
 PImage[] enemy;
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
 
  public Enemy() {
    //array for 4 images 
    enemy = new PImage[4];
// loading all 4 images for animation
    myImage = loadImage("images/e1.png"); 
    myImage1 = loadImage("images/e2.png");
    myImage2 = loadImage("images/e3.png");
    myImage3 = loadImage("images/e4.png");
//assinging the images
    enemy[0] = myImage;
    enemy[1] = myImage1;
    enemy[2] = myImage2;
    enemy[3] = myImage3;
//creating random position of enemy on screen
//why random 800? to randmize the location of enemy in x direction and 800 is width
//why random -200,-100? to randmize the location of enemy in y direction and it should from bit above as, it is like cooling time for new enmy.
    loc = new PVector(random(800), random(-200, -100));
    //for randomizing the speed of enemy so each enemy has different speed
    vel=random(1.5, 3);
    
//for animation ++
    x=0;
    //initial vaue of coolingtime why 1? it doesn't have to be 1 it can be anyvalue since we are coolintiming 0 in bullet function
    coolingtime = 100;
  }


  public void Eanimate() {
//draw function of animation
    image(enemy[x], loc.x, loc.y);
    //for somthness of animation
    if (frameCount%10==0) {
      x++;
// to revert back to 0th image
      if (x>enemy.length-1) {
        x=0;
      }
    }
  }


  public void update() {
    //giving speed in y direction
    loc.y += vel;
    //if enemy go down new enemy will come from top with random position and speed
    //can do height/2 when all enemy is die
    if (loc.y > height) {
      loc = new PVector(random(800), random(-200, -100));
      vel=random(1.5, 3);
      
    }
  }
  
  public void shootE() {
   // creating new object of bullet at enemy location and changing color as weel giving velocity
    Bullet bullet = new Bullet(loc.x+28, loc.y+15, 5, false);
    //adding the bullet
   
    //incrimenting the value to coolingtime as coolingtimebecomes 0 after below condition
    coolingtime++;
  //if coolingtime > 60 it will go down to 0 and then start again till 60 and it can be ay value 
  // why 60? to increase the gap between bullets
    if(coolingtime>=60){
    bullets.add(bullet);
    //to avoid the continuos firing of bullets as it creates straight line
    coolingtime=0;
    }
  }
  
  
  //void hitCheck() {
  //  for (int i = 0; i < bullets.size(); i++) {
  //    Bullet b = (Bullet) bullets.get(i);
  //    float distBetween = dist(b.x, b.y, loc.x, loc.y);
  //    if (distBetween < 15 && b.velocity < 0) {
  //       background(255,0,0);
  //    }
  //  }
  //}
}
