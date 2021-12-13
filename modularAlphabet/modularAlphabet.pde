//Modular Alphabet
//EECS 1710
//Fall Term 2021
// Author: Brandon French

PImage grid;
int posX = 0;
int posY = 0;

int index = 25;
boolean[] square = new boolean [index];

boolean draw = true;

int letter = int(random(1,4)); //Generates random letter (A-C)

int r = int(random(1,256));
int g = int(random(1,256));
int b = int(random(1,256));
color col = color(r,g,b);

void setup () {
  size(400,400);
  
  grid = loadImage("grid.png");
}

void draw() {
  if (letter == 1) {
    square[0] = false;
    square[1] = false;
    square[2] = true;
    square[3] = false;
    square[4] = false;
    square[5] = false;
    square[6] = true;
    square[7] = false;
    square[8] = true;
    square[9] = false;
    square[10] = false;
    square[11] = true;
    square[12] = false;
    square[13] = true;
    square[14] = false;
    square[15] = false;
    square[16] = true;
    square[17] = true;
    square[18] = true;
    square[19] = false;
    square[20] = true;
    square[21] = false;
    square[22] = false;
    square[23] = false;
    square[24] = true;
  }
  if (letter == 2) {
    square[0] = true;
    square[1] = true;
    square[2] = true;
    square[3] = false;
    square[4] = false;
    square[5] = true;
    square[6] = false;
    square[7] = true;
    square[8] = false;
    square[9] = false;
    square[10] = true;
    square[11] = true;
    square[12] = true;
    square[13] = false;
    square[14] = false;
    square[15] = true;
    square[16] = false;
    square[17] = true;
    square[18] = false;
    square[19] = false;
    square[20] = true;
    square[21] = true;
    square[22] = true;
    square[23] = false;
    square[24] = false;
  }
  if (letter == 3) {
    square[0] = true;
    square[1] = true;
    square[2] = true;
    square[3] = true;
    square[4] = false;
    square[5] = true;
    square[6] = false;
    square[7] = false;
    square[8] = false;
    square[9] = false;
    square[10] = true;
    square[11] = false;
    square[12] = false;
    square[13] = false;
    square[14] = false;
    square[15] = true;
    square[16] = false;
    square[17] = false;
    square[18] = false;
    square[19] = false;
    square[20] = true;
    square[21] = true;
    square[22] = true;
    square[23] = true;
    square[24] = false;
  }
  fill(col);
  if (draw == true) {
    for(int i=1;i<=25;i++) {
      if (square[i-1] == true) {
        rect(posX,posY,80,80);
      }
      if (i % 5 != 0) {
        posX+=80;
      } else {
        posY+=80;
        posX=0;
      }
    }
  }
  draw = false;
  image(grid,0,0);
}
