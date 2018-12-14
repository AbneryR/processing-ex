import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;

Box2DProcessing box2d;
ArrayList<Pair> pairs;
void setup(){
size(800,600);
box2d = new Box2DProcessing(this);
box2d.createWorld();
pairs = new ArrayList<Pair>();


}

void draw(){
box2d.step();
//////////
background(255);
for(Pair p: pairs){
  p.display();
}

if (mousePressed){
pairs.add(new Pair(mouseX,mouseY,10));
}



  

}