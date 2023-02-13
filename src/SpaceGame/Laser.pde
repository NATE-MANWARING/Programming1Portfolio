class Laser {
  int x, y, w, h, speed, diam;
  PImage laser;

  // constructor
  Laser(int x, int y) {
    this.x = x;
    this.y = y-70;
    w = 15;
    h = 35;
    diam = 45;
    speed = 10;
    laser = loadImage("Laser.png");
  }

  void display() {
    laser.resize(diam, diam);
    imageMode(CENTER);
    image(laser, x, y);
    
  }

  void move() {
    y -= speed;
  }

  boolean reachedTop() {
    if (y< -20) {
      return true;
    } else {
    return false;
    }
  }
  
   boolean intersect(Rock rock) {
    float d = dist(x, y, rock.x, rock.y);
    if (d<rock.diam) {
      return true;
    } else {
      return false;
    }
  }
}
