import java.util.Iterator;
ArrayList<ParticleSystem> systems;

void setup(){
  size(800,600);
  systems = new ArrayList<ParticleSystem>();
}

void draw(){
  background(255);
  Iterator<ParticleSystem> itera= systems.iterator();
  while(itera.hasNext()){
  ParticleSystem ps = itera.next();
  ps.addParticle();
  ps.run();
  if(ps.noMore()){
    itera.remove();
  }
  }
}

void mousePressed(){
  systems.add(new ParticleSystem(new PVector(mouseX,mouseY)));
}