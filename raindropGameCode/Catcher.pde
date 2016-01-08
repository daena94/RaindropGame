class Catcher {
  PVector loc;
  int diam, b, c;

  Catcher(float w, float v) {
    diam = 100;
    loc = new PVector(w, v);
  }

  void bucket(float x, float y) {
    fill(0);
    ellipse(x, y, diam, diam);
    noStroke();
  }

  void reset() {
    loc.x = random(width);
    loc.y = 0;
  }
  void update(){
    loc.set(mouseX,mouseY);
  }
}
