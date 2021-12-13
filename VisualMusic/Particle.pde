class Particle {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  int g = 150;
  int b = 0;

  Particle(PVector l) {
    acceleration = new PVector(0, 0.37);
    velocity = new PVector(random(-4, 4), random(-17, -1));
    position = new PVector(mouseX,mouseY);
    lifespan = 255;
  }

  void run() {
    update();
    display();
  }

  // Method to update position and colour
  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    lifespan -= 3;
    
    if (sustain == true) {
      g -= 15;
      b +=15;
    }
  }

  // Method to display
  void display() {
    noStroke();
    fill(mouseX/7.5, 11, 255-mouseX/7.5, lifespan);
    ellipse(position.x, position.y, 8, 8);
  }

  // Is the particle still useful?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}
