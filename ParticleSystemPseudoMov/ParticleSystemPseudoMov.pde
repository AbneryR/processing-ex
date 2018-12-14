
ParticleSystem particlesys;

void setup(){
  size(800,600);
  particlesys= new ParticleSystem(new PVector(width/2, height/2));
}

void draw(){
  background(255);
  //particlesys.origin = new PVector(mouseX,mouseY);
  particlesys.addParticle();
  particlesys.run();
  }
  
void mouseDragged(){
  particlesys.move(new PVector(mouseX,mouseY));
}
  