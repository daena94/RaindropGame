class Raindrop {
  PVector loc, vel;
  int r, diam;



Raindrop(float x,float y) {
  diam = 100;
  loc = new PVector(random(diam,width-diam), random(diam,height-diam));
  vel = PVector.random2D();
    vel.mult(10);
}


void display() {
  fill(255);
  noStroke();
  ellipse(loc.x,loc.y,diam,diam);
}

void move() {
  loc.add(vel);
}

void run(){
  display();
  move();
}
void fall() {
  
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

}
}