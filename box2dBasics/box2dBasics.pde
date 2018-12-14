import shiffman.box2d.*;
import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d;

void setup(){
  size(800,600);
  background(255);
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  BodyDef bd = new BodyDef();
  Vec2 center = new Vec2(width/2, height/2);
  
}

void draw(){
  box2d.setGravity(0, -10);//PROCESSING Coord-Sys = (0, 10);
  
  Vec2 mouseWorld = box2d.coordPixelsToWorld(mouseX,mouseY); //contertir coordenadas de pixeles a Mundo Box2d
  Vec2 worldPos = new Vec2(-10, 25);
  Vec2 pixelPos = box2d.coordWorldToPixels(worldPos); //Convertir coordenadas de mundo a coordenada de pixeles
  
  
  ellipse(pixelPos.x, pixelPos.y, 16,16);
  
}