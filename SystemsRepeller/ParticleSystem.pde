import java.util.Iterator;

class ParticleSystem{
  PVector origin;
  ArrayList<Particle> particles;
  
  ParticleSystem(PVector l){
    origin=l.get();
    particles = new ArrayList<Particle>();
  }
  
  void addParticleInOri(){
    particles.add(new Particle(origin));
  }
  
  void addParticle(PVector l){
    particles.add(new Particle(l));
  }
  
  void applyForce(PVector f){
    for(Particle p:particles){
      p.applyForce(f);
    }
  }
  
  void applyRepeller(Repeller rep){
    for(Particle p:particles){
      PVector force = rep.repel(p);
      p.applyForce(force);
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