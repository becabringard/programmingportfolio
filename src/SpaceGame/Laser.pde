class Laser {
  //member variables
  int x, y, speed, rad;
  color c;

  //constructor
  Laser(int x, int y) {
    this.x = x;
    this.y = y;
    speed = 3;
    rad = 4;
  }

  void fire() {
    y-=speed;
  }

  boolean reachedTop() {
    if (y < -10) {
      return true;
    } else {
      return false;
    }
  }


  //member methods
  void display() {
    noStroke();
    fill(255,0,0);
    rectMode(CENTER);
    rect(x, y, rad, rad*2);
  }
}
