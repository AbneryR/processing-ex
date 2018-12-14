import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d;
Boundary a, b;
ArrayList<Box> boxes;

void setup(){
  size(800,600);
  background(0);
box2d = new Box2DProcessing(this);
box2d.createWorld();
boxes = new ArrayList<Box>();
a = new Boundary(width/2,200,500,10);
b = new Boundary(20, 500, 500, 100);
}

void draw(){
  box2d.step();
  background(0);
  a.display();
  b.display();
  
  if(mousePressed){
  Box p = new Box(mouseX, mouseY, random(15),random(15));
  boxes.add(p);
  }
  
  for(Box b: boxes)b.display();
}