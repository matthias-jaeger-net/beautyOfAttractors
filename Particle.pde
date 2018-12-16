class Particle {
  PVector pos;
  PVector acc;
  PVector vel;
  Boolean alive;
  float damp;
  Particle(float x, float y) {
    pos = new PVector(x, y);
    acc = new PVector(0, 0);
    vel = new PVector(0, 0);
    alive = true;
    damp = 0.01;
  }
  PVector calcForce(PVector agg) {
    PVector dir = agg.copy().sub(pos).normalize().mult(damp);
    return dir;
  }
  void addForce(PVector force) {
    if (alive) {
      acc.add(force);
      vel.add(acc);
      pos.add(vel);
      acc.mult(0);
    }
  }
  void render() {
    point(pos.x, pos.y);
  }
}
