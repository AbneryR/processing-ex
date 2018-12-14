import java.util.Iterator;
ArrayList<Particle> particles;


void setup(){
  size(800,600);
  particles = new ArrayList<Particle>();

}

void draw(){
  background(255);
  particles.add(new Particle(new PVector(width/2, 50)));//(new Particle(new PVector(mouseX, mouseY)));
  PVector gravity = new PVector(0,.58);
  Iterator<Particle> it = particles.iterator();
  
   while(it.hasNext()){
   Particle p = it.next();
   p.run();
   //PVector mous = PVector.sub(new PVector(mouseX,mouseY),p.loc);
   //mous.normalize();
   //mous.mult(-1);
   //p.applyForce(mous);
   p.applyForce(gravity);
   
   if(p.isDead()){
     it.remove();
     println("removed");}
   
  }
}