class Box{
  Body body;
  float x,y;
  float w,h;
  
  Box(float x_,float y_){
  x=x_;
  y=y_;
  w=24;
  h=24;
  
  makeBody(new Vec2(x,y),w,h);
  }
  
  void killBody(){
    box2d.destroyBody(body);
  }
  
  
  void update(float x_, float y_){
    Vec2 pos = body.getWorldCenter();
    Vec2 target = box2d.coordPixelsToWorld(x_, y_);
    Vec2 v = target.sub(pos);
    body.setLinearVelocity(v);
  }
  
  void display(){
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a  = body.getAngle();
    
    rectMode(CENTER);
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(a);
    fill(127);
    stroke(0);
    strokeWeight(2);
    rect(0,0,w,h);
    popMatrix();
  }
  
  void makeBody(Vec2 pos, float w_, float h_){
  BodyDef bd = new BodyDef();
  bd.type = BodyType.KINEMATIC;
  bd.position.set(box2d.coordPixelsToWorld(pos));
  body = box2d.createBody(bd);
  
  PolygonShape ps = new PolygonShape();
  float box2dW = box2d.scalarPixelsToWorld(w_/2);
  float box2dH = box2d.scalarPixelsToWorld(h_/2);
  ps.setAsBox(box2dW,box2dH);
  
  FixtureDef fd = new FixtureDef();
  fd.shape = ps;
  fd.density = 1;
  fd.friction = 0.5;
  fd.restitution = 0.5;
  
  body.setLinearVelocity(new Vec2(random(-5,5),random(2,5)));
  body.setAngularVelocity(random(-5,5));
  
  }

}