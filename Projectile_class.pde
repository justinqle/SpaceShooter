class Projectile {
  int x;
  int y;
  int speedY;
  color c;

  int w;
  int h;

  int left;
  int top;
  int right;
  int bottom;

  Projectile(int x, int y, int speedY, color c) {
    this.x = x;
    this.y = y;
    this.speedY = speedY;
    this.c = c;

    w = 5;
    h = 20;
  }

  void drawProjectile() {
    //draw the item here
    fill(c);
    rect(x, y, w, h, 10);
    fill(255);

    y -= speedY;

    left = x - w/2;
    top = y - h/2;
    right = x + w/2;
    bottom = y + h/2;
  }

  boolean projectileGone() {
    if (bottom < 0 || top > height) {
      return true;
    }
    return false;
  }
}