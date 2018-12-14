import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d;
Box b;

void setup(){
size(800,600);
background(255);

box2d = new Box2DProcessing(this);
box2d.createWorld();
box2d.setGravity(0,20);

b= new Box(width/2,height/2, 20,20);
}

void draw(){
box2d.step();
//
background(255);
b.display();


}