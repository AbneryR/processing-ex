import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;


Box2DProcessing box2d;
Wehicle car;
Surface sf;

void setup(){
background(255);
size(800,600);  
box2d = new Box2DProcessing(this);
box2d.createWorld();
car = new Wehicle(300,300);
sf = new Surface();
}

void draw(){
background(255);
box2d.step();
//ain
car.display();
sf.display(); 

}