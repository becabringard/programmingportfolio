/// SpaceGame 2020 December
// By Beca Bringard

SpaceShip s1;
ArrayList<Laser> lasers;
ArrayList <Rock> rocks;
ArrayList <Star> stars;
ArrayList <PowerUp> pUps;
Timer rockTimer, puTimer;
int score, pass, superWeapon, weaponCount, laserCount;
boolean play;

void setup() {
  size(500, 500);
  s1 = new SpaceShip(#CB741D);
  lasers = new ArrayList();
  rocks = new ArrayList();
  stars = new ArrayList();
  pUps = new ArrayList();
  rockTimer = new Timer(int(random(1000, 3000)));
  rockTimer.start();
  puTimer = new Timer(5000);
  puTimer.start();
  weaponCount = 1;
  laserCount = 0;
  superWeapon = 0;
  score = 0;
  pass = 0;
  play = false;
}

void draw() {
  noCursor();
  //Gameplay
  if (!play) {
    startScreen();
  } else {
    background(0);

    stars.add(new Star(int(random(width)), int(random(height)), color(random(190, 255))));
    for (int i = 0; i < stars.size(); i++) {
      Star star = stars.get(i);
      star.display();
      star.move();
      if (star.reachedBottom()) {
        stars.remove(star);
      }
    }

    if (rockTimer.isFinished()) {
      rocks.add(new Rock(int(random(width)), -50));
      rockTimer.start();
    }

    for (int i = 0; i < rocks.size(); i++) {
      Rock rock = rocks.get(i);
      rock.display();
      rock.move();
      //Rock vs Ship Collision
      if (s1.rockIntersection(rock)) {
        s1.health -= rock.health;
        rocks.remove(rock);
        score-=rock.health;
      }
      if (rock.reachedBottom()) {
        pass++;
        rocks.remove(rock);
      }
    }

    for (int i = 0; i < lasers.size(); i++) {
      Laser laser = lasers.get(i);
      laser.display();
      laser.fire();
      //Laser vs Rock Intersection
      for (int j = 0; j < rocks.size(); j++) {
        Rock rock = rocks.get(j);
        if (rock.laserIntersection(laser)) {
          rock.health-=10;
          lasers.remove(laser);
          if (rock.health<1) {
            rocks.remove(rock);
            score -= rock.health;
          }
        }
      }
      if (laser.reachedTop()) {
        lasers.remove(laser);
      }
    }

    //PowerUps
    if (puTimer.isFinished()) {
      pUps.add(new PowerUp(int(random(width)), -50));
      puTimer.start();
    }

    for (int i = 0; i<pUps.size(); i++) {
      PowerUp pu = pUps.get(i);
      pu.move();
      pu.display();
      if (s1.puIntersection(pu)) {
        if (pu.pu == 0) {
          s1.ammo+=1000;
        } else if (pu.pu == 1) {
          s1.health+=75;
        } else if (pu.pu == 2) {
          weaponCount++;
        } else if (pu.pu == 3) {
          superWeapon++;
        }
        pUps.remove(pu);
      }
      if (pu.reachedBottom()) {
        pUps.remove(pu);
      }
    }


    s1.display(mouseX, mouseY);
    infoPanel();

    //GameOver Logic
    if (s1.health<1 || pass>10) {
      play = false;
      gameOver();
    }
  }
}



void mousePressed() {

  if (s1.ammo>0) {
    if (weaponCount == 1) {
      lasers.add(new Laser(s1.x, s1.y));
      laserCount++;
      s1.ammo--;
    } else if (weaponCount == 2) {
      lasers.add(new Laser(s1.x-20, s1.y));
      lasers.add(new Laser(s1.x+20, s1.y));
      laserCount++;
      s1.ammo-=2;
    } else if (weaponCount == 3) {
      lasers.add(new Laser(s1.x, s1.y));
      lasers.add(new Laser(s1.x-20, s1.y));
      lasers.add(new Laser(s1.x+20, s1.y));
      laserCount++;
      s1.ammo-=3;
    } else if (weaponCount == 4) {
      lasers.add(new Laser(s1.x-20, s1.y));
      lasers.add(new Laser(s1.x+20, s1.y));
      lasers.add(new Laser(s1.x-40, s1.y));
      lasers.add(new Laser(s1.x+40, s1.y));
      laserCount++;
      s1.ammo-=4;
    } else if (weaponCount == 5) {
      lasers.add(new Laser(s1.x, s1.y));
      lasers.add(new Laser(s1.x-20, s1.y));
      lasers.add(new Laser(s1.x+20, s1.y));
      lasers.add(new Laser(s1.x-40, s1.y));
      lasers.add(new Laser(s1.x+40, s1.y));
      laserCount++;
      s1.ammo-=5;
    }
  }
}

void startScreen() {
  background(0);
  textAlign(CENTER);
  text("Welcome to SpaceGame", width/2, height/2);
  text("Click your mouse to shoot lasers to destroy the asteroids the more asteroids", width/2, height/2+20);
  text("you destroy, the higher your score. don't let the asteroids get you though", width/2, height/2+40);
  text("that'll lower your score", width/2, height/2+60);
  text("Click to continue...", width/2, height/2+100);

  if (mousePressed) {
    play = true;
  }
}

void infoPanel() {
  fill(255, 128);
  rectMode(CORNER);
  rect(0, height-50, width, 50);
  text("Health: " + s1.health, 50, height-20);
  text("Lives: " + s1.lives, 120, height-20);
  text("Level: ", 180, height-20);
  text("Score: "+ score, 230, height-20);
  text("Pass: " + pass, 285, height-20);
  text("Ammo: " + s1.ammo, 345, height-20);
  text("SuperWeapon: " + superWeapon, 430, height-20);
}

void gameOver() {
  background(0);
  textAlign(CENTER);
  fill(222);
  text("Game Over!", width/2, height/2+20);
  text("Final Score" + score, width/2, height/2+40);
  noLoop();
}
