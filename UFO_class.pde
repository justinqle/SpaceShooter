class UFO {
  int x;
  int y;
  float speedX;
  float speedY;

  int w;
  int h;

  int left;
  int top;
  int right;
  int bottom;

  int health = 2;

  float speed;

  UFO(int x, int y, float speedX, float speedY) {
    this.x = x;
    this.y = y;
    this.speedX = speedX;
    this.speedY = speedY;

    w = 60;
    h = 30;

    if (speedX == 1) {
      speed = random(2, 4);
    } else {
      speed = random(-2, -4);
    }
  }

  void drawUFO() {
    left = x - w/2;
    top = y - h/2;
    right = x + w/2;
    bottom = y + h/2;

    pushMatrix();
    translate(x, y);

    /*noFill();
     stroke(255);
     rect(0, 0, w, h);*/

    //draw Alien here
    noStroke();

    scale(0.6, 0.6);

    pushMatrix();
    translate(-200, -197);

    rectMode(CORNER);

    fill(230, 230, 250);
    strokeWeight(1);
    ellipse(175, 220, 22, 18);
    ellipse(223, 220, 22, 18);
    ellipse(200, 202, 100, 46);
    fill(178, 34, 34);
    ellipse(200, 195, 70, 33);
    fill(72, 61, 139);
    ellipse(200, 183, 35, 35);
    strokeWeight(3);
    stroke(230, 230, 250);
    line(200, 155, 200, 165);
    line(200, 155, 185, 150);
    strokeWeight(1);
    stroke(0);

    rectMode(CENTER);

    popMatrix();

    popMatrix();
  }

  void drawUFOHit() {
    left = x - w/2;
    top = y - h/2;
    right = x + w/2;
    bottom = y + h/2;

    pushMatrix();
    translate(x, y);

    /*noFill();
     stroke(255);
     rect(0, 0, w, h);*/

    //draw Alien here
    noStroke();

    scale(0.75, 0.75);

    pushMatrix();
    translate(-200, -197);

    rectMode(CORNER);

    fill(255);
    strokeWeight(1);
    ellipse(175, 220, 22, 18);
    ellipse(223, 220, 22, 18);
    ellipse(200, 202, 100, 46);
    ellipse(200, 195, 70, 33);
    ellipse(200, 183, 35, 35);
    strokeWeight(3);
    stroke(230, 230, 250);
    line(200, 155, 200, 165);
    line(200, 155, 185, 150);
    strokeWeight(1);
    stroke(0);

    rectMode(CENTER);

    popMatrix();

    popMatrix();
  }

  void collisionUFO() {
    if (speedX == 1) {
      x += speed;
    }
    if (speedX == 2) {
      x += speed;
    }

    if (left < 0 && speed < 0) {
      speed = -speed;
    }
    if (right > width && speed > 0) {
      speed = -speed;
    }

    y+=speedY;

    ArrayList<Projectile> tempL = new ArrayList<Projectile>();
    for (Projectile p : projectiles1) {
      if (isCollisionAlien(p)) {
        tempL.add(p);
        health -= 1;
        drawUFOHit();
        println("hit");
        if (health == 0) {
          ufos.remove(this);
          score1.score += 50;
          scoreIncrease1 = true;
          alienCount++;
        }
      }
    }
    for (Projectile p : tempL) {
      projectiles1.remove(p);
    }

    for (Projectile p : projectiles2) {
      if (isCollisionAlien(p)) {
        tempL.add(p);
        health -= 1;
        drawUFOHit();
        if (health == 0) {
          ufos.remove(this);
          score2.score += 50;
          scoreIncrease2 = true;
          alienCount++;
        }
      }
    }
    for (Projectile p : tempL) {
      projectiles2.remove(p);
    }

    if (oneplayer == true && top > height && lives1.size() > 0) {
      ufos.remove(this);
    }

    if (twoplayer == true && top > height && lives1.size() > 0) {
      ufos.remove(this);
    }

    if (isCollisionSpaceship(s) && lives1.size() > 0 && invincible == false) {
      lives1.remove(0);
      //println("hit");
      invincible = true;
      ufos.remove(this);
    }

    if (isCollisionSpaceship1(s1) && lives1.size() > 0 && invincible == false) {
      lives1.remove(0);
      //println("hit1");
      invincible = true;
      ufos.remove(this);
    }
    if (isCollisionSpaceship2(s2) && lives2.size() > 0 && invincible2 == false) {
      lives2.remove(0);
      //println("hit2");
      invincible2 = true;
      ufos.remove(this);
    }
  }

  boolean isCollisionSpaceship(Spaceship s) {
    if (this.left < s.rightX && this.right > s.leftX) {
      if (this.bottom > s.top && this.top < s.bottom) {
        return true;
      }
    }
    return false;
  }
  boolean isCollisionSpaceship1(Spaceship s1) {
    if (this.left < s1.rightX && this.right > s1.leftX) {
      if (this.bottom > s1.top && this.top < s1.bottom) {
        return true;
      }
    }
    return false;
  }
  boolean isCollisionSpaceship2(Spaceship s2) {
    if (this.left < s2.rightX && this.right > s2.leftX) {
      if (this.bottom > s2.top && this.top < s2.bottom) {
        return true;
      }
    }
    return false;
  }

  boolean isCollisionAlien(Projectile p) {
    if (left < p.right  && right > p.left) {
      if (bottom > p.top && top < p.bottom) {
        return true;
      }
    }
    return false;
  }
}