void setup() {
  size(400, 400);
}

void draw() {
  background(128);
  //horizontal
  line(0,150,width,150);
  for(int i=0; i<width; i+=20) {
    line(i,146,i,154);
    textSize(8);
    textAlign(CENTER);
    text(i,i,146);
  }
  ellipse(mouseX,150,5,5);
  text("Km:" + convertToKm(mouseX),mouseX,165);
  
  //2nd line
  line(0,200,width,200);
  for(int i=0; i<width; i+=20) {
    line(i,196,i,204);
    textSize(8);
    textAlign(CENTER);
    text(i,i,196);
  }
  ellipse(mouseX,200,5,5);
  text("Mil:" + convertToMil(mouseX),mouseX,215);
  
  
  println("convert 3 kilometers to mils: " + convertToMil(3));
  println("convert 3 miles to Kms: " + convertToKm(3));
  
  //title
  textSize(20);
  textAlign(CENTER);
  text("Miles to Kilometers conversion", width/2, 50);
  
  //description
  textSize(10);
  textAlign(CENTER);
  text("Drag your mouse along the numberlines to figure out \n Miles/Kilometers conversion. The top numberline gives you miles to kilometers, \n and the bottom line gives you kilometers to miles", width/2, 70);
  
  //developer
  text("Beca Bringard | Oct. 2020", width/2, 250);
}

float convertToMil(float val) {
  val = (val/8.0)*5;
  return val;
}

float convertToKm(float val) {
  val = (val/5.0)*8;
  return val;
}
