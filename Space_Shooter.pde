color red = color(220, 20, 60);
color blue = color(65, 105, 225);
color gray = color(105);

int timer;
int scene;
int level;
int tempTimer;
int tempTimer2;

int time1;
int time2;
int wait = 100;

int timeInv, timeInv2;
int waitInv, waitInv2;

int alienCount;
int enoughAlien;

Score score1;
Score score2;

Spaceship s;
Spaceship s1;
Spaceship s2;

Button onePlayer;
Button twoPlayer;
Button quit;
Button mainmenu;

Star[] stars = new Star[200];

ArrayList<Asteroid> asteroids;

ArrayList<Life> lives1;
ArrayList<Life> lives2;

ArrayList<Projectile> projectiles1;
ArrayList<Projectile> projectiles2;
ArrayList<Projectile> projectilesAlien;

ArrayList<Alien> aliens;
ArrayList<UFO> ufos;

void setup() {
  size(800, 600);

  rectMode(CENTER);
  textAlign(CENTER, CENTER);

  timer = 0;
  scene = 1;
  invincible = false;
  invincible2 = false; 
  tempTimer = 0;

  timeInv = 0;
  waitInv = 200;
  waitInv2 = 200;
  alienCount = 0;
  enoughAlien = 5;

  score1 = new Score(75, 50, 255);
  score2 = new Score(width - 75, 50, 255);

  s = new Spaceship(width/2, height-100, 10, 10, red);
  s1 = new Spaceship(width/2 - 100, height-100, 10, 10, red);
  s2 = new Spaceship(width/2 + 100, height-100, 10, 10, blue);

  onePlayer = new Button(width/2, height - 300, 250, 45, "One Player", red);
  twoPlayer = new Button(width/2, height - 150, 250, 45, "Two Player", blue);
  quit = new Button(width/2, height/2 + 50, 250, 45, "Q  U  I  T", gray);
  mainmenu = new Button(width/2, height/2 + 100, 250, 45, "M A I N  M E N U", gray);

  lives1 = new ArrayList<Life>();
  lives2 = new ArrayList<Life>();

  projectiles1 = new ArrayList<Projectile>();
  projectiles2 = new ArrayList<Projectile>();
  projectilesAlien = new ArrayList<Projectile>();

  aliens = new ArrayList<Alien>();
  ufos = new ArrayList<UFO>();

  asteroids = new ArrayList<Asteroid>();

  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star(random(0, width), random(0, height), int(random(1, 6)), int(random(0, 5)));
  }

  for (int y = height - 100; y < height + 10; y += 40) {
    Life l = new Life(30, y, red);
    lives1.add(l);
  }

  for (int y = height - 100; y < height + 10; y += 40) {
    Life l = new Life(width - 30, y, blue);
    lives2.add(l);
  }

  /*for (int i = 300; i < width - 200; i += 50) {
   Alien a = new Alien(i, -100, 0, 1, 0);
   aliens.add(a);
   }*/

  int total = aliens.size();
  println("The total number of particles is: " + total);
}

void draw() {
  background(0);

  if (scene == 1) {
    scene1();
  } else if (scene == 2) {
    scene2();
  } else if (scene == 3) {
    scene3();
  }
}