void scene2() {

  noStroke();

  //println(s.x);
  //println(s.y);

  //println(lives1.size());
  //println(lives2.size());

  //println(projectiles1.size());
  //println(projectiles2.size());

  //println(timer);
  //println(level);

  //println(asteroids.size());

  //println(alienCount);

  //println(ufos.size());

  timer ++;

  for (int i=0; i<stars.length; i++) {
    if (pause == false) {
      stars[i].scroll();
    }
    stars[i].mass();
    stars[i].display();
  }

  if (timer%180 == 0) {
    Asteroid a = new Asteroid(random(0, width), -100, int(random(1, 4)), int(random(0, 5)));
    asteroids.add(a);
  }

  for (int i=0; i<asteroids.size(); i++) {
    if (pause == false) {
      asteroids.get(i).scroll();
    }
    asteroids.get(i).display();
    if (asteroids.get(i).asteroidGone()) {
      asteroids.remove(i);
    }
  }

  if (lives1.size() > 0) {
    for (int i = projectiles1.size()-1; i >= 0; i--) { 
      // An ArrayList doesn't know what it is storing so we have to cast the object coming out
      Projectile projectile = projectiles1.get(i);
      if (pause == false) {
        projectile.drawProjectile();
      }
      if (projectile.projectileGone()) {
        // Items can be deleted with remove()
        projectiles1.remove(i);
      }
    }
  }

  if (lives2.size() > 0) {
    for (int i = projectiles2.size()-1; i >= 0; i--) { 
      // An ArrayList doesn't know what it is storing so we have to cast the object coming out
      Projectile projectile = projectiles2.get(i);
      if (pause == false) {
        projectile.drawProjectile();
      }
      if (projectile.projectileGone()) {
        // Items can be deleted with remove()
        projectiles2.remove(i);
      }
    }
  }

  for (int i = projectilesAlien.size()-1; i >= 0; i--) { 
    // An ArrayList doesn't know what it is storing so we have to cast the object coming out
    Projectile projectile = projectilesAlien.get(i);
    if (pause == false) {
      projectile.drawProjectile();
    }
    if (projectile.projectileGone()) {
      // Items can be deleted with remove()
      projectilesAlien.remove(i);
    }
  }

  if (timer > 90) {
    for (int i = 0; i < aliens.size(); i++) {
      aliens.get(i).drawAlien();
      if (pause == false) {
        aliens.get(i).moveAlien();
      }
    }
  }

  if (timer > 90) {
    for (int i = 0; i < ufos.size(); i++) {
      ufos.get(i).drawUFO();
      if (pause == false) {
        ufos.get(i).collisionUFO();
      }
    }
  }

  //println(millis() - timeInv);

  if (oneplayer == true) {
    if (invincible == false) {
      s.drawSpaceship();
    } else if (invincible == true) {
      if (millis() - timeInv >= waitInv) {
        s.drawSpaceshipInvincible(red);
        if (millis() - timeInv >= waitInv + 250) { 
          timeInv = millis();
        }
      } else {
        s.drawSpaceship();
      }
    }
    if (pause == false) {
      s.moveSpaceship("updown");
    }
  } else if (twoplayer == true) {
    if (lives1.size() > 0) {
      if (invincible == false) {
        s1.drawSpaceship();
      } else if (invincible == true) {
        if (millis() - timeInv >= waitInv) {
          s1.drawSpaceshipInvincible(red);
          if (millis() - timeInv >= waitInv + 250) { 
            timeInv = millis();
          }
        } else {
          s1.drawSpaceship();
        }
      }
    }
    if (lives2.size() > 0) {
      if (invincible2 == false) {
        s2.drawSpaceship();
      } else if (invincible2 == true) {
        if (millis() - timeInv2 >= waitInv2) {
          s2.drawSpaceshipInvincible(blue);
          if (millis() - timeInv2 >= waitInv2 + 500) { 
            timeInv2 = millis();
          }
        } else {
          s2.drawSpaceship();
        }
      }
    }
    if (pause == false) {
      if (lives1.size() > 0) {
        s1.moveSpaceship("ws");
      }
      if (lives2.size() > 0) {
        s2.moveSpaceship("updown");
      }
    }
  }

  if (invincible == true && pause == false) {
    tempTimer++;
  }
  if (tempTimer > 180) {
    invincible = false;
    tempTimer = 0;
  }

  if (invincible2 == true && pause == false) {
    tempTimer2++;
  }
  if (tempTimer2 > 180) {
    invincible2 = false;
    tempTimer2 = 0;
  }

  //println(tempTimer);

  if (oneplayer == true) {
    score1.drawScore();
    for (int i = 0; i < lives1.size(); i++) {
      lives1.get(i).drawLife();
    }
  } else if (twoplayer == true) {
    score1.drawScore();
    score2.drawScore();
    for (int i = 0; i < lives1.size(); i++) {
      lives1.get(i).drawLife();
    }
    for (int i = 0; i < lives2.size(); i++) {
      lives2.get(i).drawLife();
    }
  }

  //println(scoreTimer1);

  if (scoreIncrease1) {
    scoreTimer1++;
    score1.c = red;
    if (scoreTimer1 == 15) {
      scoreIncrease1 = false;
      scoreTimer1 = 0;
      score1.c = color(255);
    }
  }

  if (scoreIncrease2) {
    scoreTimer2++;
    score2.c = blue;
    if (scoreTimer2 == 15) {
      scoreIncrease2 = false;
      scoreTimer2 = 0;
      score2.c = color(255);
    }
  }

  if (pause) { 
    fill(255);
    text("P  A  U  S  E  D", width/2, height/2 - 50);
    quit.drawButton();
    timer --;
  }

  if (alienCount >= enoughAlien && timer > 90 && aliens.size() == 0 && ufos.size() == 0) {
    level ++;
    timer = 0;
    alienCount = 0;
    enoughAlien += 5;
  }

  if ((timer-90)%60 == 0 && alienCount < enoughAlien) {
    UFO ufo = new UFO(width/2, -100, int(random(1, 3)), random(1, 3));
    ufos.add(ufo);
  }

  if ((timer-90)%240 == 0 && alienCount < enoughAlien) {
    Alien alien = new Alien(width/2, -100, 1, 1, 1);
    aliens.add(alien);
  }

  if (timer < 90 && pause == false) {
    fill(255);
    text("Level " + level, width/2, height/2);
  }

  if (oneplayer == true && lives1.size() == 0) {
    scene = 3;
  }

  if (twoplayer == true && lives1.size() == 0 && lives2.size() == 0) {
    scene = 3;
  }

  /*if (timer > 160) {
   println(ufos.get(0).x);
   }*/
}

