import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;


Box2DProcessing box2d;
Boundary floor;
Box b;

void setup(){
box2d = new Box2DProcessing(this);
box2d.createWorld();

size(800,600);
b = new Box(width/2,height/2);
floor= new Boundary(0,height-20,600,20);
}

void draw(){
box2d.step();
//
background(255);
b.update(mouseX,mouseY);
b.display();
floor.display();
}