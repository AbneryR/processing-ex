
import java.util.Iterator;
ParticleSystem ps;
Repeller repeller;
boolean repelerOn = true;

void setup(){
  size(800,600);
  ps = new ParticleSystem(new PVector(width/2, height/4));
  repeller = new Repeller(new PVector(width/2, ps.origin.y+30));
}

void draw(){
  PVector gravity = new PVector(0,0.1);
  background(255);
  ps.applyForce(gravity);
  if(repelerOn){
  ps.applyRepeller(repeller);
  }
  ps.addParticleInOri();
  //ps.addParticle(new PVector(random(width), random(height)));
  repeller.display();
  ps.run();
  text("Haz click",10,10);
  
}

void mousePressed(){
 repelerOn = !repelerOn; 
}