class Life {
  int x;
  int y;
  color c;

  Life(int x, int y, color c) {
    this.x = x;
    this.y = y;
    this.c = c;
  }

  void drawLife() {
    pushMatrix();
    translate(x, y);

    //draw the item here

    /*noFill();
     stroke(255);
     rect(0, 0, w, h);*/

    pushMatrix();

    scale(0.20, 0.20);
    translate(-200, -167);

    stroke(0);

    fill(176, 224, 230); //powder blue
    quad(110, 165, 180, 140, 160, 220, 110, 205);
    quad(290, 165, 220, 140, 240, 220, 290, 205);

    fill(192, 192, 192); //silver
    quad(115, 170, 165, 150, 155, 215, 115, 200);
    quad(285, 170, 235, 150, 245, 215, 285, 200);

    fill(c); //crimson
    triangle(75, 140, 110, 170, 90, 210);
    triangle(325, 140, 290, 170, 310, 210);

    fill(176, 224, 230); //powder blue
    quad(110, 165, 95, 155, 95, 195, 110, 205);
    quad(290, 165, 305, 155, 305, 195, 290, 205);

    fill(192, 192, 192); //silver
    quad(180, 90, 220, 90, 240, 220, 160, 220);
    quad(185, 245, 215, 245, 240, 220, 160, 220);

    fill(c); //crimson
    quad(190, 100, 210, 100, 230, 220, 170, 220);
    quad(190, 240, 210, 240, 230, 220, 170, 220);

    fill(105, 105, 105); //dimgray
    quad(190, 160, 210, 160, 215, 175, 185, 175);

    stroke(c); //crimson
    line(171, 220, 229, 220);

    stroke(192, 192, 192); //silver
    line(161, 220, 169, 220);
    line(231, 220, 239, 220);

    popMatrix();

    popMatrix();
  }
}