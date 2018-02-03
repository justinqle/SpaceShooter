class Spaceship {
  int x;
  int y;
  int speedX;
  int speedY;
  color c;

  int leftX;
  int top;
  int rightX;
  int bottom;

  int w = 90;
  int h = 50;

  Spaceship(int x, int y, int speedX, int speedY, color c) {
    this.x = x;
    this.y = y;
    this.speedX = speedX;
    this.speedY = speedY;
    this.c = c;
  }

  void drawSpaceship() {
    leftX = x - w/2;
    top = y - h/2;
    rightX = x + w/2;
    bottom = y + h/2;

    pushMatrix();
    translate(x, y);

    //draw the item here

    /*noFill();
     stroke(255);
     rect(0, 0, w, h);*/

    pushMatrix();

    scale(0.4, 0.4);
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

  void drawSpaceshipInvincible(color invColor) {
    leftX = x - w/2;
    top = y - h/2;
    rightX = x + w/2;
    bottom = y + h/2;

    pushMatrix();
    translate(x, y);

    //draw the item here

    /*noFill();
     stroke(255);
     rect(0, 0, w, h);*/

    pushMatrix();

    scale(0.4, 0.4);
    translate(-200, -167);

    stroke(0);

    fill(invColor);

    quad(110, 165, 180, 140, 160, 220, 110, 205);
    quad(290, 165, 220, 140, 240, 220, 290, 205);

    quad(115, 170, 165, 150, 155, 215, 115, 200);
    quad(285, 170, 235, 150, 245, 215, 285, 200);

    triangle(75, 140, 110, 170, 90, 210);
    triangle(325, 140, 290, 170, 310, 210);

    quad(110, 165, 95, 155, 95, 195, 110, 205);
    quad(290, 165, 305, 155, 305, 195, 290, 205);

    quad(180, 90, 220, 90, 240, 220, 160, 220);
    quad(185, 245, 215, 245, 240, 220, 160, 220);

    quad(190, 100, 210, 100, 230, 220, 170, 220);
    quad(190, 240, 210, 240, 230, 220, 170, 220);

    quad(190, 160, 210, 160, 215, 175, 185, 175);

    line(171, 220, 229, 220);

    line(161, 220, 169, 220);
    line(231, 220, 239, 220);

    popMatrix();

    popMatrix();
  }

  void moveSpaceship(String input) {
    if (input == "ws") {
      if (left2==true) {
        x -= speedX;
      }
      if (right2==true) {
        x += speedX;
      }
      if (up2==true) {
        y -= speedY;
      }
      if (down2==true) {
        y += speedY;
      }
    }

    if (input == "updown") {
      if (left==true) {
        x -= speedX;
      }
      if (right==true) {
        x += speedX;
      }
      if (up==true) {
        y -= speedY;
      }
      if (down==true) {
        y += speedY;
      }
    }


    if (x + 37.5 > width) {
      x -= speedX;
    }

    if (x - 37.5 < 0) {
      x += speedX;
    }

    if (y + 40 > height) {
      y -= speedY;
    }

    if (y - 40 < 0) {
      y += speedY;
    }
  }

  void checkCollisionAsteroid(Asteroid a) {
    if (isCollisionAsteroid(a) && lives1.size() > 0 && invincible == false && c == red) {
      lives1.remove(0);
      invincible = true;
    }

    if (isCollisionAsteroid(a) && lives1.size() > 0 && invincible == false && c == red) {
      lives1.remove(0);
      //println("hit1");
      invincible = true;
    }
    if (isCollisionAsteroid(a) && lives2.size() > 0 && invincible2 == false && c == blue) {
      lives2.remove(0);
      //println("hit2");
      invincible2 = true;
    }
  }

  boolean isCollisionAsteroid(Asteroid a) {
    if (leftX < a.right  && rightX > a.left) {
      if (bottom > a.top && top < a.bottom) {
        return true;
      }
    }
    return false;
  }
}