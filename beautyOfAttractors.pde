// beautyOfAttractors 
// Author Matthias Jaeger, 2018

import com.hamoid.*;

VideoExport videoExport;

final int FRAMES = 6000;

// Attrators to select from
final int NUMA = 30;
Particle[] attractors = new Particle[NUMA];

// Particles to aggregate
final int NUMP = 7600;
Particle[] particles = new Particle[NUMP];

void setup() {
  size(1280, 720);

  videoExport = new VideoExport(this);
  videoExport.startMovie();

  for (int j = 0; j < NUMA; j++) {
    attractors[j] = new Particle(random(width), random(height));
  }
  for (int i = 0; i < NUMP; i++) {
    particles[i] = new Particle(random(width), random(height));
  }
}

void draw() {
  background(255);
  stroke(20);
  strokeWeight(2);

  for (int i = 0; i < NUMP; i++) {
    int randomA = floor(random(NUMA));
    PVector force = particles[i].calcForce(attractors[randomA].pos);
    particles[i].addForce(force);
    particles[i].render();
  }

  if (frameCount < FRAMES) {
    videoExport.saveFrame();
  } else {
    videoExport.endMovie();
    exit();
  }
}
