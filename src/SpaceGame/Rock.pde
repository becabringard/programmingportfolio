

class Rock {
  //member variables
  int x, y, health, speed, rad;

  //constructor
  Rock(int x, int y) {
    this.x = x;
    this.y = y;
    health = 25;
    speed = int(random(3, 5));
    rad = 25;
  }

  //Laser vs Rock Intersection
  boolean laserIntersection(Laser laser) {
    float distance = dist(x, y, laser.x, laser.y);
    if (distance < rad + laser.rad) {
      return true;
    } else {
      return false;
    }
  }

  boolean reachedBottom() {
    if (y > height + 50) {
      return true;
    } else {
      return false;
    }
  }

  void move () {
    y += speed;
  }

  //member methods
  void display() {
    if (health>40) {
      noStroke();
      fill(180);
      ellipse(x, y, health, health);
    } else if (health>30) {
      noStroke();
      fill(180);
      ellipse(x, y, health, health);
    } else if (health>20) {
      noStroke();
      fill(180);
      ellipse(x, y, health, health);
    } else if (health>10) {
      noStroke();
      fill(180);
      ellipse(x, y, health, health);
    }
  }
}
