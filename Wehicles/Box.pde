class Box{
  Body body;
  float x;
  float y;
  float w;
  float h;
  
  Box(float x_, float y_, float w_, float h_){
  x=x_;
  y=y_;
  w=w_;
  h=h_;
  
  BodyDef bd = new BodyDef();
  bd.type = BodyType.DYNAMIC;
  bd.position.set(box2d.coordPixelsToWorld(new Vec2(x,y)));
  body = box2d.createBody(bd);
  
  PolygonShape ps = new PolygonShape();
  float box2dW = box2d.scalarPixelsToWorld(w/2);
  float box2dH = box2d.scalarPixelsToWorld(h/2);
  ps.setAsBox(box2dW,box2dH);
  
  FixtureDef fd = new FixtureDef();
  fd.shape = ps;
  fd.density=1;
  fd.friction= 0.03;
  fd.restitution=0.5;
  
  body.createFixture(ps,1.0);
    
}

  void display(){
    Vec2 pos = new Vec2(box2d.getBodyPixelCoord(body));
    float a = body.getAngle();
    pushMatrix();
    rectMode(CENTER);
    translate(pos.x,pos.y);
    rotate(-a);
    fill(127);
    stroke(0);
    rect(0,0,w,h);
    popMatrix();
  }
  
  
}