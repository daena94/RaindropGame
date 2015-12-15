class Catcher {
  PVector loc;
  int diam, b;

  Catcher(float x, float y) {
    x = mouseX;
    y = mouseY;
    diam = 100;
    loc = new PVector(mouseX, mouseY);
  }

  void bucket(float x, float y) {
    fill(0);
    ellipse(x, y, diam, diam);
    noStroke();
  }
  boolean isInContactWith(Catcher b) {
    if (loc.dist(b.loc)<diam/2 + b.diam/2) {
      return true;
    } else {
      return false;
    }
  }
  void reset() {
    loc.x = random(width);
    loc.y = 0;
  }
}