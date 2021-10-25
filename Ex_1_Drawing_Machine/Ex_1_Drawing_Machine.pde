//Drawing Machine
//Author: Brandon French
//For: EECS 1710
//Date: Fall Term 2021

color hue = color(0);
float size;
float clr;
float shape;

void setup() {
  fullScreen();
  background(255);
  size = 1;
  clr = 1;
}

void draw(){
  
  //Broad
  if (size != 1) {
    noStroke();
  } else {
    strokeWeight(5);
    stroke(1);
  }
  fill(65,65,65);
  ellipse(100,100,100,100);
  if (mouseX>50&&mouseX<150&&mouseY>50&&mouseY<150&&mousePressed) {
    size = 1;
  }
  
  //Medium
  if(size != 2) {
    noStroke();
  } else {
    strokeWeight(5);
    stroke(1);
  }
  fill(65,65,65);
  ellipse(100,200,85,85);
  if (mouseX>50&&mouseX<150&&mouseY>150&&mouseY<250&&mousePressed) {
    size = 2;
  }
  
  //Fine
  if(size != 3) {
    noStroke();
  } else {
    strokeWeight(5);
    stroke(1);
  }
  fill(65,65,65);
  ellipse(100,300,70,70);
  if (mouseX>50&&mouseX<150&&mouseY>250&&mouseY<350&&mousePressed) {
    size = 3;
  }
  
  //Red
  if(clr != 1) {
    noStroke();
  } else {
    strokeWeight(5);
    stroke(1);
    hue = color(255,0,0);
  }
  fill(255,0,0);
  ellipse(100,500,100,100);
  if (mouseX>50&&mouseX<150&&mouseY>450&&mouseY<550&&mousePressed) {
    clr = 1;
  }
  
  //Green
  if(clr != 2) {
    noStroke();
  } else {
    strokeWeight(5);
    stroke(1);
    hue = color(0,255,0);
  }
  fill(0,255,0);
  ellipse(100,600,100,100);
  if (mouseX>50&&mouseX<150&&mouseY>550&&mouseY<650&&mousePressed) {
    clr = 2;
  }
  
  //Blue
  if(clr != 3) {
    noStroke();
  } else {
    strokeWeight(5);
    stroke(1);
    hue = color(0,0,255);
  }
  fill(0,0,255);
  ellipse(100,700,100,100);
  if (mouseX>50&&mouseX<150&&mouseY>650&&mouseY<750&&mousePressed) {
    clr = 3;
  }
  
  //Eraser
  if(clr != 4) {
    stroke(1);
    strokeWeight(1);
  } else {
    strokeWeight(5);
    stroke(1);
    hue = color(255);
  }
  fill(255);
  ellipse(100,900,100,100);
  if (mouseX>50&&mouseX<150&&mouseY>850&&mouseY<950&&mousePressed) {
    clr = 4;
  }
  
  //Left/Right-Click
  if (mousePressed){
    fill(hue);
    noStroke();
    if (size == 1) {
      stroke(hue);
      strokeWeight(55);
      line(mouseX, mouseY, pmouseX, pmouseY);
    } else if(size == 2) {
      stroke(hue);
         strokeWeight(25);
      line(mouseX, mouseY, pmouseX, pmouseY);
    } else if(size == 3) {
      stroke(hue);
      strokeWeight(7);
      line(mouseX, mouseY, pmouseX, pmouseY);
    }
  }
}
