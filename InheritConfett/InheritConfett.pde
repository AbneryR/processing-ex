import java.util.Iterator;

ArrayList<Confetti> confis;

void setup(){
  size(800,600);
  confis = new ArrayList<Confetti>();
  
}

void draw(){
  background(255);
  confis.add(new Confetti(new PVector(mouseX,mouseY)));
  Iterator<Confetti> iter = confis.iterator();
    while(iter.hasNext()){
      Confetti con= iter.next();
      con.run();
      if(con.isDead()){
          iter.remove();
      }
    }
}