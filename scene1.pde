void scene1() {
  level = 1;

  for (int i = 0; i < stars.length; i++) {
    stars[i].scroll();
    stars[i].mass();
    stars[i].display();
  }

  fill(255);
  stroke(255);
  textSize(60);
  text("SPACE", width/2, 75);
  text("SHOOTER", width/2, 140);
  fill(255);

  onePlayer.drawButton();
  twoPlayer.drawButton();
}