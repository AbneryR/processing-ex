import java.util.Iterator;

class ParticleSystem{

ArrayList<Particle> particles;
PVector origin;
float lifespan;
boolean deaded;
float timer;

  ParticleSystem(PVector origin_){
    particles = new ArrayList<Particle>();
    origin = origin_;
    lifespan=255;
    timer = 255;
  }
  
  void addParticle(){
    particles.add(new Particle(origin));
  }
  
  void run(){
    lifespan-=2;
    Iterator<Particle> it = particles.iterator();
    while(it.hasNext()){
      Particle p = it.next();
      p.run();
      if(p.isDead()){
        it.remove();
      }
    }  
  }
  
  boolean isAlive(){
  if(lifespan>0.0){return true;} 
  else{
  deaded=true;
  return false;
    }
  }
  
  boolean erase(){
  
  if(deaded==true){
    timer-=1;
    if(timer<0)
    return true;
    return false;
    
  }
  else{
  return false;
  }
  
  } 
  
  
}