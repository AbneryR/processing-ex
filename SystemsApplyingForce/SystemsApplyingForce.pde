
import java.util.Iterator;
ParticleSystem ps;

void setup(){
  size(800,600);
  ps = new ParticleSystem(new PVector(width/2, height/2));
  
}

void draw(){
  PVector gravity = new PVector(0,0.1);
  background(255);
  ps.addParticle();
  ps.run();
  ps.applyForce(gravity);

  
}