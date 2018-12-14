import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import java.util.Iterator;

Box2DProcessing box2d;
Curvy surface;
ArrayList<Box> circles;

void setup(){
  size(800,600);
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  surface = new Curvy();
  circles = new ArrayList<Box>();
}


void draw(){
  if(mousePressed){
    float size = random(10,20);
    circles.add(new Box(mouseX,mouseY,size));
  }
  
  box2d.step();
  background(255);
  surface.display();
  for(Box b: circles){
    b.run();
  }
  for (int i = circles.size()-1; i>=0; i--){
   Box b = circles.get(i);
   if(b.done()){
   circles.remove(i);
   }
  }   
}