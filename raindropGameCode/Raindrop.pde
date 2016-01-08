class Raindrop {
  PVector loc, vel;
  int r, diam;
  float gravity;
  color a, b, c, d;
  float ran;
  boolean yes = false;

  Raindrop(float w, float v) {
    diam = 50;
    loc = new PVector(w, v);
    a = color(255);
    b = color(255, 0, 0);
    c = color(0, 255, 0);
    d = color(0, 0, 255);
    vel = PVector.random2D();
    vel.mult(20);
    gravity = random(.2, .8);
    ran = random(0, 1);
  }


  void display() {
    fill(a);
    noStroke();
    ellipse(loc.x, loc.y, diam, diam);
  }

  void fall() {
    loc.y+=vel.y;
    if (loc.y<=height) {
      vel.ye+=gravity;
    }
  }

  boolean isInContactWith(Catcher c) {
    if (c.loc.dist(loc)<c.diam/2 + diam/2) {
      return true;
    } 
    else {
      return false;
    }
  }



  void reset() {
    loc.x = random(width);
    loc.y = 0;
    vel = PVector.random2D();
    vel.mult(4);
  }
  void colorChange() {
    if (ran>.25 && ran<.5) {
      a=b;
    }
    if (ran>.5 && ran<.75) {
      a=c;
    }
    if (ran>.75) {
      a=d;
    }
  }
  
  boolean y() {
    if (a==a) {
      return true;
    }
    else {
      return false;
    }
  }
}

