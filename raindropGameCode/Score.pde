class Score {
  int scoref = 0;

  Score() {
    textSize(50);

  }
  void display() {
    textSize(50);
    text("Score", 70, 50);
    text(scoref, 200, 50);
  }
  void addScore() {
    scoref ++ ;
  }

}