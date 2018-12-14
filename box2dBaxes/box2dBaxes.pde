import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.dynamics.*;
import java.util.Iterator;

Box2DProcessing box2d;
ArrayList<Box> boxes;

void setup(){
  size(400,300);
  box2d = new Box2DProcessing(this); 
  box2d.createWorld();
  boxes = new ArrayList<Box>();
}

void draw(){
  box2d.step();//Hace que avance en el tiempo el mundo "físico" 
  background(255);
  
  if(mousePressed){
    Box p = new Box(mouseX, mouseY); //caja p
    boxes.add(p);//al arreglo boxes le agrego la caja p
  }
  for(Box b: boxes){
      b.display();
  }
  
//  Iterator<Box> iterator = boxes.iterator();
//  while(iterator.hasNext()){
//  Box p = iterator.next();
//  Vec2 pos= box2d.getBodyPixelCoord(p.body);
//  if(pos.x>height)p.killBody();
//  }
  }