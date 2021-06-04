class Alien {
  int x, y, points, health, rad;
  color c;
  float easing;
  
  Alien(color c) {
    x = 0;
    y = 0;
    points = 0;
    this.c = c;
    easing = 0.5;
    rad = 4;
  }
  
  void display(int x, int y) {
    this.x = x;
    this.y = y;
    ellipseMode (CENTER);
  rectMode(CENTER);
  
  //body
  stroke(0);
  fill(102, 255, 153);
  rect(x,y,20,100);
  
  //head
  stroke(0);
  fill(102, 255, 153);
  ellipse(x,y-30,60,60);
  
  //eyes
  fill(255, 153, 0);
  ellipse(x-19,y-30,16,32);
  ellipse(x+19,y-30,16,32);
  
  //legs
  stroke(0);
  line(x-10,y+50,x-20,y+60);
  line(x+10,y+50,x+20,y+60);
  
  //shirt
  stroke(0);
  fill(204, 153, 255);
  rect(x,y+15,20,30);
  }
}
