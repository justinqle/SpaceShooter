boolean oneplayer, twoplayer;

void mousePressed() {
}

void mouseReleased() {
  if (scene == 1) {
    if (onePlayer.mouseIsHovering()) {
      scene = 2;
      oneplayer = true;
    }
    if (twoPlayer.mouseIsHovering()) {
      scene = 2;
      twoplayer = true;
    }
  }

  if (scene == 2) {
    if (quit.mouseIsHovering()) {
      setup();
      pause = false;
      oneplayer = false;
      twoplayer = false;
      scene = 1;
    }
  }
  if (scene == 3) {
    if (mainmenu.mouseIsHovering()) {
      setup();
      pause = false;
      oneplayer = false;
      twoplayer = false;
      scene = 1;
    }
  }
}

void mouseClicked() {
}