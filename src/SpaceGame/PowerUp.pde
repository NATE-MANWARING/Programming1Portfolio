class PowerUp {
  int x, y, speed, diam;
  PImage ammo;
  char type;

  // constructor
  PowerUp() {
    x = int(random(width));
    y = -50;
    speed = int(random(2, 10));
    diam = int(50);
    ammo = loadImage("Ammo.png");
    if (int(random(2))==0) {
      type = 'H';
    } else {
      type = 'A';
    }
  }

  void display() {
    imageMode(CENTER);
    image(ammo, x, y);
    ammo.resize(diam, diam);
    text(type, x, y);
  }

  void move() {
    y += speed;
  }

  boolean reachedBottom() {
    if (y>height+100) {
      return true;
    } else {
      return false;
    }
  }
  
    boolean intersect(Ship ship) {
    float d = dist(x, y, ship.x, ship.y);
    if (d<30) {
      return true;
    } else {
      return false;
    }
  }
}
