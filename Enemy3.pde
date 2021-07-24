class Enemy3 extends Enemy {

  public Enemy3(PVector loc, PImage imgEn1, PImage imgEn2, PImage imgEn3, PImage imgEn4) {
    super(loc, imgEn1, imgEn2, imgEn3, imgEn4);
  }

  void hitCheck() {
    for (int i = 0; i < bullets.size(); i++) {
      Bullet b = (Bullet) bullets.get(i);
      float distBetween = dist(b.x, b.y, this.loc.x, this.loc.y);
      // if (this.loc.y+40> b.x && this.loc.x+40> b.y && this.loc.y+40> b.y && this.loc.x+40> b.y
      if (distBetween < 50 && b.velocity < 0) {

        enemies3.remove(this);

        imgEn1 = loadImage("images/ene1.png"); 
        imgEn2 = loadImage("images/ene2.png");
        imgEn3 = loadImage("images/ene3.png");
        imgEn4 = loadImage("images/ene4.png");

        loc = new PVector(random(600), random(-200, -100)); 
        enemies3.add(new Enemy3(loc, imgEn1, imgEn2, imgEn3, imgEn4));
      }
    }
  }
}
