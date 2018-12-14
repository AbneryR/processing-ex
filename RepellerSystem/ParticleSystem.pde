import java.util.Iterator;

class ParticleSystem{
  PVector origin;
  ArrayList<Particle> particles;
  
  
  ParticleSystem(PVector orig){
  origin = orig.get();
  particles = new ArrayList<Particle>();
  }
  
  void addParticle(PVector l){
   particles.add(new Particle(l.get()));
  }
  
  void addParticle(){
   particles.add(new Particle(origin));
  }
  
  void run(){
    Iterator<Particle> it = particles.iterator();
    while(it.hasNext()){
      Particle p = it.next();
      p.run();
      for(Particle n: particles){
        p.repel(n);
      }
    }
  }

}