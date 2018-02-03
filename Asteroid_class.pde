class Asteroid {
  color[] colors = {color(131, 40, 46), color(170, 83, 39), color(55, 62, 118), color(82, 56, 103), color(200)};
  int[] numbers = {10, 20, 30};

  float x;
  float y;
  float speed;
  int shape;
  color c;

  float w;
  float h;
  float left;
  float top;
  float bottom;
  float right;

  Asteroid(float x, float y, int shape, int starcolor) {
    this.x = x;
    this.y = y;
    this.shape = shape;
    c = colors[starcolor];
  }

  void scroll() {
    speed = 1;

    y += speed;

    s.checkCollisionAsteroid(this);
    s1.checkCollisionAsteroid(this);
    s2.checkCollisionAsteroid(this);
  }

  void display() {
    if (shape == 1) {
      w = 90;
      h = 70;
      left = x - w/2;
      top = y - h/2;
      right = x + w/2;
      bottom = y + h/2;

      /*fill(255);
       rect(x, y, w, h);*/

      pushMatrix();
      translate(x, y);
      pushMatrix();
      translate(-130, -133);
      fill(112, 128, 144);
      beginShape();
      vertex(98, 93);
      vertex(158, 108);
      vertex(180, 129);
      vertex(178, 160);
      vertex(125, 173);
      vertex(102, 167);
      vertex(96, 146);
      vertex(82, 125);
      endShape(CLOSE);
      popMatrix();
      popMatrix();
    } else if (shape == 2) {
      w = 50;
      h = 45;
      left = x - w/2;
      top = y - h/2;
      right = x + w/2;
      bottom = y + h/2;

      /*fill(255);
       rect(x, y, w, h);*/

      pushMatrix();
      translate(x, y);
      scale(0.5, 0.5);
      pushMatrix();
      translate(-133, -154);
      fill(112, 128, 144);
      beginShape();
      vertex(145, 106);
      vertex(189, 121);
      vertex(189, 159);
      vertex(193, 191);
      vertex(131, 206);
      vertex(110, 194);
      vertex(84, 159);
      vertex(77, 122);
      endShape(CLOSE);
      popMatrix();
      popMatrix();
    } else if (shape == 3) {
      w = 130;
      h = 80;
      left = x - w/2;
      top = y - h/2;
      right = x + w/2;
      bottom = y + h/2;

      /*fill(255);
       rect(x, y, w, h);*/

      pushMatrix();
      translate(x, y);
      scale(1.3, 1.3);
      pushMatrix();
      translate(-135, -156);
      fill(112, 128, 144);
      beginShape();
      vertex(120, 120);
      vertex(152, 126);
      vertex(172, 131);
      vertex(189, 175);
      vertex(128, 193);
      vertex(97, 189);
      vertex(81, 172);
      vertex(82, 125);
      endShape(CLOSE);
      popMatrix();
      popMatrix();
    }
  }

  boolean asteroidGone() {
    if (y - 100 > height) {
      return true;
    }
    return false;
  }
}