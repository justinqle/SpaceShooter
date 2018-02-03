boolean invincible, invincible2;
boolean scoreIncrease1, scoreIncrease2;
int scoreTimer1, scoreTimer2;

void checkCollisionAlien(Alien a) {
  ArrayList<Projectile> tempL = new ArrayList<Projectile>();

  for (Projectile p : projectiles1) {
    if (isCollisionAlien(p, a)) {
      tempL.add(p);
      a.health -= 1;
      a.drawAlienHit();
      if (a.health == 0) {
        aliens.remove(a);
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
    if (isCollisionAlien(p, a)) {
      tempL.add(p);
      a.health -= 1;
      a.drawAlienHit();
      if (a.health == 0) {
        aliens.remove(a);
        score2.score += 50;
        scoreIncrease2 = true;
        alienCount++;
      }
    }
  }
  for (Projectile p : tempL) {
    projectiles2.remove(p);
  }

  if (oneplayer == true && a.top > height && lives1.size() > 0) {
    aliens.remove(a);
  }

  if (twoplayer == true && a.top > height && lives1.size() > 0) {
    aliens.remove(a);
  }

  for (Projectile p : projectilesAlien) {
    if (isCollisionAlienLaser(p, s) && lives1.size() > 0 && invincible == false) {
      lives1.remove(0);
      invincible = true;
    }
    if (isCollisionAlienLaser1(p, s1) && lives1.size() > 0 && invincible == false) {
      lives1.remove(0);
      invincible = true;
    }
    if (isCollisionAlienLaser2(p, s2) && lives2.size() > 0 && invincible2 == false) {
      lives2.remove(0);
      invincible2 = true;
    }
  }
}

boolean isCollisionAlien(Projectile p, Alien a) {
  if (a.left < p.right  && a.right > p.left) {
    if (a.bottom > p.top && a.top < p.bottom) {
      return true;
    }
  }
  return false;
}

void checkCollisionSpaceship(Alien a) {
  if (isCollisionSpaceship(s, a) && lives1.size() > 0 && invincible == false) {
    lives1.remove(0);
    println("hit");
    invincible = true;
    aliens.remove(a);
  }

  if (isCollisionSpaceship1(s1, a) && lives1.size() > 0 && invincible == false) {
    lives1.remove(0);
    //println("hit1");
    invincible = true;
    aliens.remove(a);
  }
  if (isCollisionSpaceship2(s2, a) && lives2.size() > 0 && invincible2 == false) {
    lives2.remove(0);
    //println("hit2");
    invincible2 = true;
    aliens.remove(a);
  }
}

boolean isCollisionSpaceship(Spaceship s, Alien a) {
  if (a.left < s.rightX && a.right > s.leftX) {
    if (a.bottom > s.top && a.top < s.bottom) {
      return true;
    }
  }
  return false;
}

boolean isCollisionSpaceship1(Spaceship s1, Alien a) {
  if (a.left < s1.rightX && a.right > s1.leftX) {
    if (a.bottom > s1.top && a.top < s1.bottom) {
      return true;
    }
  }
  return false;
}

boolean isCollisionSpaceship2(Spaceship s2, Alien a) {
  if (a.left < s2.rightX && a.right > s2.leftX) {
    if (a.bottom > s2.top && a.top < s2.bottom) {
      return true;
    }
  }
  return false;
}

void alienProjectile(Alien a) {
  if (timer > 90 && timer%90 == 0) {
    projectilesAlien.add(new Projectile(a.x, a.y, -10, color(255)));
  }
}

boolean isCollisionAlienLaser(Projectile p, Spaceship s) {
  if (s.leftX < p.right  && s.rightX > p.left) {
    if (s.bottom > p.top && s.top < p.bottom) {
      return true;
    }
  }
  return false;
}

boolean isCollisionAlienLaser1(Projectile p, Spaceship s1) {
  if (s1.leftX < p.right  && s1.rightX > p.left) {
    if (s1.bottom > p.top && s1.top < p.bottom) {
      return true;
    }
  }
  return false;
}

boolean isCollisionAlienLaser2(Projectile p, Spaceship s2) {
  if (s2.leftX < p.right  && s2.rightX > p.left) {
    if (s2.bottom > p.top && s2.top < p.bottom) {
      return true;
    }
  }
  return false;
}