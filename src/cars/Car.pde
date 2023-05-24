class Car {
  color c;
  float xpos, ypos, xspeed;
  boolean left;

  Car() {
    c = color(random(100, 255), random(100, 255), random(100, 255));
    xpos = random(width);
    ypos = random(height);
    xspeed = random(1, 3);
    if (int(random(2))==0) {
      left= true;
    } else {
      left=false;
    }
  }
  void display() {
    rectMode(CENTER);
    fill(c);
    //rect(xpos, ypos, 20, 10);
    //fill(0);
    //rect(xpos-7, ypos-7, 6, 2);
    //rect(xpos-7, ypos+7, 6, 2);
    //rect(xpos+7, ypos-7, 6, 2);
    //rect(xpos+7, ypos+7, 6, 2);
    //fill(150, 150, 255);
    //rect(xpos+4, ypos, 8, 6);
    circle(xpos, ypos, 20);
    fill(0);
    line(xpos-7, ypos-7, xpos-8,ypos-18);
    line(xpos-3, ypos-9, xpos-4,ypos-18);
    line(xpos+1, ypos-11, xpos,ypos-18);
    line(xpos+5, ypos-9, xpos+4,ypos-18);
    line(xpos-7, ypos+7, xpos-8, ypos+18);
    line(xpos-3, ypos+9, xpos-4, ypos+18);
    line(xpos+1, ypos+11, xpos, ypos+18);
    line(xpos+5, ypos+9, xpos+4, ypos+18);

    
    
  }

  void drive() {
    if (left == true) {
      xpos-=xspeed;
    } else {
      xpos+=xspeed;
    }
    
    if (xpos>width) {
      xpos=0;
    }
     if (xpos<0) {
      xpos=width;
    }
  }
}
