import shiffman.box2d.*;
import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d;
BodyDef bd;//body DEFINITION
Body body;

void setup(){
  size(800,600);
  background(255);
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  Vec2 center = new Vec2(width/2, height/2);
  // BODY DEFINITION
  BodyDef bd = new BodyDef();
  bd.fixedRotation = true; //
  bd.linearDamping = 0.8; //Damping aka continously slowing, as if there's friction
  bd.angularDamping = 0.9;
  bd.bullet = true; //carefull collision checking
  //
  //BODY ITSELF
  Body body = box2d.createBody(bd); //Creation by passing Body Def
  body.setLinearVelocity(new Vec2(0,3)); ///Setting some Values
  body.setAngularVelocity(1.2); ///Setting some Values
  //
  
  
}

void draw(){
  box2d.setGravity(0, -10);//PROCESSING Coord-Sys = (0, 10);
  Vec2 center = box2d.coordPixelsToWorld(width/2, height/2);
  bd.position.set(center);
  
  
}