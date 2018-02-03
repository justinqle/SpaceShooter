class Star {
  color[] colors = {color(131, 40, 46), color(170, 83, 39), color(55, 62, 118), color(82, 56, 103), color(200)};

  float x;
  float y;
  float speed;
  int size;
  color c;

  Star(float x, float y, int size, int starcolor) {
    this.x = x;
    this.y = y;
    this.size = size;
    c = colors[starcolor];
  }

  void mass() {
    if (size <= 2) {
      speed = 4;
    }
    if (size > 2 && size <= 4) {
      speed = 6;
    }
    if (size > 4 && size <= 6) {
      speed = 8;
    }
  }

  void scroll() {
    y += speed;

    if (y > height) {
      y = 0;
      x = int(random(0, width));
      size = int(random(1, 6));
    }
  }

  void display() {
    noStroke();
    fill(c);
    rect(x, y, size, size);
  }
}

/*  void mass() {
 if (size <= 2) {
 if (scene == 2 && timer < 90) {
 speed = 13;
 } else {
 speed = 3;
 }
 if (size > 2 && size <= 4) {
 if (scene == 2 && timer < 90) {
 speed = 16;
 } else {
 speed = 6;
 }
 }
 if (size > 4 && size <= 6) {
 if (scene == 2 && timer < 90) {
 speed = 19;
 } else {
 speed = 9;
 }
 }
 }
 }
 */