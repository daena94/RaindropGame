ArrayList <Raindrop> r = new ArrayList<Raindrop>();
PVector circle;   //declare a PVector called mouse
Catcher c;


void setup() {
  size(1200, 800);
  circle = new PVector();                //initialize mouse PVector. value is irrelevant since it will be set at the start of void draw(){}
  r.add(new Raindrop(random(width), 0));
  c = new Catcher(random(width), 0);
}

void draw() {
  circle.set(mouseX, mouseY);             //set value of mouse as mouseX,mouseY
  background(0, 200, 255);
  r.add(new Raindrop(random(width), 0));
  c.bucket(mouseX, mouseY);
  c.update();
  for (int i = r.size()-1; i>=0; i--) {
    Raindrop d= r.get(i);
    d.fall();         //make the raindrop fall. It should accelerate as if pulled towards the ground by earth's gravity
    d.display();      //display the raindrop
    if (d.isInContactWith(c.loc)) {      //check to see if the raindrop is in contact with the point represented by the PVector called mouse
      r.remove(i);                         //if it is, reset the raindrop
    }
    if (d.loc.y > height + d.diam/2) {     //check to see if the raindrop goes below the bottom of the screen
      r.remove(i);                           //if it does, reset the raindrop
    }
  }
}