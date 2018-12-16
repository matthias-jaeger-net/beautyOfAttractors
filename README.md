# beautyOfAttractors 
> A personal experiment with the goal of creating a video animation out of the processing ide.

![beautyOfAttractors](/Capture.png)

## Tools used
* https://processing.org/
* https://github.com/hamoid/video_export_processing
* http://ffmpeg.org/

## Main Program

```java
...
Sketch simplyfied
...
// Two types of Particels live on the screen 
Particle[] attractors = new Particle[30];
Particle[] particles = new Particle[7600];
...

void draw() {
  ...
  // Loop all particles
  for (int i = 0; i < particles.length; i++) {
    // Pick a ramdon attractor
    int randomA = floor(random(NUMA));
    // calcForce returns a force based on the random attractor
    PVector force = particles[i].calcForce(attractors[randomA].pos);
    // Add force
    particles[i].addForce(force);
    particles[i].render();
  }
...
}

Particle simplyfied
...
class Particle {
  PVector pos;
  PVector acc;
  PVector vel;
  float damp;
  Particle(float x, float y) {
    pos = new PVector(x, y);
    acc = new PVector(0, 0);
    vel = new PVector(0, 0);
    damp = 0.01;
  }
  PVector calcForce(PVector agg) {
    PVector dir = agg.copy().sub(pos).normalize().mult(damp);
    return dir;
  }
  void addForce(PVector force) {
    acc.add(force);
    vel.add(acc);
    pos.add(vel);
    acc.mult(0);
}
void render() {
    point(pos.x, pos.y);
  }
}
```
