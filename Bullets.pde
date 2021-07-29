//Bullet
class Bullet {
  float x, y;
  float velocity;
  boolean col;

  Bullet(float x, float y, float velocity, boolean col ) {
    this.x = x;
    this.y = y;
    this.velocity = velocity;
    this.col = col;
  }
  //drawing bullet and differnt color for enemy and player
  void display() {
    if (col) {
      fill(0, 255, 0);
    } else {
      fill(255, 255, 0);
    }
    noStroke();
    rect(this.x, this.y, 5, 20);
  }
  //adding velocity to bullets
  void move() {
    this.y+=this.velocity;
  }
}
