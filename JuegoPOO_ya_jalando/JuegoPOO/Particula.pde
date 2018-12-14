import java.util.Iterator;

public class Particle{
PVector loc;

  Particle(){
  loc = new PVector(0,0);
  }
  
  Particle(PVector origin){
  loc = origin.get();
  }
  
  void run(){
  update();
  display();
  }
  
  void update(){
  }
  
  void display(){
  stroke(0);
  fill(25, 105,100);
  rect(loc.x,loc.y,10,10);
  }

  

}