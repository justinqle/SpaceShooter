class Button {
  int x;
  int y;
  int w;
  int h;
  String text;
  color hover;

  Button(int x, int y, int w, int h, String text, color hover) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.text = text;
    this.hover = hover;
  }

  void drawButton() {
    color c = color(255);

    if (mouseIsHovering()) {
      c = color(hover);
      if (mousePressed) {
        c = color(180);
      }
    }

    pushMatrix();
    translate(x, y);

    /*noFill();
     stroke(255);
     rect(0, 5, w, h);*/

    fill(c);
    textSize(50);
    text(text, 0, 0);
    fill(255);

    popMatrix();

    textSize(15);
  }

  boolean mouseIsHovering() {
    if (mouseX > (x-w/2) && mouseX < (x+w/2) && mouseY > (y-h/2) && mouseY < (y+h/2)) {
      return true;
    }
    return false;
  }
}