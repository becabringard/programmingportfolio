//Global Variables
int x, y;

void setup() {
  size(400, 400);
  frameRate(10);
  x = 10;
  y = 10;
}

void draw () {
  fill(0);
  strokeWeight(3);
  if(keyPressed) {
    if(key == 'd' || key == 'D') {
      moveRight(5);
    } else if(key == 'a' || key == 'A') {
      moveLeft(5);
    } else if(key == 'w' || key == 'W') {
      moveUp(5);
    } else if(key == 's' || key == 'S') {
      moveDown(5);
    }
  }
  //drawName();
  //noLoop();
}

void mouseClicked() {
  saveFrame("line-######.png");
}

void keyPressed() {
  if(key == CODED) {
    if(keyCode == RIGHT) {
      moveRight(5);
    } else if(keyCode == LEFT) {
      moveLeft(5);
    } else if(keyCode == UP) {
      moveUp(5);
    } else if(keyCode == DOWN) {
      moveDown(5);
    }
  }
}

//Algorithm for your first name
void drawName() {
  moveDown(100);
  moveUpRight(25);
  moveUpLeft(25);
  moveUpRight(25);
  moveUpLeft(25);
  moveDown(100);
  moveRight(40);
  moveUp(20);
  moveUpRight(12);
  moveDownRight(12);
  moveLeft(24);
  moveDown(10);
  moveDownRight(12);
  moveUpRight(12);
  moveDownLeft(12);
  moveRight(30);
  moveUp(20);
  moveUpRight(10);
  moveDownRight(10);
  moveUpLeft(10);
  moveDownLeft(10);
  moveDown(12);
  moveDownRight(10);
  moveUpRight(10);
  moveDownLeft(10);
  moveRight(20);
  moveUp(20);
  moveUpRight(10);
  moveDownRight(10);
  moveDown(20);
  moveUp(7);
  moveDownLeft(10);
  moveUpLeft(10);
  moveDownRight(10);
  moveUpRight(10);
  moveUp(23);
}

//Method to draw right lines
void moveRight(int rep) {
  for (int i = 0; i<rep; i++) {
    point(x+i, y);
  }
  x=x+rep;
}

//Method to draw left line
void moveLeft(int rep) {
  for (int i = 0; i<rep; i++) {
    point(x-i, y);
  }
  x=x-rep;
}

//Method to draw up lines
void moveUp(int rep) {
  for (int i = 0; i<rep; i++) {
    point(x, y-i);
  }
  y=y-rep;
}

//Method to draw down
void moveDown(int rep) {
  for (int i = 0; i<rep; i++) {
    point(x, y+i);
  }
  y=y+rep;
}

//Method to draw down right lines
void moveDownRight(int rep) {
  for (int i = 0; i<rep; i++) {
    point(x+i, y+i);
  }
  x=x+rep;
  y=y+rep;
}

//Method to draw up right lines
void moveUpRight(int rep) {
  for (int i = 0; i<rep; i++) {
    point(x+i, y-i);
  }
  x=x+rep;
  y=y-rep;
}

//Method for up left
void moveUpLeft(int rep) {
  for (int i = 0; i<rep; i++) {
    point(x-i, y-i);
  }
  x=x-rep;
  y=y-rep;
}

//Method for down left
void moveDownLeft(int rep) {
  for (int i = 0; i<rep; i++) {
    point(x-i, y+i);
  }
  x=x-rep;
  y=y+rep;
}
