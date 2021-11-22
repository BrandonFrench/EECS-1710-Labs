PImage tv, yellowstone, tokyo, rug, remote;
boolean interference;
boolean test;
String channel;

void setup() {
  fullScreen(); 
  noCursor();
 
  tv = loadImage("tv.png");
  tv.loadPixels();
  
  yellowstone = loadImage("yellowstone.jpg");
  yellowstone.loadPixels();
  yellowstone.resize(725,544);
  
  tokyo = loadImage("tokyo.jpg");
  tokyo.loadPixels();
  tokyo.resize(725,544);
  
  remote = loadImage("remote.png");
 
  interference = true;
  test = false;
  
  channel = "yellowstone";
  //channel[2] "London";
}

void draw() {  
  if (interference == true) {
    if (channel == "yellowstone")
    for (int i=0; i<10000; i++) {
      int index1 = int(random(0, yellowstone.pixels.length));
      int index2 = int(random(0, yellowstone.pixels.length));
      yellowstone.pixels[index1] = yellowstone.pixels[index2];
    } else if (channel == "tokyo") {
      tokyo.loadPixels();
      int index3 = int(random(0, tokyo.pixels.length));
      int index4 = int(random(0, tokyo.pixels.length));
      tokyo.pixels[index3] = tokyo.pixels[index4];
    }
  }
  
  yellowstone.updatePixels();
    
  image(yellowstone, 635, 335);
  image(tv, 0, 0);
  image(remote, 1300+mouseY/5,550+mouseY/2);
  
  if (interference == false) {
      image(tokyo, 635, 335);
      image(tv, 0, 0);
      image(remote, 1300+mouseY/5,550+mouseY/2);
      
  }
  
  if (test == true) {
    image(rug, 0, 0);
  }

}

void mousePressed() {
  if (channel == "yellowstone"){
    channel = "tokyo";
  } else if (channel == "tokyo"){
    channel = "yellowstone";
  }
  if (interference == true && mouseButton == LEFT) {
    interference = false;
  } else if (interference == false && mouseButton == LEFT) {
    interference = true;
  }
}
