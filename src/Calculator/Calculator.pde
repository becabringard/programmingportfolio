Button[] numButtons = new Button[10];
Button[] opButtons = new Button[13];
String dVal;
String op; //operator to use in calculations
float r = 0.0; //what is right of the operator
float l = 0.0; //what is left of the operator
float result = 0.0; //the answer
boolean left = true;
int currentNum = 0;

void setup() {
  size(250, 350);
  dVal = "0";
  op = "";
  left = true;
  r = 0.0;
  l = 0.0;
  result = 0.0;
  numButtons[0] = new Button(60, 300, 130, 40, "0", true);
  numButtons[1] = new Button(15, 250, 40, 40, "1", true);
  numButtons[2] = new Button(60, 250, 40, 40, "2", true);
  numButtons[3] = new Button(105, 250, 40, 40, "3", true);
  numButtons[4] = new Button(15, 200, 40, 40, "4", true);
  numButtons[5] = new Button(60, 200, 40, 40, "5", true);
  numButtons[6] = new Button(105, 200, 40, 40, "6", true);
  numButtons[7] = new Button(15, 150, 40, 40, "7", true);
  numButtons[8] = new Button(60, 150, 40, 40, "8", true);
  numButtons[9] = new Button(105, 150, 40, 40, "9", true);
  opButtons[0] = new Button(15, 100, 40, 40, "C", false);
  opButtons[1] = new Button(195, 300, 40, 40, "=", false);
  opButtons[2] = new Button(150, 300, 40, 40, ".", false);
  opButtons[3] = new Button(150, 250, 40, 40, "x²", false);
  opButtons[4] = new Button(195, 250, 40, 40, "+", false);
  opButtons[5] = new Button(150, 200, 40, 40, "√", false);
  opButtons[6] = new Button(195, 200, 40, 40, "-", false);
  opButtons[7] = new Button(150, 150, 40, 40, "cos", false);
  opButtons[8] = new Button(195, 150, 40, 40, "x", false);
  opButtons[9] = new Button(60, 100, 40, 40, "+/-", false);
  opButtons[10] = new Button(105, 100, 40, 40, "%", false);
  opButtons[11] = new Button(150, 100, 40, 40, "ran", false);
  opButtons[12] = new Button(195, 100, 40, 40, "÷", false);
}

void draw() {
  background(100, 118, 135);
  for (int i=0; i<numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].hover();
  }
  for (int i=0; i<opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].hover();
  }
  updateDisplay();
}

void updateDisplay() {
  fill(255, 242, 204);
  rect(5, 10, 240, 80, 30);
  textSize(10);
  fill(0);
  textAlign(RIGHT);

  if (dVal.length()<13) {
    textSize (28);
  } else if (dVal.length()<14) {
    textSize(26);
  } else if (dVal.length()<15) {
    textSize(24);
  } else if (dVal.length()<17) {
    textSize(21);
  } else if (dVal.length()<19) {
    textSize(19);
  } else if (dVal.length()<21) {
    textSize(17);
  } else if (dVal.length()<23) {
    textSize(15);
  } else if (dVal.length()<25) {
    textSize(14);
  } else {
    textSize(12);
  }
  text(dVal, 230, 70);
}

void mouseReleased() {
  println("L:"+1+"R." + r + "Op:" + op);
  println("Result:"+result+"Left:"+left);

  for (int i=0; i<numButtons.length; i++) {
    if (numButtons[i].hover && dVal.length()<20) {
      handleEvent(numButtons[i].val, true);
    }
  }

  for (int i=0; i<opButtons.length; i++) {
    if (opButtons[i].hover) {
      handleEvent(opButtons[i].val, false);
    }
  }
}

void keyPressed() {
  println("KEY:" + key + " keyCode:" + keyCode);

  if (key == '0' && dVal.length()<20) {
    handleEvent("0", true);
  } else if (key == '1') {
    handleEvent("1", true);
  } else if (key == '2') {
    handleEvent("2", true);
  } else if (key == '3') {
    handleEvent("3", true);
  } else if (key == '4') {
    handleEvent("4", true);
  } else if (key == '5') {
    handleEvent("5", true);
  } else if (key == '6') {
    handleEvent("6", true);
  } else if (key == '7') {
    handleEvent("7", true);
  } else if (key == '8') {
    handleEvent("8", true);
  } else if (key == '9') {
    handleEvent("9", true);
  } else if (key == '+') {
    handleEvent("+", false);
  } else if (key == '-') {
    handleEvent("-", false);
  } else if (key == '*') {
    handleEvent("x", false);
  } else if (key == '/') {
    handleEvent("÷", false);
  } else if (key == '.') {
    handleEvent(".", false);
  } else if (key == 'C') {
    handleEvent("C", false);
  } else if (key == 10) { //(key == CODED) {
    if (keyCode == ENTER || keyCode == RETURN) {
      handleEvent("=", false);
    }
  } else if(keyCode == 27)  {
    key = 0;
    if (key == 0) {
      handleEvent("C", false);
    }
  }
}

String handleEvent (String val, boolean num) {
  if (left && num) {
    if (dVal.equals("0") || result == l) {
      dVal = (val);
      l = float(dVal);
    } else {
      dVal += (val);
      l = float(dVal);
    }
  } else if (!left && num) {
    if (dVal.equals("0") || result == l) {
      dVal = (val);
      r = float(dVal);
    } else {
      dVal += (dVal);
      r = float(dVal);
    }
  } else if (val.equals("C")) {
    dVal = "0";
    result = 0.0;
    left = true;
    r = 0.0;
    l = 0.0;
    op = "";
  } else if (val.equals("+")) {
    if (!left) {
      performCalc();
    } else {
      op = "+";
      left = false;
      dVal = "0";
    }
  } else if (val.equals("-")) {
    op = "-";
    left = false;
    dVal = "0";
  } else if (val.equals("x")) {
    op = "x";
    left = false;
    dVal = "0";
  } else if (val.equals("÷")) {
    op = "÷";
    left = false;
    dVal = "0";
  } else if (val.equals("÷")) {
    op = "÷";
    left = false;
    dVal = "0";
  } else if (val.equals("%")) {
    if (left) {
      l *= 0.1;
      dVal = str(l);
    } else {
      r *= 0.1;
      dVal = str(r);
    }
  } else if (val.equals("+/-")) {
    if (left) {
      l *= -1;
      dVal = str(l);
    } else {
      r *= -1;
      dVal = str(r);
    }
  } else if (val.equals("x²")) {
    if (left) {
      l = sq(l);
      dVal = str(l);
    } else {
      r = sq(r);
      dVal = str(r);
    }
  } else if (val.equals("√")) {
    if (left) {
      l = sqrt(l);
      dVal = str(l);
    } else {
      r = sqrt(r);
      dVal = str(r);
    }
  } else if (val.equals("cos")) {
    if (left) {
      l = cos(radians(l));
      dVal = str(l);
    } else {
      r = cos(radians(r));
      dVal = str(r);
    }
  } else if (val.equals("ran")) {
    if (left) {
      l = random(0, 1);
      dVal = str(l);
    } else {
      r = random(0, 1);
      dVal = str(r);
    }
  } else if (val.equals(".") && !dVal.contains(".")) {
    dVal += (val);
  } else if (val.equals("=")) {
    performCalc();
  }
  return val;
}

void performCalc() {
  if (op.equals("+")) {
    result = l + r;
  } else if (op.equals("-")) {
    result = l - r;
  } else if (op.equals("x")) {
    result = l * r;
  } else if (op.equals("÷")) {
    result = l / r;
  }
  l = result;
  dVal = str(result);
  left = true;
}
