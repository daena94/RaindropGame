ArrayList <Raindrop> r = new ArrayList<Raindrop>();
ArrayList <Bad> b = new ArrayList<Bad>();
PVector circle;   //declare a PVector called mouse
Catcher c;
Score s;
int mode = 0;

void setup() {
  size(1200, 800);
  circle = new PVector();                //initialize mouse PVector. value is irrelevant since it will be set at the start of void draw(){}
  r.add(new Raindrop(random(width), 0));
  b.add(new Bad(random(width), 0));
  c = new Catcher(random(width), 0);
  s = new Score();
}

void draw() {
  if (mode == 0) {
    background(0);
    textSize(30);
    textAlign(CENTER);
    text("Raindrop Game!", 600, 300);
    text("Catch only the white raindrops.  Press ENTER to begin.", width/2, height/2);
  }
  if (keyCode==ENTER) {
    mode = 1;
  }
  if (mode == 1) {
    circle.set(mouseX, mouseY);             //set value of mouse as mouseX,mouseY
    background(0, 200, 255);
    r.add(new Raindrop(random(width), 0));
    b.add(new Bad(random(width), 0));
    c.bucket(mouseX, mouseY);
    c.update();
    s.display();
    for (int i = r.size()-1; i>=0; i--) {
      Raindrop d= r.get(i);
      d.fall();         //make the raindrop fall. It should accelerate as if pulled towards the ground by earth's gravity
      d.display();      //display the raindrop
      if (d.isInContactWith(c)) {      //check to see if the raindrop is in contact with the point represented by the PVector called mouse
        r.remove(i);     //if it is, reset the raindrop
        s.addScore();
      }
      if (d.loc.y > height + d.diam/2) {     //check to see if the raindrop goes below the bottom of the screen
        r.remove(i);                           //if it does, reset the raindrop
      }
    }

    for (int i = b.size()-1; i>=1; i--) {
          if(b.size()<200){
      Bad bd= b.get(i);

      bd.fall();         //make the raindrop fall. It should accelerate as if pulled towards the ground by earth's gravity
      bd.display();      //display the raindrop
      if (bd.isInContactWith(c)) {      //check to see if the raindrop is in contact with the point represented by the PVector called mouse
        b.remove(i);     //if it is, reset the raindrop
        mode = 2;
      }
      if (bd.loc.y > height + bd.diam/2) {     //check to see if the raindrop goes below the bottom of the screen
        b.remove(i);                           //if it does, reset the raindrop
      }
    }
    
    if (mode == 2) {
      background(0);
      fill(0, 200, 255);
      textAlign(CENTER);
      textSize(40);
      text("You Lose!!!", width/2, height/2);
      text("Press DELETE to return to the start screen", width/2+50, height/2+50);
      noLoop();
      if (key==1) {
        mode = 0;
      }
    }
  }

  //if(scoref == 50){
  //mode = 2;
  //}
  //if(mode == 2){
  //  background(0);
  //fill(0, 200, 255);
  //textAlign(CENTER);
  //textSize(40);
  //text("You WIN!!!",width/2,height/2);
  //text("Press BACKSPACE to return to the start screen", width/2+50, height/2+50);
  //noLoop();
  //}
}