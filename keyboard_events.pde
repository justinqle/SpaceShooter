boolean up, down, left, right;
boolean up2, down2, left2, right2;
boolean pause;

void keyPressed() {
  if (keyCode == LEFT) {
    left = true;
  }
  if (keyCode == RIGHT) {
    right = true;
  }
  if (keyCode == UP) {
    up = true;
  }
  if (keyCode == DOWN) {
    down = true;
  }

  if (key == 'a' || key == 'A') {
    left2 = true;
  }
  if (key == 'd' || key == 'D') {
    right2 = true;
  }
  if (key == 'w' || key == 'W') {
    up2 = true;
  }
  if (key == 's' || key == 'S') {
    down2 = true;
  }

  if (keyCode == 32) { //SPACE fire
    if (oneplayer == true) {
      if (millis() - time1 >= wait) {
        projectiles1.add(new Projectile(s.x, s.y, 10, red));
        time1 = millis();
      }
    }
  }

  if (keyCode == 81) { //Q fire
    if (twoplayer == true) {
      if (millis() - time1 >= wait) {
        projectiles1.add(new Projectile(s1.x, s1.y, 10, red));
        time1 = millis();
      }
    }
  }

  if (keyCode == 77) { //M fire
    if (twoplayer == true) {
      if (millis() - time2 >= wait) {
        projectiles2.add(new Projectile(s2.x, s2.y, 10, blue));
        time2 = millis();//also update the stored time
      }
    }
  }

  if (keyCode == 'p' || keyCode == 'P') {
    if (pause == false) { 
      pause = true;
    } else {     
      pause = false;
    }
  }
}

void keyReleased() {
  if (keyCode == LEFT) {
    left = false;
  }
  if (keyCode == RIGHT) {
    right = false;
  }
  if (keyCode == UP) {
    up = false;
  }
  if (keyCode == DOWN) {
    down = false;
  }

  if (key == 'a' || key == 'A') {
    left2 = false;
  }
  if (key == 'd' || key == 'D') {
    right2 = false;
  }
  if (key == 'w' || key == 'W') {
    up2 = false;
  }
  if (key == 's' || key == 'S') {
    down2 = false;
  }
}