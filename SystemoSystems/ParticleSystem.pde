import java.util.Iterator;

class ParticleSystem{

ArrayList<Particle> particles;
PVector origin;

  ParticleSystem(PVector origin_){
    particles = new ArrayList<Particle>();
    origin = origin_;
  }
  
  void addParticle(){
    particles.add(new Particle(origin));
  }
  
  void run(){
    Iterator<Particle> it = particles.iterator();
    while(it.hasNext()){
      Particle p = it.next();
      p.run();
      if(p.isDead()){
        it.remove();
      }
    }  
  }
  
  boolean noMore(){
  if
  }
}