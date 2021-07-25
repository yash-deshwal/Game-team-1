// inherting all the properties of enemy class
class Enemy2 extends Enemy {
  public Enemy2(PVector loc, PImage newEn1, PImage newEn2, PImage newEn3, PImage newEn4) {
    super(loc, newEn1, newEn2, newEn3, newEn4);
  }
  //collision for enenmy2
  void hitCheck() {
    for (int i = 0; i < bullets.size(); i++) {
      Bullet b = (Bullet) bullets.get(i);
      //why b velocity<0 so that enemy doesn't get kill by own bullet. whenever player fires it goes in-value
      if (this.loc.x+50 >= b.x && b.x + 5 >= this.loc.x && this.loc.y + 50 >= b.y && b.y + 20 >= this.loc.y && b.velocity < 0 ) {
        //removing enemy after hitting from player bullet from arraylist stored position 
        enemies2.remove(this);
        newEn1 = loadImage("images/en1.png"); 
        newEn2 = loadImage("images/en2.png");
        newEn3 = loadImage("images/en3.png");
        newEn4 = loadImage("images/en4.png");
        //why adding again becoz if we killed it agin spawns at given position
        loc = new PVector(random(600), random(-200, -100)); 
        enemies2.add(new Enemy2(loc, newEn1, newEn2, newEn3, newEn4));
      }
    }
  }
}
