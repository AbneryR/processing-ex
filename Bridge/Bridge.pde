import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;

Box2DProcessing box2d;
BridGen bridge;
ArrayList<Box> boxes;

void setup(){
size(800,600);
box2d = new Box2DProcessing(this);
box2d.createWorld();
bridge = new BridGen(width/4, height/2, width*3/4 );
boxes = new ArrayList<Box>();
}

void draw(){
  
box2d.step();
//////////
background(255);
bridge.display();
for(Box b: boxes)
  b.display();

if(mousePressed){
  boxes.add(new Box(mouseX,mouseY,10,10));
}


  

}