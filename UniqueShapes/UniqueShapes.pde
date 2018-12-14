import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Boundary land;
ArrayList<UniqueShape> sheips;
Box2DProcessing box2d;
UniqueShape u;

void setup(){
  size(800,600);
box2d = new Box2DProcessing(this);
box2d.createWorld();
sheips = new ArrayList<UniqueShape>();
u = new UniqueShape(width/2, height/2);
land = new Boundary();
}

void draw(){
  box2d.step();
  background(255);
  u.display();
  //land.display();
  for(UniqueShape s: sheips){
  s.run();
  }
  
  
  
  for(int i = sheips.size()-1; i>=0;i--){
    UniqueShape u = sheips.get(i);
    if(u.isDead()){
      sheips.remove(i);
    }
  }
  
  
//  if(mousePressed){
  //sheips.add(new UniqueShape(mouseX,mouseY));
 // }

}

void mouseMoved(){
//sheips.add(new UniqueShape(mouseX,mouseY));
}