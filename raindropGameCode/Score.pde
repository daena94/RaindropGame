class Score {  //new class called Score
  int scoref = 0;  //variable scoref equals 0

  Score() {
    textSize(50);  //set text size to 50

  }
  void display() {
    textSize(50);  //set text size to 50
    text("Score", 70, 50);  //insert text
    text(scoref, 200, 50);  //insert text
  }
  void addScore() {
    scoref ++ ;  //increase score
  }

}
