class Alien {
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

  int health = 5;

  float bounce;

  Alien(int x, int y, float speedX, float speedY, float bounce) {
    this.x = x;
    this.y = y;
    this.speedX = speedX;
    this.speedY = speedY;
    this.bounce = bounce;

    w = 85;
    h = 45;
  }

  void drawAlien() {
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

    scale(0.5, 0.5);

    pushMatrix();
    translate(-122, -144);

    rectMode(CORNER);

    stroke(0);

    fill(173, 255, 47);
    beginShape();
    vertex(100, 100);
    vertex(150, 100);
    vertex(165, 115);
    vertex(165, 150);
    vertex(150, 175);
    vertex(100, 175);
    vertex(85, 150);
    vertex(85, 115);
    endShape();

    beginShape();
    vertex(191, 100);
    vertex(201, 100);
    vertex(215, 135);
    vertex(185, 190);
    vertex(170, 190);
    vertex(190, 135);
    endShape();

    beginShape();
    vertex(45, 100);
    vertex(60, 100);
    vertex(60, 135);
    vertex(80, 190);
    vertex(65, 190);
    vertex(36, 140);
    endShape();

    fill(255);
    rect(105, 100, 40, 50);

    beginShape();
    vertex(190, 100);
    vertex(196, 100);
    vertex(196, 135);
    vertex(176, 190);
    vertex(170, 190);
    vertex(190, 135);
    endShape();

    beginShape();
    vertex(60, 100);
    vertex(53, 100);
    vertex(53, 135);
    vertex(74, 190);
    vertex(80, 190);
    vertex(60, 135);
    endShape();

    fill(105);
    rect(105, 145, 40, 15, 20);

    fill(176, 224, 230); //powder blue
    quad(165, 115, 165, 150, 190, 135, 190, 110);
    quad(85, 115, 85, 150, 60, 135, 60, 110);

    rectMode(CENTER);

    popMatrix();

    popMatrix();
  }

  void drawAlienHit() {
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

    scale(0.5, 0.5);

    pushMatrix();
    translate(-223, -230);

    rectMode(CORNER);

    fill(255);
    rect(200, 200, 50, 60);

    rect(200, 232, 50, 17); //blue body line
    rect(210, 260, 30, 7); //tail extension
    rect(221, 265, 7, 10); //tail
    rect(212, 194, 7, 15); //left eye
    rect(233, 194, 7, 15); //right eye

    rect(212, 202, 7, 7); //left eye
    rect(233, 202, 7, 7); //right eye
    rect(195, 220, 7, 40); //left wing
    rect(245, 220, 7, 40); //right wing
    rect(181, 243, 15, 35); //left tail wing
    rect(251, 243, 15, 35); //right tail wing
    rect(180, 186, 7, 35); //left front wing
    rect(262, 186, 7, 35); //right front wing
    rect(246, 220, 23, 7);
    rect(180, 220, 22, 7);

    rectMode(CENTER);

    popMatrix();

    popMatrix();
  }

  void moveAlien() {
    x += speedX;
    y += speedY;

    if (left < 0) {
      speedX = bounce;
    }
    if (right > width) {
      speedX = -bounce;
    }

    checkCollisionAlien(this);
    if (invincible == false || invincible2 == false) {
      checkCollisionSpaceship(this);
    }

    alienProjectile(this);
  }
}