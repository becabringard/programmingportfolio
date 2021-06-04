class Laser {
  int x, y, health, speed, rad;
  
  Laser(int x, int y) {
    this.x = x;
    this.y = y;
    health = 10;
    speed = int(random(3, 5));
    rad = 25;
  }
  
  void move() {
    y += speed;
  }
  
  boolean reachedBottom() {
    if (y > height + 50) {
      return true;
    } else {
      return false;
    }
  }
}
