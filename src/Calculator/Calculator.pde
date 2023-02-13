// Nate Manwaring | october 31 2022 | Calculator
Button[] numButtons = new Button[10];
Button[] opButtons = new Button[12];
String dVal = "0.0";
char op = ' ';
float l, r, result;
boolean left = true;

void setup() {
  size(400, 640);
  numButtons[0] = new Button(20, 460, 220, 60, '0');
  numButtons[1] = new Button(20, 220, 60, 60, '1');
  numButtons[2] = new Button(100, 220, 60, 60, '2');
  numButtons[3] = new Button(180, 220, 60, 60, '3');
  numButtons[4] = new Button(20, 300, 60, 60, '4');
  numButtons[5] = new Button(100, 300, 60, 60, '5');
  numButtons[6] = new Button(180, 300, 60, 60, '6');
  numButtons[7] = new Button(20, 380, 60, 60, '7');
  numButtons[8] = new Button(100, 380, 60, 60, '8');
  numButtons[9] = new Button(180, 380, 60, 60, '9');
  //Op buttons
  opButtons[0] = new Button(20, 140, 60, 60, '²');
  opButtons[1] = new Button(100, 140, 60, 60, '√');
  opButtons[2] = new Button(180, 140, 60, 60, '%');
  opButtons[3] = new Button(260, 140, 60, 60, 'π');
  opButtons[4] = new Button(260, 220, 60, 60, '.');
  opButtons[5] = new Button(260, 300, 60, 140, '=');
  opButtons[6] = new Button(260, 460, 60, 160, 'C');
  opButtons[7] = new Button(340, 140, 40, 80, '+');
  opButtons[8] = new Button(340, 240, 40, 80, '_');
  opButtons[9] = new Button(340, 340, 40, 80, '*');
  opButtons[10] = new Button(340, 440, 40, 80, '÷');
  opButtons[11] = new Button(340, 540, 40, 80, '±');
}

void draw() {
  background(60);
  for (int i=0; i<numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].hover(mouseX, mouseY);
  }
  for (int i=0; i<opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].hover(mouseX, mouseY);
  }
  textSize(15);
  text("Manwaring  Industries®", 80, 590);


  updateDisplay();
}

void keyPressed() {
  println("key:" + key);
  println("keyCode" + keyCode);
  if (keyCode == 49 || keyCode == 97) {
    handleEvent("1", true);
  } else if (keyCode == 50 || keyCode == 98) {
    handleEvent("2", true);
  } else if (keyCode == 48 || keyCode == 96) {
    handleEvent("0", true);
  }else if (keyCode == 46 || keyCode == 110) {
    handleEvent(".", false);
  }else if (keyCode == 51 || keyCode == 99) {
    handleEvent("3", true);
  }else if (keyCode == 52 || keyCode == 100) {
    handleEvent("4", true);
  }else if (keyCode == 53 || keyCode == 101) {
    handleEvent("5", true);
  }else if (keyCode == 54 || keyCode == 102) {
    handleEvent("6", true);
  }else if (keyCode == 55 || keyCode == 103) {
    handleEvent("7", true);
  }else if (keyCode == 56 || keyCode == 104) {
    handleEvent("8", true);
  }else if (keyCode == 57 || keyCode == 105) {
    handleEvent("9", true);
  }else if (keyCode == 61 || keyCode == 107) {
    handleEvent("+", false);
  }else if (keyCode == 45 || keyCode == 109) {
    handleEvent("-", false);
  }else if (keyCode == 106 || keyCode == 106) {
    handleEvent("*", false);
  }else if (keyCode == 47 || keyCode == 111) {
    handleEvent("÷", false);
  }else if (keyCode == 10 || keyCode == 10) {
    handleEvent("=", false);
  }
}

void handleEvent(String val, boolean num) {
  if (num && dVal.length() < 50) {
    if (dVal.equals("0.0")) {
      dVal = val;
    } else {
      dVal += val;
    }
    if (left) {
      l = float(dVal);
    } else {
      r = float(dVal);
    }
  } else if (val.equals("c")) { // All opbuttons here
    dVal= "0.0";
    op = ' ';
    l = 0.0;
    r = 0.0;
    result = 0.0;
    left = true;
  } else if (val.equals(".")) {
    if (!dVal.contains(".") == false) {
      dVal += ".";
    }
  }
}

void mouseReleased() {
  for (int i=0; i<numButtons.length; i++) {
    if (numButtons[i].on) {
      handleEvent(str(numButtons[i].val), true);
    }
  }

  for (int i=0; i<opButtons.length; i++) {
    if (opButtons[i].on && opButtons[i].val == 'C') {
      handleEvent("c", false);
    } else if (opButtons[i].on && opButtons[i].val == '+') {
      op = '+';
      dVal = "0.0";
      left = false;
    } else if (opButtons[i].on && opButtons[i].val == '_') {
      op = '_';
      dVal = "0.0";
      left = false;
    } else if (opButtons[i].on && opButtons[i].val == '*') {
      op = '*';
      dVal = "0.0";
      left = false;
    } else if (opButtons[i].on && opButtons[i].val == '÷') {
      op = '÷';
      dVal = "0.0";
      left = false;
    } else if (opButtons[i].on && opButtons[i].val == '=') {
      performCalculation();
    } else if (opButtons[i].on && opButtons[i].val == '±') {
      if (left) {
        l = l*-1;
        dVal = str(l);
      } else {
        r = r*-1;
        dVal = str(r);
      }
    } else if (opButtons[i].on && opButtons[i].val == 'π') {
      if (left) {
        l = PI;
        dVal= str(l);
      } else {
        r = PI;
        dVal = str(r);
      }
    } else if (opButtons[i].on && opButtons[i].val == '√') {
      if (left) {
        l = sqrt(l);
        dVal = str(l);
      } else {
        r = sqrt(r);
        dVal = str(r);
      }
    } else if (opButtons[i].on && opButtons[i].val == '%') {
      if (left){
      l = l / 100;
      dVal = str(l);
      } else{
        r = r / 100;
        dVal = str(r);
      }
    } else if (opButtons[i].on && opButtons[i].val == '.') {
      handleEvent(".", false);
    } else if (opButtons[i].on && opButtons[i].val == '²') {
      if (left) {
        l = sq(l);
        dVal = str(l);
      } else {
        r = sq(r);
        dVal = str(r);
      }
    }

    println("l:" + l + " r:" + r + "op:" + op + "left:" + left);
  }
}


void updateDisplay() {
  fill(#D9DAE0);
  rect(20, 20, 360, 100, 5);
  fill(0);
  textAlign(RIGHT);

  //render scaling text
  if (dVal.length()<30) {
    textSize(20);
  } else if (dVal.length()<40) {
    textSize(15);
  } else if (dVal.length()<58) {
    textSize(10);
  } else if (dVal.length()<80) {
    textSize(8);
  } 

  text(dVal, width-70, 80);
}


void performCalculation() {
  if (op == '+') {
    result = l + r;
  } else if (op == '_') {
    result = l - r;
  } else if (op == '*') {
    result = l * r;
  } else if (op == '÷') {
    result = l / r;
  }
  dVal = str(result);
  l=result;
  left = true;
}
