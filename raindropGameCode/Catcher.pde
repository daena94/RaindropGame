class Catcher {  //new class called Catcher
  PVector loc;  //new PVector loc
  int diam, b, c;  //initialize variables diam, b, c

  Catcher(float w, float v) {  //float coordinates of Catcher
    diam = 100;  //diam equals 100
    loc = new PVector(w, v);  //initialize loc PVector
  }

  void bucket(float x, float y) {  //float cooridinates of bucket
    fill(0);  //set fill to black
    ellipse(x, y, diam, diam);  //draw ellipse for bucket
    noStroke();  //no stroke
  }

  void reset() {
    loc.x = random(width);  //pick a random x-value for the catcher
    loc.y = 0;  //set the y-value to 0
  }
  void update(){
    loc.set(mouseX,mouseY);  //update the location of the catcher
  }
}
