ArrayList <Raindrop> r = new ArrayList<Raindrop>();

PVector mouse;   //declare a PVector called mouse
Catcher c;
int count = 10;
int mode = 0;
int t = 0;
int s = 0;

ArrayList <Bad> b = new ArrayList<Bad>();
PVector circle;   //declare a PVector called mouse
Catcher c;
Score s;
int mode = 0;


void setup() {
  size(1200, 800);
  mouse = new PVector();                //initialize mouse PVector. value is irrelevant since it will be set at the start of void draw(){}
  r.add(new Raindrop(random(width), 0));

  c = new Catcher(width/2, height/2);
}

void draw() {
  if (mode==0) {
    background(0, 200, 255);
    textSize(250);
    textAlign(CENTER);
    text("Raindrop Game", width/2, height/5);
    textSize(100);
    text("Catch only WHITE raindrops in your bucket", width/2, height/4);
    text("If you catch any other color, GAME OVER", width/2, height/3);
    text("Press ENTER to start", width/2, height/2);
    s=0;
    t=0;
  }
  if (mode==1) {
    mouse.set(mouseX, mouseY);             //set value of mouse as mouseX,mouseY
    background(0, 200, 255);
    r.add(new Raindrop(random(width), 0));
    c.bucket(mouseX, mouseY);
    c.update();

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

        r.remove(i);                         //if it is, reset the raindrop

        r.remove(i);     //if it is, reset the raindrop
        s.addScore();

      }
      if (d.loc.y > height + d.diam/2) {     //check to see if the raindrop goes below the bottom of the screen
        r.remove(i);                           //if it does, reset the raindrop
      }

      if (c.isInContactWith(d.loc)) {
        r.remove(i);
        if (d.y()) {
          s+=1;
        }
        else {
          mode = 3;
        }
      }
      if (t = 100) {
        mode = 2;
      }
    }
    textAlign(Center);
    textSize(100);
    fill(255);
    text(s, width/2, height/10);
    if (frameCount%10==0) {
      t+=1;

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
    fill(255);
    textSize(150);
    text(t, width/2, height/9);
  }
  if (mode==2) {
    background(0,200,255);
    textAlign(CENTER);
    textSize(200);
    text("YOU WIN!", width/2, height/4);
    textSize(150);
    text("Final Score:", width/2-50, height/3);
    text("s", width/2+50, height/3);
    text("Press BACKSPACE to return to start screen", width/2, height/2);
  }

  if(mode==3) {
    background(0,200,255);
    textAlign(CENTER);
    textSize(300);
    text("YOU LOSE!!!", width/2, height/5);
    textSize(150);
    text("Final Score:", width/2-50, height/4);
    text("s", width/2+50, height/4);
    text("Final Time:", width/2-50, height/3);
    text("t", width/2+50, height/3);
    text("Press BACKSPACE to return to start screen", width/2, height/2);
}
}
void keyPressed() {
  if (keyCode==ENTER) {    //if player hits enter, enter main game sequence
    mode=1;
  } 
  if (keyCode==BACKSPACE) {    //if player hits backspace, program shows opening page
    mode=0;
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

