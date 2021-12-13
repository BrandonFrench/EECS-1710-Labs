//Custom Pixel Assignment
//Course: EECS 1710
//Author: Brandon French
//Fall Term 2021

PImage tv, yosemiteOrig, tokyoOrig, grandCanyonOrig, parisOrig, zermattOrig, yosemite, tokyo, grandCanyon, paris, zermatt, rug, remote;
int channel = -1;

void setup() {
  fullScreen(); 
  noCursor();
 
  tv = loadImage("tv.png");
  tv.loadPixels();
  
  yosemiteOrig = loadImage("yosemite.jpg"); //Unchanging Yosemite image
  yosemiteOrig.resize(725,544);
  yosemiteOrig.loadPixels();
  
  yosemite = yosemiteOrig.get(); //Copy of Yosemite image
  yosemite.loadPixels();
  
  tokyoOrig = loadImage("tokyo.jpg"); //Unchanging Tokyo image
  tokyoOrig.resize(725,544);
  tokyoOrig.loadPixels();
  
  tokyo = tokyoOrig.get(); //Copy of Tokyo image
  tokyo.loadPixels();
  
  grandCanyonOrig = loadImage("grandCanyon.jpg"); //Unchanging Grand Canyon image
  grandCanyonOrig.resize(725,544);
  grandCanyonOrig.loadPixels();
  
  grandCanyon = grandCanyonOrig.get(); //Copy of Grand Canyon image
  grandCanyon.loadPixels();
  
  parisOrig = loadImage("paris.jpg"); //Unchanging Paris image
  parisOrig.resize(725,544);
  parisOrig.loadPixels();
  
  paris = parisOrig.get(); //Copy of Paris image
  paris.loadPixels();
  
  zermattOrig = loadImage("zermatt.jpg"); //Unchanging Zermatt image
  zermattOrig.resize(725,544);
  zermattOrig.loadPixels();
  
  zermatt = zermattOrig.get(); //Copy of Zermatt image
  zermatt.loadPixels();
  
  remote = loadImage("remote.png");
}

void draw() {  
  if (channel == 0) { // Yosemite Static
    image(yosemite, 635, 335);
    for (int i=0; i<10000; i++) {
      int index1 = int(random(0, yosemite.pixels.length));
      int index2 = int(random(0, yosemite.pixels.length));
      yosemite.pixels[index1] = yosemite.pixels[index2];
    } 
  }else if (channel == 1) { //Yosemite --> Tokyo
    image(yosemite, 635, 335);
    for (int i=0; i<10000; i++) {
      int index = int(random(0, yosemite.pixels.length));
      yosemite.pixels[index] = tokyoOrig.pixels[index];
    }
  }else if (channel == 2) { //Tokyo Static
    image(tokyo, 635, 335);
    for (int i=0; i<10000; i++) {
      int index1 = int(random(0, tokyo.pixels.length));
      int index2 = int(random(0, tokyo.pixels.length));
      tokyo.pixels[index1] = tokyo.pixels[index2];
    }
  }else if (channel == 3) { //Tokyo --> The Grand Canyon
    image(tokyo, 635, 335);
    for (int i=0; i<10000; i++) {
      int index = int(random(0, tokyo.pixels.length));
      tokyo.pixels[index] = grandCanyonOrig.pixels[index];
    }
  }else if (channel == 4) { //The Grand Canyon Static
    image(grandCanyon, 635, 335);
    for (int i=0; i<10000; i++) {
      int index1 = int(random(0, grandCanyon.pixels.length));
      int index2 = int(random(0, grandCanyon.pixels.length));
      grandCanyon.pixels[index1] = grandCanyon.pixels[index2];
    }
  }else if (channel == 5) { //The Grand Canyon --> Paris
    image(grandCanyon, 635, 335);
    for (int i=0; i<10000; i++) {
      int index = int(random(0, grandCanyon.pixels.length));
      grandCanyon.pixels[index] = parisOrig.pixels[index];
    }
  }else if (channel == 6) { //Paris Static
    image(paris, 635, 335);
    for (int i=0; i<10000; i++) {
      int index1 = int(random(0, paris.pixels.length));
      int index2 = int(random(0, paris.pixels.length));
      paris.pixels[index1] = paris.pixels[index2];
    }
  } else if (channel == 7) { //Paris --> Zermatt
    image(paris, 635, 335);
    for (int i=0; i<10000; i++) {
      int index = int(random(0, paris.pixels.length));
      paris.pixels[index] = zermattOrig.pixels[index];
    }
  }else if (channel == 8) { //Zermatt Static
    image(zermatt, 635, 335);
    for (int i=0; i<10000; i++) {
      int index1 = int(random(0, zermatt.pixels.length));
      int index2 = int(random(0, zermatt.pixels.length));
      zermatt.pixels[index1] = zermatt.pixels[index2];
    }
  } else if (channel == 9) { //Zermatt --> Yosemite
    image(zermatt, 635, 335);
    for (int i=0; i<10000; i++) {
      int index = int(random(0, zermatt.pixels.length));
      zermatt.pixels[index] = yosemiteOrig.pixels[index];
    }
  } else { //Load with Yosemite on Television
    image(yosemite, 635, 335);
  }
  yosemite.updatePixels();
  tokyo.updatePixels();
  grandCanyon.updatePixels();
  paris.updatePixels();
  zermatt.updatePixels();
    
  image(tv, 0, 0);
  image(remote, 1300+mouseY/5,550+mouseY/2);
}

void mousePressed() {
  if (channel == 9){ //Cycle back to first channel
    channel = 0;
  } else if (channel == -1){ //Enter Channel Cycle
    channel = 0;
  } else {
    channel++; //Change channel
  }
  if (channel % 2 == 0) { //Restricts images from reseting during static transitions
    yosemite = yosemiteOrig.get();
    tokyo = tokyoOrig.get();
    grandCanyon = grandCanyonOrig.get();
    paris = parisOrig.get();
    zermatt = zermattOrig.get();
 }
}
