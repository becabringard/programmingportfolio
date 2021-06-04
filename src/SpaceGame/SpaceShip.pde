class SpaceShip {
  //member variables
  int x, y, health, lives, rad, ammo;
  color c;
  float easing;

  //constructor
  SpaceShip(color c) {
    x = 0;
    y = 0;
    health = 100;
    lives = 3;
    rad = 25;
    this.c = c;
    easing = 0.5;
    ammo = 500;
    weaponCount = 1;
  }

  //Rock vs Ship Collision
  boolean rockIntersection(Rock rock) {
    float distance = dist(x, y, rock.x, rock.y);
    if (distance < rad + rock.rad) {
      return true;
    } else {
      return false;
    }
  }
  
  //PowerUps for ship
    boolean puIntersection(PowerUp pu) {
    float distance = dist(x, y, pu.x, pu.y);
    if (distance < rad + pu.rad) {
      return true;
    } else {
      return false;
    }
  }

  //member methods
  void display(int x, int y) {
    this.x = x;
    this.y = y;
    ellipseMode (CENTER);
    rectMode(CENTER);

    //base
    stroke(0);
    strokeWeight(0);
    fill(200);
    rect(x, y, 30, 50);

    //window
    stroke(0);
    strokeWeight(3);
    fill(100);
    ellipse(x, y, 20, 20);

    //roof
    stroke(2);
    strokeWeight(0);
    fill(c);
    triangle(x, y-40, x+14, y-25, x-16, y-25);

    //fins
    stroke(0);
    strokeWeight(1);
    triangle(x-15, y+25, x-35, y+50, x-15, y+5);
    stroke(0);
    strokeWeight(1);
    triangle(x+15, y+25, x+35, y+50, x+15, y+5);

    //fire
    stroke(0);
    strokeWeight(0);
    fill(c);
    quad(x, y+25, x+10, y+40, x, y+55, x-10, y+40);
    fill(255, 200, 0);
    quad(x, y+25, x+5, y+35, x, y+45, x-5, y+35);
  }
}
