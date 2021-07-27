// inherting all the properties of enemy class

class Enemy3 extends Enemy {
  public Enemy3(PApplet p, PVector loc, PImage imgEn1, PImage imgEn2, PImage imgEn3, PImage imgEn4) {
    super(p, loc, imgEn1, imgEn2, imgEn3, imgEn4);
  }
  void hitCheck() {
    for (int i = 0; i < bullets.size(); i++) {
      Bullet b = (Bullet) bullets.get(i);
      //why b velocity<0 so that enemy doesn't get kill by own bullet. whenever player fires it goes in-value
      if (this.loc.x+50 >= b.x && b.x + 5 >= this.loc.x && this.loc.y + 50 >= b.y && b.y + 20 >= this.loc.y && b.velocity < 0 ) {
        //removing enemy after hitting from player bullet from arraylist stored position 
        enemies3.remove(this);
        blast();
        //for removing bullets after hitting
        bullets.remove(b);
        imgEn1 = loadImage("images/ene1.png"); 
        imgEn2 = loadImage("images/ene2.png");
        imgEn3 = loadImage("images/ene3.png");
        imgEn4 = loadImage("images/ene4.png");
        //why adding again becoz if we killed it agin spawns at given position
        loc = new PVector(random(600), random(-200, -100)); 
        enemies3.add(new Enemy3(pApplet, loc, imgEn1, imgEn2, imgEn3, imgEn4));
      }
    }
  }
}
