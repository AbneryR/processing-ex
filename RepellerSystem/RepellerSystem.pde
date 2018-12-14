ParticleSystem ps;


void setup(){
  size(800,600);
  background(255);
  ps = new ParticleSystem(new PVector(width/2,height/2));
  for(int i=0;i<200;i++){
  ps.addParticle(new PVector(random(width),random(height)));
  }
}

void draw(){
  background(255);
  ps.run();
}