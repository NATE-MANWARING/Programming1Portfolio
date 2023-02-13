//Nate Manwaring | November 28 2022 | Space Game
//import processing.sound.*;
//SoundFile music, laserSound, puSound;
Ship s1;
ArrayList<Rock> rocks = new ArrayList<Rock>();
ArrayList<PowerUp> powerups = new ArrayList<PowerUp>();
Star[] stars = new Star[75];
ArrayList<Laser> lasers = new ArrayList<Laser>();
Timer rockTimer;
Timer puTimer;
int score;
int level, rockRate, rocksPassed, rockCount, laserCount;
boolean play;


void setup() {
  size(800, 800);
  s1 = new Ship();
  rockRate = 500;
  rockTimer = new Timer(rockRate);
  rockTimer.start();
  puTimer = new Timer(10000);
  puTimer.start();
  for (int i=0; i<stars.length; i++) {
    stars[i] = new Star();
  }
  score = 0;
  level = 1;
  play = false;
}


void draw() {
  if (!play) {
    startScreen();
  } else {


    //Level Handling
    if (frameCount % 1000 == 10) {
      level++;
      rockRate-=100;
    }

    background(0);
    noCursor();
    infoPannel();

    //star rendering
    for (int i=0; i<stars.length; i++) {
      stars[i].display();
      stars[i].move();
    }

    //laser rendering

    for (int i = 0; i < lasers.size(); i++) {
      Laser l = lasers.get(i);
      for (int j = 0; j < rocks.size(); j++) {
        Rock r = rocks.get(j);
        if (r.intersect(l)) {
          score+=r.diam;
          //todo add sound
          //todo add animation
          //todo remove rock health
          lasers.remove(l);
          rocks.remove(r);
        }

        if (l.reachedTop()) {
          lasers.remove(l);
        } else {
          l.display();
          l.move();
        }
      }
    }




    //ship rendering
    s1.display(mouseX, mouseY);

    //add power ups
    if (puTimer.isFinished()) {
      powerups.add(new PowerUp());
      puTimer.start();
    }

    //Power up rendering and ship colDet
    for (int i = 0; i < powerups.size(); i++) {
      PowerUp pu = powerups.get(i);
      if (pu.intersect(s1)) {
        if (pu.type == 'H') {
          s1.health+=50;
          //puSound = new SoundFile(this, "powerUp.wav");
          //puSound.play();
          //puSound.amp(0.7);
        } else {
          s1.ammo+=25;
         // puSound = new SoundFile(this, "powerUp.wav");
         // puSound.play();
         // puSound.amp(0.5);
        }
        powerups.remove(pu);
      }
      if (pu.reachedBottom()) {
        powerups.remove(pu);
      } else {
        pu.display();
        pu.move();
      }

      //Game over Logic
      if (s1.health < 1) {
        gameOver();
      }
    }

    //add rocks
    if (rockTimer.isFinished()) {
      rocks.add(new Rock());
      rockTimer.start();
    }
    //rock rendering and detecting ship collision
    for (int i = 0; i < rocks.size(); i++) {
      Rock r = rocks.get(i);
      if (s1.intersect(r)) {
        s1.health-=r.diam;
        //todo explosion animation
        // add a sound
        // todo: consider adding rock health
        score-=r.diam;
        rocks.remove(r);
      }
      if (r.reachedBottom()) {
        rocks.remove(r);
      } else {
        r.display();
        r.move();
      }
      //Game over Logic
      if (s1.health < 1) {
        gameOver();
      }
    }
  }
}

void infoPannel() {
  fill(129, 128);
  rectMode(CENTER);
  rect(100, 25, displayWidth, 100);
  textSize(25);
  fill(200, 200, 0);
  text("Score:" + score, 70, 40);
  text("Level:" + level, 180, 40);
  text("Ammo:" + s1.ammo, 290, 40);
  text("Health:" + s1.health, 440, 40);
}

void mousePressed() {
  if (s1.fire() && s1.turretCount == 1) {
    lasers.add(new Laser(s1.x, s1.y));
    println("Lasers:" + lasers.size());
    if (play == true) {
      //laserSound = new SoundFile(this, "laserNoise.wav");
     // laserSound.play();
     // laserSound.amp(0.5);
    }
    //laserSound.volume();
  } else if (s1.fire() && s1.turretCount == 2) {
    lasers.add(new Laser(s1.x-20, s1.y));
    lasers.add(new Laser(s1.x+20, s1.y));
  }
}

void keyPressed() {
  if (key == ' ') {
    if (s1.fire() && s1.turretCount == 1) {
      lasers.add(new Laser(s1.x, s1.y));
      println("Lasers:" + lasers.size());
    } else if (s1.fire() && s1.turretCount == 2) {
      lasers.add(new Laser(s1.x-20, s1.y+100));
      lasers.add(new Laser(s1.x+20, s1.y+100));
    }
  }
}

void startScreen() {
  background (50, 50, 125);
  fill(222);
  textAlign(CENTER);
  textSize(30);
  text("Press any key or click to begin...", width/2, height/2);
  if (mousePressed || keyPressed) {
    play = true;
   // music = new SoundFile(this, "3-05 - Sinister Sundown.wav");
   // music.play();
  }
}

void gameOver () {
  background (90, 0, 0);
  fill(222);
  textAlign(CENTER);
  textSize(30);
  text("GAME OVER", width/2, height/2);
  noLoop();
}
