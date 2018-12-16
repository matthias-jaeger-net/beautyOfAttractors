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
  for (int i = 0; i < NUMP; i++) {
    int randomA = floor(random(NUMA));
    PVector force = particles[i].calcForce(attractors[randomA].pos);
    particles[i].addForce(force);
    particles[i].render();
  }
...
}
```
