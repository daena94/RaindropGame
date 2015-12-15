class Raindrop {
  PVector loc, vel, a;
  int r, diam;



Raindrop(float x,float y) {
  diam = 50;
  loc = new PVector(random(diam,width-diam), 0);
  vel = new PVector(0,random(1,10));
  a = new PVector(0,0.001);

}


void display() {
  fill(255);
  noStroke();
  ellipse(loc.x,loc.y,diam,diam);
}

void fall() {
  loc.add(vel);
      vel.add(a);
}

boolean isInContactWith(PVector mouse) {
  if (dist(mouse.x,mouse.y,loc.x,loc.y)<diam/2){
    return true;
  }

    else {
      return false;
    }
}
void reset(){
loc.x = random(width);
loc.y = 0;
}
}