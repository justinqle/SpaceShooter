class Score {
  int score = 0;
  int x;
  int y;
  color c;

  Score(int x, int y, color c) {
    this.x = x;
    this.y = y;
    this.c = c;
  }

  void drawScore() {
    pushMatrix();
    translate(x, y);

    textSize(30);
    fill(c);
    text(score, 0, 0);
    textSize(50);
    fill(255);

    popMatrix();
  }
}