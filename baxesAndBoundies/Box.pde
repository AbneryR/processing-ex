class Box{
Body body;
float w, h;
float r,g,b;

  Box(float x, float y, float w_, float h_){
  w=w_;
  h=h_;
  r=random(255);
  g=random(150);
  b=random(60);
  
  BodyDef bd = new BodyDef();
  bd.type = BodyType.DYNAMIC;
  bd.position.set(box2d.coordPixelsToWorld(x,y));
  
  body= box2d.createBody(bd);
  
  PolygonShape ps = new PolygonShape();
  float box2dW = box2d.scalarPixelsToWorld(w/2);
  float box2dH = box2d.scalarPixelsToWorld(h/2);
  ps.setAsBox(box2dW,box2dH); //el plygono es una caja
  
  FixtureDef fd = new FixtureDef();
  fd.shape = ps;
  fd.density =1;
  fd.restitution =0.5;
  body.createFixture(fd);
  //body.setAngle();
  }
  
  void display(){
  Vec2 pos = box2d.getBodyPixelCoord(body);
  float a = body.getAngle();
  pushMatrix();
  translate(pos.x,pos.y);
  rotate(-a);
  fill(r,g,b);
  stroke(0);
  rectMode(CENTER);
  rect(0,0,w,h);
  popMatrix();

  }
  
  void killBody(){
  box2d.destroyBody(body);
  }

}