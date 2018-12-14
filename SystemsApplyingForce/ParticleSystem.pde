import java.util.Iterator;

class ParticleSystem{
  PVector origin;
  ArrayList<Particle> particles;
  
  ParticleSystem(PVector l){
    origin=l.get();
    particles = new ArrayList<Particle>();
  }
  
  void addParticle(){
    particles.add(new Particle(origin));
  }
  
  void applyForce(PVector f){
    for(Particle p:particles){
      p.applyForce(f);
    }
  }
  
  void run(){
    Iterator<Particle> it = particles.iterator();
    
    while(it.hasNext()){
     Particle p =it.next();
     p.run();
     if(p.isDead()){
       it.remove();
     }
    
    }
    
  }

}