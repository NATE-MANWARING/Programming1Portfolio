//Nate Manwaring | Oct 3 2022 | Etch a Sketch

int x, y;

void setup() {
  size(650, 650);
  x = width/2;
  y = height/2;
  background(100);
}

void draw() {
  stroke(255);
  strokeWeight(3);
  if (keyPressed) {
    if (key == 'w' || key == 'W') {
      moveUp(5);
    } else if (key == 'd' || key == 'D') {
      moveRight(5);
    } else if (key == 'a' || key == 'A') {
      moveLeft(5);
    } else if (key == 's' || key == 'S') {
      moveDown(5);
    }
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      moveUp(5);
    } else if (keyCode == DOWN) {
      moveDown(5);
    } else if (keyCode == RIGHT) {
      moveRight(5);
    } else if (keyCode == LEFT) {
      moveLeft(5);
    }
  }
}

void mousePressed() {
  saveFrame("line-######.png");
}

// All directional control

void moveRight(int rep) {
  for (int i=0; i<rep; i++) {
    point(x+i, y);
  }
  x=x+rep;
}

void moveDown (int rep) {
  for (int i=0; i<rep; i++) {
    point(x, y+i);
  }
  y=y+rep;
}

void moveUp (int rep) {
  for (int i=0; i<rep; i++) {
    point(x, y-i);
  }
  y=y-rep;
}

void moveLeft(int rep) {
  for (int i=0; i<rep; i++) {
    point(x-i, y);
  }
  x=x-rep;
}
