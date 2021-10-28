//One-Button Game
//Author: Brandon French
//For: EECS 1710
//Date: Fall Term 2021

int backdropFrames = 16;
int backdropState = 0;
PImage[] backdrop = new PImage[backdropFrames];

int playerFrames = 2;
int playerState = 0;
PImage[] player = new PImage[playerFrames];

int enemyFrames = 3;
int enemyState = 0;
PImage[] enemy = new PImage[enemyFrames];

int damageFrames = 3;
int damageState = 0;
PImage[] damage = new PImage[damageFrames];

float bulletPositionX, bulletPositionY;
PImage bullet;
PVector bulletPosition;

float enemyPositionX = 960;
float enemyPositionY = 0;

float enemyBulletPosX, enemyBulletPosY;
PImage enemyBullet;

int hitCounter = 0;
int killCounter = 0;

PImage destroy;

int hp = 5;

PImage meteor1;
PImage meteor2;

float meteor1PositionX = 0;
float meteor1PositionY = 0;

float meteor2PositionX = 1920;
float meteor2PositionY = 1080;

float x = 0;
float y = 0;

void setup() {
  fullScreen();
  frameRate(30);
  noCursor();
  imageMode(CENTER);
  rectMode(CORNER);
  
  for (int i = 0; i < backdropFrames; i++) {
    String imageName = "background" + nf(i, 3) + ".gif";
    backdrop[i] = loadImage(imageName);
  }
  
  for (int i = 0; i < playerFrames; i++) {
    String imageName = "playerShip" + nf(i, 2) + ".gif";
    player[i] = loadImage(imageName);
  }
  
  for (int i = 0; i < enemyFrames; i++) {
    String imageName = "enemy" + nf(i, 2) + ".gif";
    enemy[i] = loadImage(imageName);
  }
  
  for (int i = 0; i < enemyFrames; i++) {
    enemy[i].resize(width/9,height/9);
  }
  
  for (int i = 0; i < damageFrames; i++) {
    String imageName = "explosion" + nf(i, 2) + ".gif";
    damage[i] = loadImage(imageName);
  }
  
  for (int i = 0; i < damageFrames; i++) {
    damage[i].resize(width/7,height/7);
  }
   
  bullet = loadImage("bullet.png");
  bullet.resize(width/10,height/10);
  
  enemyBullet = loadImage("enemyBullet.png");
  
  destroy = loadImage("destroy.gif");
  
  meteor1 = loadImage("meteor1.png");
  meteor1.resize(height/4, width/5);
  
  meteor2 = loadImage("meteor2.png");
  meteor2.resize(height/4, width/5);
}

void draw() {
  backdropState = (backdropState+1) % backdropFrames;
  image(backdrop[backdropState],960,540);
  
  playerState = (playerState+1) % playerFrames;
  image(player[playerState],mouseX,945);
  
  image(meteor1, meteor1PositionX, meteor1PositionY);
  image(meteor2, meteor2PositionX, meteor2PositionY);
  
  textSize(35);
  text ("Kills: " + killCounter, 1800, 1050);
  
  fill(255,0,0);
  text ("Lives: " + hp, 35, 1050);
  
  if (hp <= 0) {
    delay(1000);
    exit();
    
  }
  
  if (enemyPositionY >= 1080){
    image(damage[damageState], mouseX, 945);
    hp -= 1;
    enemyPositionY = -100;
    enemyPositionX = random(75,1700);
    hitCounter = 0;
  }
  
  if (enemyPositionY  == -50) {
    enemyPositionX = random(150,1700);
  }
  
  enemyPositionY += 10;
  
  enemyState = (enemyState+1) % enemyFrames;
  image(enemy[enemyState],enemyPositionX, enemyPositionY);
  
  meteor1Move();
  meteor1PositionX += x;
  meteor1PositionY += x;
  if (mouseX - meteor1PositionX < 105 && meteor1PositionX - mouseX < 105 && 945 - meteor1PositionY < 150 && meteor1PositionY - 945 < 10) {
    image(destroy, enemyPositionX, enemyPositionY);
    meteor1PositionX = -150;
    meteor1PositionY = -150;
    hp -=1;
  }
  
  meteor2Move();
  meteor2PositionX += y;
  meteor2PositionY += y;
  if (mouseX - meteor2PositionX < 105 && meteor2PositionX - mouseX < 105 && 945 - meteor2PositionY < 150 && meteor2PositionY - 945 < 10) {
    image(destroy, enemyPositionX, enemyPositionY);
    meteor2PositionX = -150;
    meteor2PositionY = -150;
    hp -=1;
  }
  
  if (mouseX - enemyPositionX < 175 && enemyPositionX - mouseX < 175 &&  945 - enemyPositionY < 75 && enemyPositionY - 945 < 75) { // enemy and player collide
    damageState = (damageState+1) % damageFrames;
    image(damage[damageState], mouseX + 50, enemyPositionY);
    image(destroy, enemyPositionX, enemyPositionY);
    enemyPositionX = 0;
    enemyPositionY = -150;
    hp -= 1;
    hitCounter = 0;
  }
    
  if (mousePressed) {
    image(bullet,bulletPositionX,bulletPositionY);
 
    if ((bulletPositionX - enemyPositionX) < 105 && (enemyPositionX - bulletPositionX) < 105 && (bulletPositionY - enemyPositionY) < 150 && (enemyPositionY - bulletPositionY) < 150) { //enemy is shot
      hitCounter += 1;
      damageState = (damageState+1) % damageFrames;
      image(damage[damageState],bulletPositionX,enemyPositionY);
      bulletPositionY = 4555;
      if (hitCounter % 5 == 0 && hitCounter != 0) { //enemy is killed
        killCounter += 1;
        image(destroy,bulletPositionX,enemyPositionY);
        enemyPositionX = 0;
        enemyPositionY = -150;
      }
    } else {
      bulletPositionY -= 115;
    }
     
  } else {
    bulletPositionY = 850;
 
  }
  
  if(meteor1PositionX > 1920 && meteor1PositionY > 1080){
    meteor1PositionX = random(0, 960);
    meteor1PositionY = -100;
  }
  
  if(meteor2PositionX > 1920 && meteor2PositionY > 1080){
    meteor2PositionX = random(0, 960);
    meteor2PositionY = -85;
  }
}

void mousePressed() {
  bulletPositionX = mouseX;
}

void meteor1Move() {
  x = random(10,55);
}

void meteor2Move() {
  y = random(10,55);
}
