import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d;
ArrayList<ComplexForm> beings;
ArrayList<Surface> plats;



void setup(){
size(800,600);  
box2d = new Box2DProcessing(this);
box2d.createWorld();
beings = new ArrayList<ComplexForm>();
plats = new ArrayList<Surface>();

for(int i =0 ; i<5; i++)
plats.add(new Surface(random(width), random(height), random(width), random(50)));

}

void draw(){
box2d.step();
background(255);
for(Surface s: plats){
  s.display();
}

for(ComplexForm c: beings){
  c.run();
}

for(int i = 0; i<beings.size()-1; i++){
  
    
}

if(mousePressed){
  beings.add(new ComplexForm(mouseX,mouseY,10,20,10));
}

}