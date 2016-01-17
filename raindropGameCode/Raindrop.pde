class Raindrop {  //new class called Raindrop
  PVector loc, vel, a;  //new PVectors loc, vel, a
  int r, diam;  //initialize variables r, diam



  Raindrop(float x, float y) {  //float coordinates of Raindrop
    diam = 50;  //diam equals 50
    loc = new PVector(random(diam, width-diam), 0);  //initialize loc PVector
    vel = new PVector(0, random(1, 10));  //initialize vel PVector
    a = new PVector(0, 0.001);  //initialize a PVector
  }


  void display() {
    fill(255);  //set fill to white
    noStroke();  //no stroke
    ellipse(loc.x, loc.y, diam, diam);  //draw an ellipse
  }

  void fall() {
    loc.add(vel);  //add velocity to raindrop
    vel.add(a);  //add acceleration to velocity
  }

  boolean isInContactWith(Catcher c) {  //the raindrop is in contact with the catcher...
    if (c.loc.dist(loc)<c.diam/2 + diam/2) {  //if the raindrop is touching to coordinates of the catcher...
      return true;  //return true
    } else {  //if not...
      return false;  //return false
    }
  }



  void reset() {
    loc.x = random(width);  //choose a random x-value for the raindrop
    loc.y = 0;  //set the y-value to 0
  }
}
