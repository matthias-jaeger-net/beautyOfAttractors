# beautyOfAttractors 
> A personal experiment with the goal of creating a video animation out of the processing ide.

![beautyOfAttractors](/Capture.png)

Watch one test run on youtube https://www.youtube.com/watch?v=gBgFTsNpRnA or try it yourself. :)

## Tools I used
* https://processing.org/
* https://github.com/hamoid/video_export_processing
* http://ffmpeg.org/

## Main Program

There are two types of Particels in this program. Static attractors and moving particles. I store them in two global arrays.

```java
Particle[] attractors = new Particle[30];
Particle[] particles = new Particle[7600];
```
In the ``setup()`` function I initialize both with random Particles

```java
  for (int j = 0; j < attractors.length; j++) {
    attractors[j] = new Particle(random(width), random(height));
  }
  for (int i = 0; i < particles.length; i++) {
    particles[i] = new Particle(random(width), random(height));
  }
}
```
In the continous animation loop ``draw()`` , running at 60 frames per second, each frame a random attactor is picked for each particle. Based on that a force in form of a ``PVector`` datatype is calculated and accumulated to its velocity

```java
void draw() {
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
```

A ``Particle`` is an object with position, acceleration and velocity. 

```java
class Particle {
  PVector pos, acc, vel;
  Particle(float x, float y) {
    pos = new PVector(x, y);
    acc = new PVector(0, 0);
    vel = new PVector(0, 0);
  }
  // Gets an attractor as input and returns a small directed force
  PVector calcForce(PVector agg) {
    PVector dir = agg.copy().sub(pos).normalize().mult(0.01);
    return dir;
  }
  // Accumulate all forces
  void addForce(PVector force) {
    acc.add(force);
    vel.add(acc);
    pos.add(vel);
    // Reset acceleration
    acc.mult(0);
 }
 // Draws the particle
 void render() {
    point(pos.x, pos.y);
  }
}
```
