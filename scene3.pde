void scene3() {

  noStroke();

  for (int i=0; i<stars.length; i++) {
    stars[i].scroll();
    stars[i].mass();
    stars[i].display();
  }

  fill(255);
  stroke(255);
  textSize(60);
  text("G A M E  O V E R", width/2, height/2 - 100);
  if (oneplayer == true) {
    textSize(30);
    fill(red);
    text("Score: " + score1.score, width/2, height/2);
  } else if (twoplayer == true) {
    textSize(30);
    fill(red);
    text("P1 Score: " + score1.score, width/2 - 200, height/2);
    fill(blue);
    text("P2 Score: " + score2.score, width/2 + 200, height/2);
  }
  fill(255);

  mainmenu.drawButton();
}