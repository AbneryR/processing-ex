import java.util.Iterator;

ArrayList<ParticleSystem> partsys;

void setup(){
  size(800,600);
  partsys = new ArrayList<ParticleSystem>();
  partsys.add(new ParticleSystem(new PVector(mouseX,mouseY)));
}

void draw(){
  background(255);
  Iterator<ParticleSystem> iter = partsys.iterator();
    while(iter.hasNext()){
      ParticleSystem con= iter.next();
      con.run();
      con.addParticle();
      con.origin=new PVector(mouseX,mouseY);
      //con.applyForce(new PVector(0,.078));
      //if(con.isDead()){
      //    iter.remove();
      }
    }