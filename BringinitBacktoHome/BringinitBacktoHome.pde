
import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d;
Mover[] movers = new Mover[25];
Attractor a;

void setup(){
  size(800,600);
  smooth();
  
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0,0);
  
  for(int i=0; i<movers.length; i++){
    movers[i]= new Mover(random(8,16), random(width), random(height));
  }
    a= new Attractor(32, width/2, height/2);
  }
  
  void draw(){
   background(255);
   
   //Step through time
   box2d.step();
   a.display();
  for(int i=0; i<movers.length; i++){
    Vec2 force = a.attract(movers[i]);
    movers[i].applyForce(force);
    movers[i].display();
  }
   
}