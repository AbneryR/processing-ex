import java.util.Iterator;

class ParticleSystem{
ArrayList<Particle> particles;
PVector origin;  
  
  ParticleSystem(PVector origin_){  
  particles = new  ArrayList<Particle>();
  origin = origin_;
  }
  
  void addParticle(){
    particles.add(new Particle(origin));
  }
  
  void move(PVector neworigin){
    origin = neworigin;
  }
  void run(){
  Iterator<Particle> iter= particles.iterator();
   
    while (iter.hasNext()){
    Particle p= iter.next();
    p.run();
    if(p.isDead()){
      iter.remove();
    }
   }
  }
  
}