/*if (level == 2) {
 for (int y = -50; y > -150; y -= 50) { 
 for (int i = 350; i < width-250; i += 50) {
 Alien a = new Alien(i, y, 0, 1, 0);
 aliens.add(a);
 }
 }
 } else if (level == 3) {
 for (int y = -50; y > -150; y -= 50) { 
 for (int i = 350; i < width-250; i += 50) {
 Alien a = new Alien(i, y, 2, 1, 2);
 aliens.add(a);
 }
 }
 } else if (level == 4) {
 for (int y = -50; y > -150; y -= 50) { 
 for (int i = 350; i < width-250; i += 50) {
 Alien a = new Alien(i, y, -2, 1, 2);
 aliens.add(a);
 }
 }
 } else if (level == 5) {
 for (int y = -50; y > -200; y -= 50) { 
 for (int i = 350; i < width-250; i += 50) {
 Alien a = new Alien(i, y, 0, 1, 0);
 aliens.add(a);
 }
 }
 } else if (level == 6) {
 for (int i = 350; i < width-250; i += 50) {
 Alien a = new Alien(i, -50, 4, 1, 4);
 aliens.add(a);
 }
 for (int i = 350; i < width-250; i += 50) {
 Alien a = new Alien(i, -50, -4, 1, 4);
 aliens.add(a);
 }
 } else if (level == 7) {
 Alien a = new Alien(width/2, -50, 3, 1, 3);
 aliens.add(a);
 } else if (level == 8) {
 for (int i = 350; i < width-250; i += 50) {
 Alien a = new Alien(i, -50, 4, 1, 4);
 aliens.add(a);
 }
 for (int i = 350; i < width-250; i += 50) {
 Alien a = new Alien(i, -50, -4, 1, 4);
 aliens.add(a);
 }
 } else if (level == 9) {
 for (int i = 350; i < width-250; i += 50) {
 Alien a = new Alien(i, -50, 4, 1, 4);
 aliens.add(a);
 }
 for (int i = 350; i < width-250; i += 50) {
 Alien a = new Alien(i, -50, -4, 1, 4);
 aliens.add(a);
 }
 } else if (level == 10) {
 for (int i = 350; i < width-250; i += 50) {
 Alien a = new Alien(i, -50, 4, 1, 4);
 aliens.add(a);
 }
 for (int i = 350; i < width-250; i += 50) {
 Alien a = new Alien(i, -50, -4, 1, 4);
 aliens.add(a);
 }
 } else {
 for (int i = 350; i < width-250; i += 50) {
 Alien a = new Alien(i, -50, 4, 1, 4);
 aliens.add(a);
 }
 for (int i = 350; i < width-250; i += 50) {
 Alien a = new Alien(i, -50, -4, 1, 4);
 aliens.add(a);
 }
 }*/