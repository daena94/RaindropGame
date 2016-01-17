ArrayList <Raindrop> r = new ArrayList<Raindrop>();  //declare an Array List for the good raindrop
ArrayList <Bad> b = new ArrayList<Bad>(); //declare an Array List for the bad raindrop
PVector circle;   //declare a PVector called circle
Catcher c;  //declare c as a variable for the Catcher class
Score s; //declare s as a variable for the Score class
int mode = 0; //initialize variable mode

void setup() {
  size(1200, 800);  //set canvas size
  circle = new PVector();  //initialize circle PVector. value is irrelevant since it will be set at the start of void draw(){}
  r.add(new Raindrop(random(width), 0));  //add new Raindrop
  b.add(new Bad(random(width), 0)); //add new Bad raindrop
  c = new Catcher(random(width), 0); //add new Catcher
  s = new Score(); //add new Score
}

void draw() {
  if (mode == 0) {  //if the mode is set to 0...
    background(0);  //set background to black
    textSize(30);  //set text size to 30
    textAlign(CENTER);  //align the text to the center of the screen
    text("Raindrop Game!", 600, 300);  //insert text
    text("Catch only the white raindrops.  Press ENTER to begin.", width/2, height/2);  //insert text
  }
  if (keyCode==ENTER) {  //if the ENTER key is pressed...
    mode = 1;  //set the mode to 1
  }
  if (mode == 1) {  //if the mode is set to 1...
    circle.set(mouseX, mouseY);             //set value of circle as mouseX,mouseY
    background(0, 200, 255);  //set the background color
    r.add(new Raindrop(random(width), 0));  //add new Raindrop
    b.add(new Bad(random(width), 0));  //add new Bad raindrop
    c.bucket(mouseX, mouseY);  //catcher bucket
    c.update();  //update the catcher
    s.display();  //display the score
    for (int i = r.size()-1; i>=0; i--) {  //keep making new raindrops
      Raindrop d= r.get(i);  //add Raindrop d
      d.fall();         //make the raindrop fall. It should accelerate as if pulled towards the ground by earth's gravity
      d.display();      //display the raindrop
      if (d.isInContactWith(c)) {      //check to see if the raindrop is in contact with the point represented by the Catcher
        r.remove(i);     //if it is, remove the raindrop
        s.addScore();  //increase the score
      }
      if (d.loc.y > height + d.diam/2) {     //check to see if the raindrop goes below the bottom of the screen
        r.remove(i);                           //if it does, remove the raindrop
      }
    }

    for (int i = b.size()-1; i>=1; i--) {  //keep makng new bad raindrops
      if (b.size()<200) {  //if there are less than 200 bad raindrops on the screen...
        Bad bd= b.get(i);  //add new bad raindrops

        bd.fall();         //make the bad raindrop fall. It should accelerate as if pulled towards the ground by earth's gravity
        bd.display();      //display the bad raindrop
        if (bd.isInContactWith(c)) {      //check to see if the bad raindrop is in contact with the point represented by the Catcher
          b.remove(i);     //if it is, remove the bad raindrop
          mode = 2;  //set the mode to 2
        }
        if (bd.loc.y > height + bd.diam/2) {     //check to see if the bad raindrop goes below the bottom of the screen
          b.remove(i);                           //if it does, remove the bad raindrop
        }
      }

      if (mode == 2) {  //if the mode is set to 2...
        background(0);  //set the background to black
        fill(0, 200, 255);  //set the color of the text
        textAlign(CENTER);  //align the text to the center of the screen
        textSize(40);  //set the text size to 40
        text("You Lose!!!", width/2, height/2);  //insert text
        text("Press DELETE to return to the start screen", width/2+50, height/2+50);  //insert text
        noLoop();  //do not loop
        if (key==DELETE) { //if the DELETE key is pressed...
          mode = 0;  //set the mode to 0
        }
      }
    

    if (scoref == 50) {  //if the score reaches 50...
      mode = 3;  //set the mode to 3
    }
    if (mode == 3) {  //if the mode is set to 3...
      background(0);  //set the background to black
      fill(0, 200, 255);  //set the color of the text
      textAlign(CENTER);  //align the text to the center of the screen
      textSize(40);  //set the text size to 40
      text("You WIN!!!", width/2, height/2);  //insert text
      text("Press BACKSPACE to return to the start screen", width/2+50, height/2+50);  //insert text
      noLoop();  //do not loop
    }
    if(keyCode == BACKSPACE) {  //if the BACKSPACE key is pressed...
      mode = 0;  //set the mode to 0
    }
  }

