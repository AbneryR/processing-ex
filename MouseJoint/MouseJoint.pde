import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;

Box2DProcessing box2d;
//ArrayList<Box> boxes;
Box box;
Spring spring;


void setup(){
size(800,600);
box2d = new Box2DProcessing(this);
//boxes = new ArrayList<Box>();
box = new Box(width/2,height/2, 30,30);
spring = new Spring();
}


void draw(){
box2d.step();
///
spring.update(mouseX,mouseY);
spring.display();
box.display();
}

void mousePressed(){
if(box.contains(mouseX,mouseY)){
    spring.bind(mouseX,mouseY,box);
  }
}

void mouseReleased(){
  spring.destroy();
}