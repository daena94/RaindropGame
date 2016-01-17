class Bad {  //new class called Bad
  PVector loc, vel, a;  //new PVectors loc, vel, a
  int r, diam;  //initialize variables r, diam



  Bad(float x, float y) {  //float coordinates of Bad
    diam = 50;  //diam equals 50
    loc = new PVector(random(diam, width-diam), 0);  //initialize loc PVector
    vel = new PVector(0, random(1, 10));  //initialize vel PVector
    a = new PVector(0, 0.001);  //initialize a PVector
  }


  void display() {
    fill(0);  //set fill to black
    noStroke();  //no stroke
    ellipse(loc.x, loc.y, diam, diam);  //draw ellipse for raindrops
  }

  void fall() {
    loc.add(vel);  //add velocity to the Bad raindrop
    vel.add(a);  //add acceleration to the velocity
  }

  boolean isInContactWith(Catcher c) {  //the Bad raindrop is in contact with the catcher...
    if (c.loc.dist(loc)<c.diam/2 + diam/2) {  //if it is touching the coordinates of the catcher...
      return true;  //return true
   }
    else{  //if not...
      return false;  //return false
  }
  }



  void reset() {
    loc.x = random(width);  //pick a random x-value for the Bad raindrop
    loc.y = 0;  //set the y-value to 0
  }
}
