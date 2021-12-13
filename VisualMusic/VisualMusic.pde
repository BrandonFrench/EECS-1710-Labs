//Virtual Creature
//Author: Brandon French
//For: EECS 1710
//Date: Fall Term 2021

int numNotes = 0;
float posX, posY, fall, fade, burst, size;
boolean start = false;
boolean sustain = false;

ParticleSystem ps;

float yoff = 0.0;
float waveOpacity = 0;

//Sequencer
import processing.sound.*;

TriOsc triOsc;
Env env;
Sound s;

// Times and levels for the ASR envelope
float attackTime = 0.001;
float sustainTime = 5;
float sustainLevel = .5;
float releaseTime = 5;

// This is an octave in MIDI notes.
int[] midiSequence = {40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 71, 71, 72, 73, 74, 75, 76, 77, 78, 79 };

// Play a new note every 200ms


// This variable stores the point in time when the next note should be triggered
int trigger = millis();

// An index to count up the notes
int note = 0;

float vol = 0.0;

void setup() {
  fullScreen();
  noCursor();
  
  fall = 0; //note visual falls after spawned
  fade = 255; //note visual fades after spawned
  burst = 215; //note visual bursts with color when spawned
  
  size = 0;
  
  ps = new ParticleSystem(new PVector(width/2, 50)); 
  
  // Create triangle wave and start it
  triOsc = new TriOsc(this);

  // Create the envelope
  env = new Env(this);
  
  //Create a sound object
  s = new Sound(this);
}

void draw() {
  background (0);
  
  //SoundWave
  noFill();
  strokeWeight(4);
  stroke(posX/7.5, 11, 255-posX/7.5, waveOpacity);
  
  beginShape(); 
  
  float xoff = 0;
  
  // Iterate over horizontal pixels
  for (float x = 0; x <= width; x += 10) {
    // Calculate a y value according to noise, map to 
    float y = map(noise(xoff, yoff), 0, 1, 100,1500);
    // Set the vertex
    vertex(x, y); 
    // Increment x dimension for noise
    xoff += 0.05;
  }
  // increment y dimension for noise
  yoff += 0.01;
  vertex(width, height);
  vertex(0, height);
  endShape(OPEN);
  
  noStroke();
  fill(posX/7.5-burst, burst, 255-posX/7.5-burst, fade); //note colour
  
  if (start == true) {
    if (sustain == false) {
      ellipse(posX, posY+fall, size, size); //spawn note
      
      fall+=3; //fall rate
      fade-=2; //fade rate 
      burst+=1; //burst rate
      
      if (waveOpacity >= 0) {
        waveOpacity-=0.7;
      }
    }
  } 
  
    if (sustain == true) {
      //SoundWave
      if (waveOpacity <= 85) {
        waveOpacity+=3.4;
      }
      
      //Particle effects & Note Indicator
      posX = mouseX;
      posY = mouseY;
      
      size = 215-mouseY/7.5;
      
      ps.addParticle(); //Spawn Particles
      ellipse(mouseX, mouseY, size, size); //spawn note
    }
  ps.run();
  
  //Sequencer
  int difference = mouseX - 960;
  int inversion = 960 - difference;
 
  float amplitude = map(mouseY, 0, height, vol, 0.0);

  s.volume(amplitude);
 
  int duration = inversion/6;
  if ((millis() > trigger) && (note<midiSequence.length)) {


    triOsc.play(midiToFreq(midiSequence[note]), .5);
    env.play(triOsc, attackTime, sustainTime, sustainLevel, releaseTime);
    trigger = millis() + duration;
    note++;

    // Loop the sequence
    if (note == 10) {
      note = 0;
    }
  }
  if (sustain == false && vol > 0.0) {
    vol -= 0.00105;
  }
  if (sustain == true && vol < 0.4) {
    vol += 0.00105;
  }
}

float midiToFreq(int note) {
  return (pow(2, ((note-69)/12.0))) * 440;
}

void mousePressed() {
  if (start == false) {
    start = true;
  }
  
  sustain = true;

  posX = mouseX;
  posY = mouseY;
  
  fall = 0; //reset fall
  fade = 255; //reset fade
  burst = 0; //reset burst
}

void mouseReleased() {
  sustain = false;
}
