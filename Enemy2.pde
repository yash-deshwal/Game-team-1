
class Enemy2 extends Enemy {

  public Enemy2(PVector loc, PImage newEn1, PImage newEn2, PImage newEn3, PImage newEn4) {
    super(loc, newEn1, newEn2, newEn3, newEn4);
  }


  void hitCheck() {

    for (int i = 0; i < bullets.size(); i++) {
      Bullet b = (Bullet) bullets.get(i);
      float distBetween = dist(b.x, b.y, this.loc.x, this.loc.y);
      // if (this.loc.y+40> b.x && this.loc.x+40> b.y && this.loc.y+40> b.y && this.loc.x+40> b.y
      if (distBetween < 50 && b.velocity < 0) {

        enemies2.remove(this);
        newEn1 = loadImage("images/en1.png"); 
        newEn2 = loadImage("images/en2.png");
        newEn3 = loadImage("images/en3.png");
        newEn4 = loadImage("images/en4.png");

        loc = new PVector(random(600), random(-200, -100)); 
        enemies2.add(new Enemy2(loc, newEn1, newEn2, newEn3, newEn4));
      }
    }
  }
}
