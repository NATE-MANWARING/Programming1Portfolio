class Button {
  //Member variables
  int x, y, w, h;
  char val;
  color c1, c2;
  boolean on;

  //constructor
  Button(int x, int y, int w, int h, char val) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.val = val;
    c1 = color(125);
    c2 = color(#3B2FAD);
    on = false;
  }

  //member methods
  void display() {
    if (on) {
      fill(c2);
    } else {
      fill(c1);
    }
    rect(x, y, w, h, 5);
    fill(0);
    textAlign(CENTER);
    textSize(15);
    if (val == '0') {
      text(val, x+110, y+30);
    } else if (val == '=') {
      text(val, x+30, y+70);
    } else if (val == 'C') {
      text(val, x+30, y+70);
    } else if (val == '+') {
      text(val, x+20, y+40);
    } else if (val == '_') {
      text(val, x+20, y+40);
    } else if (val == '*') {
      text(val, x+20, y+40);
    } else if (val == '÷') {
      text(val, x+20, y+40);
    } else if (val == '±') {
      text(val, x+20, y+40);
    } else {
      text(val, x+30, y+30);
    }
  }

  void hover(int mx, int my) {
    on = (mx > x && mx < x+w && my > y && my < y+h);
  }
}
