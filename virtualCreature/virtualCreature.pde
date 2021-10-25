//Virtual Creature
//Author: Brandon French
//For: EECS 1710
//Date: Fall Term 2021

int numFrames = 3;  // The number of frames in the animation
int currentFrame = 0;
PImage[] bottleFrames = new PImage[numFrames];

int cursorFrames = 2;
int cursorState = 1;
PImage[] cursor = new PImage[cursorFrames];

int virusFrames = 2;
int virusState = 0;
PImage[] virus = new PImage[virusFrames];

PImage backdrop;

int marginX = 145;
int marginY = -87;

PVector position, target;

float vibrate = 3;
float speed = 0.18;
int size = 655;
    
void setup() {
  fullScreen();
  frameRate(21);
  noCursor();
  imageMode(CENTER);
  
  position = new PVector(width/2, height/2);
  target = new PVector(random(width), random(height));  
  
  backdrop = loadImage("background.jpg");
  
  //Spray Bottle Frames
  for (int i = 0; i < numFrames; i++) {
    String imageName = "bottleSpray" + nf(i, 2) + ".gif";
    bottleFrames[i] = loadImage(imageName);
  }
  
  //Cursor States
  for (int i = 0; i < cursorFrames; i++) {
    String imageName = "cursor" + nf(i, 2) + ".gif";
    cursor[i] = loadImage(imageName);
  }
  //Virus States
  for (int i = 0; i < virusFrames; i++) {
    String imageName = "virus" + nf(i, 2) + ".png";
    virus[i] = loadImage(imageName);
  }
  
} 
 
void draw() { 
  image(backdrop, 960, 540);
  image(virus[virusState], position.x, position.y, size, size);
  image(cursor[cursorState], mouseX, mouseY);
 
  if (mousePressed) {
    currentFrame = (currentFrame+1) % numFrames;
    cursorState = 0;
    image(bottleFrames[currentFrame], mouseX, mouseY);
    PVector mousePos = new PVector(mouseX + marginX, mouseY + marginY);
   
    //Virus is sprayed
    if (mousePos.dist(position) < 241) {
      virusState = 1;
      vibrate = 17;
      size -= 3;
      speed += 0.0013;
      if (size <= 21) {
        image(backdrop, 960, 540);
        image(cursor[cursorState], mouseX, mouseY);
        image(bottleFrames[currentFrame], mouseX, mouseY);
      }
   
    //Virus is not sprayed
    } else {
      virusState = 0;
      vibrate = 3;
      if (size <= 21) {
        image(backdrop, 960, 540);
        image(cursor[cursorState], mouseX, mouseY);
        image(bottleFrames[currentFrame], mouseX, mouseY);
        if (mousePressed) {
          image(bottleFrames[currentFrame], mouseX, mouseY);
        }
      }
    }
  } else {
    cursorState = 1;
    virusState = 0;
    vibrate = 3;
    if (size <= 21) {
        image(backdrop, 960, 540);
        image(cursor[cursorState], mouseX, mouseY);
    }
  }
 
  position = position.lerp(target, speed).add(new PVector(random(-vibrate, vibrate), random(-vibrate, vibrate)));
    if (position.dist(target) < 5) {
      target = new PVector(random(width), random(height));
    }
}
