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
Box floor;
Spring spring;

float dirx=0;
float diry=0;
float n=0;
void setup(){
size(800,600);
box2d = new Box2DProcessing(this);
box2d.createWorld();
//boxes = new ArrayList<Box>();
box = new Box(width/2,height/2, 30,30, true);
floor = new Box(0,height-10,width, 10, false);
spring = new Spring();

n = random(1);
}


void draw(){
background(255);
box2d.step();
///
dirx= map(noise(n), -1, 1, 0, width);
diry= map(noise(n), -1, 1, 0, height);
///
spring.bind(dirx,diry,box);
spring.update(dirx,diry);
spring.display();
box.display();
floor.display();
n+=.01;
}