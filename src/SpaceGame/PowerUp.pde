class PowerUp {
  //member variables
  int x, y, speed, rad, pu;
  String[] puInfo = {"Ammo", "Health", "Lasers", "Super"};

  //constructor
  PowerUp(int x, int y) {
    rad = 80;
    this.x = x;
    this.y = y;
    speed = int(random(2, 8));
    pu = int(random(4));
  }

  void move() {
    y += speed;
  }

  boolean reachedBottom() {
    if (y > height + rad*4) {
      return true;
    } else {
      return false;
    }
  }

  //member methods
  void display() {
    noStroke();
    switch(pu) {
    case 0: //Ammo
      fill(25, 240, 255);
      ellipse(x, y, rad, rad);
      fill(0);
      textSize(9);
      textAlign(CENTER);
      text(puInfo[0], x, y);
      break;
    case 1: //Health
      fill(213, 255, 77);
      ellipse(x, y, rad, rad);
      fill(0);
      textSize(9);
      textAlign(CENTER);
      text(puInfo[1], x, y);
      break;
    case 2: //Lasers
      fill(255, 103, 79);
      ellipse(x, y, rad, rad);
      fill(0);
      textSize(9);
      textAlign(CENTER);
      text(puInfo[2], x, y);
      break;
    case 3: //Super
      fill(255, 159, 33);
      ellipse(x, y, rad, rad);
      fill(0);
      textSize(9);
      textAlign(CENTER);
      text(puInfo[2], x, y);
      break;
    }
  }
}
