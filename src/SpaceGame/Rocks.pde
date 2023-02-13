class Rock {
  int x, y, speed, diam;
  PImage rock;

  // constructor
  Rock() {
    x = int(random(width));
    y = -50;
    speed = int(random(2, 10));
    diam = int(random(20,80));
    rock = loadImage("Rock.png");
  }

  void display() {
    imageMode(CENTER);
    image(rock, x, y);
    rock.resize(diam,diam);
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
  
  boolean intersect(Laser laser) {
    float d = dist(x, y, laser.x, laser.y);
    if (d<laser.diam) {
      return true;
    } else {
      return false;
    }
  }
}
