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
  bd.bullet = true; //careful collision checking
  //
  //BODY ITSELF
  Body body = box2d.createBody(bd); //Creation by passing Body Def
  body.setLinearVelocity(new Vec2(0,3)); ///Setting some Values
  body.setAngularVelocity(1.2); ///Setting some Values
  //
  //Defining a shape
  PolygonShape ps = new PolygonShape();
  float box2Dw = box2d.scalarPixelsToWorld(150); //Escala las dimensiones de Pixeles a mundo, duh
  float box2Dh = box2d.scalarPixelsToWorld(150);
  
  ps.setAsBox(box2Dw, box2Dh); //SET AS BOX, lo define como una caja, con base  a width y height
  
  //FIXTURE 
  FixtureDef fd = new FixtureDef(); //Se define por separado, igual que el Body
  fd.shape = ps; //se le asigna la Polygon Shape
  //algunos parametros que afectan la fisica de la forma 
  fd.friction = 0.3;
  fd.restitution = 0.5;
  fd.density = 1.0;
  
  //ATTACHING
  body.createFixture(fd); //crea fixture y la fija la forma al objeto cuerpo
  //body.createFixture(ps,1); //Para crear fixture y fijar a polygon shape sin especificar parametros a fixture
  
  
  
  
  
}

void draw(){
  box2d.setGravity(0, -10);//PROCESSING Coord-Sys = (0, 10);
  Vec2 center = box2d.coordPixelsToWorld(width/2, height/2);
  bd.position.set(center);
  
  
}