class Enemy3 extends Enemy {

  public Enemy3(PVector loc, PImage imgEn1, PImage imgEn2, PImage imgEn3, PImage imgEn4) {
    super(loc, imgEn1, imgEn2, imgEn3, imgEn4);
  }

  void hitCheck() {
    for (int i = 0; i < gamePlay.bullets.size(); i++) {
      Bullet b = (Bullet) gamePlay.bullets.get(i);
      float distBetween = dist(b.x, b.y, this.loc.x, this.loc.y);
      // if (this.loc.y+40> b.x && this.loc.x+40> b.y && this.loc.y+40> b.y && this.loc.x+40> b.y
      if (distBetween < 50 && b.velocity < 0) {

        gamePlay.enemies3.remove(this);

        gamePlay.imgEn1 = loadImage("images/en1.png"); 
        gamePlay.imgEn2 = loadImage("images/en2.png");
        gamePlay.imgEn3 = loadImage("images/en3.png");
        gamePlay.imgEn4 = loadImage("images/en4.png");

        loc = new PVector(random(600), random(-200, -100)); 
        gamePlay.enemies3.add(new Enemy3(loc, gamePlay.imgEn1, gamePlay.imgEn2, gamePlay.imgEn3, gamePlay.imgEn4));
      }
    }
  }
}
