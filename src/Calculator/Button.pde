class Button {
  // Member variables
  int x, y, w, h;
  String val;
  boolean hover, isNumber;

  // Constructor
  Button(int tempX, int tempY, int tempW, int tempH, String tempVal, boolean isNumber) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    val = tempVal;
    hover = false;
    this.isNumber = isNumber;
  }

  // Display Method
  void display() {
    if (isNumber) { //formatting buttons as numbers
      if (hover) {
        fill(186, 176, 191);
      } else {
        fill(255, 213, 231);
      }
      ellipse(x+21, y+18, w, h);
      fill(0);
      textSize(14);
      text(val, x+33, y+23);
    } else { //formatting buttons as operators
      if (hover) {
        fill(214, 193, 150);
      } else {
        fill(250, 225, 175);
      }
      ellipse(x+21, y+18, w, h);
      fill(0);
      text(val, x+33, y+23);
    }
  }



  // Hover Method
  void hover() {
    hover = (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h);
  }
}
